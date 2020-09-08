import 'package:BlueGame/src/constants/enums.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class AuthenticationStatusChanges extends AuthenticationEvent {
  const AuthenticationStatusChanges(this.authStatus);

  final AuthenticationStatus authStatus;

  @override
  List<Object> get props => [authStatus];
}

class AuthenticationLogoutEvent extends AuthenticationEvent {}
