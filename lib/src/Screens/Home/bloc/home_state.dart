import 'package:BlueGame/src/Screens/Home/model/tournaments_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super();

  @override
  List<Object> get props => props;
}

class TournamentsLoadingState extends HomeState {
  @override
  String toString() => 'TournamentsLoadingState';
}

class TournamentLoadedState extends HomeState {
  final TournamentsModel tournaments;
  final bool isLastBatch;
  final int totalTournaments;

  TournamentLoadedState({
    this.tournaments,
    this.isLastBatch,
    this.totalTournaments,
  }) : super();

  TournamentLoadedState copyWith({
    TournamentsModel tournaments,
    bool isLastBatch,
    int totalTournaments,
  }) {
    return TournamentLoadedState(
      tournaments: tournaments ?? this.tournaments,
      isLastBatch: isLastBatch ?? this.isLastBatch,
      totalTournaments: totalTournaments ?? this.totalTournaments,
    );
  }

  @override
  List<Object> get props => [tournaments, isLastBatch, totalTournaments];

  @override
  String toString() => 'TournamentLoadedState $tournaments';
}

class TournamentErrorState extends HomeState {
  final error;

  TournamentErrorState({this.error}) : super(error);

  @override
  String toString() => 'TournamentErrorState: $error';
}
