import 'dart:async';

import 'package:BlueGame/src/bloc/authentication_bloc/event.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/state.dart';
import 'package:BlueGame/src/constants/enums.dart';
import 'package:BlueGame/src/helpers/secure_storage.dart';
import 'package:BlueGame/src/models/models.dart';
import 'package:BlueGame/src/repository/authentication/index.dart';
import 'package:BlueGame/src/repository/user/index.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AuthenticateBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticateBloc({
    @required AuthenticationRepository authenticationRepository,
    @required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(AuthenticationState.unknown()) {
    _authenticationStatusSubsciption =
        _authenticationRepository.status.listen((authStatus) {
      return add(AuthenticationStatusChanges(authStatus));
    });
  }

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  StreamSubscription<AuthenticationStatus> _authenticationStatusSubsciption;

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AuthenticationStatusChanges) {
      yield await _mapAuthenticationStateChangeToState(event);
    } else if (event is AppStarted) {
      try {
        final _secureStorage = SecureStorage();
        final isLoginUser = await _secureStorage.getSecureStorageKey('user');
        if (isLoginUser != null) {
          _authenticationRepository.addStream(AuthenticationStatus.authLogin);
          yield AuthenticationState.authLogin(User(isLoginUser));
        } else {
          yield AuthenticationState.unknown();
        }
      } catch (e) {}
    } else if (event is AuthenticationLogoutEvent) {
      _authenticationRepository.logout();
    }
  }

  Future<void> close() {
    // used to close the subscription;
    _authenticationStatusSubsciption?.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<AuthenticationState> _mapAuthenticationStateChangeToState(
      AuthenticationStatusChanges event) async {
    switch (event.authStatus) {
      case AuthenticationStatus.unauthenticated:
        return AuthenticationState.unauthenticated();
      case AuthenticationStatus.authLogin:
        final user = await _getUser();
        return user != null
            ? AuthenticationState.authLogin(user)
            : AuthenticationState.unauthenticated();
      default:
        return AuthenticationState.unknown();
    }
  }

  Future<User> _getUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (e) {
      return null;
    }
  }
}
