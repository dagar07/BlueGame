import 'package:BlueGame/src/Screens/Home/bloc/bloc.dart';
import 'package:BlueGame/src/Screens/Home/widgets/UserCard/index.dart';
import 'package:BlueGame/src/Screens/Home/widgets/UserRecommendation/index.dart';
import 'package:BlueGame/src/Screens/Home/widgets/UserTournaments/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetail extends StatefulWidget {
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  HomeBloc _homeBloc;

  @override
  void didChangeDependencies() {
    // .add(FetchTournamentsEvent());
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(FetchTournamentsEvent());
    _scrollController.addListener(_onScroll);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _homeBloc.add(FetchTournamentsEvent());
    }
  }

  Widget _renderLoader() {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: 38.0,
          height: 38.0,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is TournamentsLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TournamentLoadedState) {
          final tournaments = state.tournaments.tournaments;
          Widget loader = state.isLastBatch ? null : _renderLoader();
          Widget recommendedWidget = tournaments.isEmpty
              ? Center(
                  child: Text(
                    'Sorry, We don\'t have any recommendation for you',
                  ),
                )
              : UserRecommended(
                  tournaments: state.tournaments.tournaments,
                );
          return ListView(
            padding: EdgeInsets.all(20.0),
            children: [
              UserCard(),
              SizedBox(height: 20.0),
              UserTournaments(),
              recommendedWidget,
              loader,
            ],
            controller: _scrollController,
          );
        } else if (state is TournamentErrorState) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              'Error!',
              style: TextStyle(color: Colors.red),
              textDirection: TextDirection.ltr,
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
