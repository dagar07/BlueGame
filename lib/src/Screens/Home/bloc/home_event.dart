import 'package:equatable/equatable.dart';

abstract class HomeEvents extends Equatable {
  HomeEvents([List props = const []]) : super();

  @override
  List<Object> get props => props;
}

class FetchTournamentsEvent extends HomeEvents {
  @override
  String toString() => 'FetchTournamentsEvent';
}
