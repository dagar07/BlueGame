import 'package:BlueGame/src/Screens/Home/bloc/bloc.dart';
import 'package:BlueGame/src/Screens/Home/repository/index.dart';
import 'package:BlueGame/src/Screens/Home/service/index.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  HomeRepository _homeRepository = HomeRepository(
    homeApiClient: HomeApiClient(httpClient: http.Client()),
  );

  HomeBloc(HomeState initialState) : super(TournamentsLoadingState());

  @override
  Stream<Transition<HomeEvents, HomeState>> transformEvents(
    Stream<HomeEvents> events,
    transitionFn,
  ) {
    // this function used to control the scrolling nature
    // so that we can control api call on scroll
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<HomeState> mapEventToState(HomeEvents event) async* {
    final currentState = state;
    if (event is FetchTournamentsEvent) {
      try {
        if (currentState is TournamentsLoadingState) {
          // this is calling at initial load so we don't send the cursor
          final tournaments =
              await _homeRepository.getTheTournaments({'limit': '10'});
          yield TournamentLoadedState(
            tournaments: tournaments,
            isLastBatch: tournaments.isLastBatch,
            totalTournaments: tournaments.tournaments.length,
          );
        }

        if (currentState is TournamentLoadedState &&
            !currentState.tournaments.isLastBatch) {
          final limits = '10';
          // this cursor help to return the next 10 result from the server db
          final cursor = currentState.tournaments.cursor;
          final currentTournaments = currentState.tournaments.tournaments;
          final tournaments = await _homeRepository.getTheTournaments({
            'limit': '$limits',
            'cursor': cursor,
          });
          // adding the new tournaments to old one
          // so that we can easily access those tournaments
          // during render from the first one
          currentTournaments.addAll(tournaments.tournaments);
          tournaments.tournaments = currentTournaments;
          yield tournaments.tournaments.isEmpty
              ? currentState.copyWith(isLastBatch: true)
              : TournamentLoadedState(
                  tournaments: tournaments,
                  isLastBatch: tournaments.isLastBatch,
                  totalTournaments: tournaments.tournaments.length,
                );
        }
      } catch (e) {
        yield TournamentErrorState(error: e);
      }
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // this help in debuging during development phase
    print('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
