import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent(List<String> list) : super();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  LoginButtonPressed({
    @required this.username,
    @required this.password,
  }) : super([username, password]);
  final String username;
  final String password;

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password}';
}
