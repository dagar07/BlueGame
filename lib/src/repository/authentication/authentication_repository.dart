import 'dart:async';

import 'package:BlueGame/src/constants/enums.dart';
import 'package:BlueGame/src/constants/user.dart';
import 'package:BlueGame/src/helpers/secure_storage.dart';
import 'package:flutter/material.dart';

class AuthenticationRepository {
  // this help to expose a stream of the authentication status
  // to the application
  final _ctrl = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unknown;
    yield* _ctrl.stream;
  }

  void addStream(status) {
    _ctrl.add(status);
  }

  void saveAuthrisedUser() {}

  Future<Map<String, String>> logIn({
    @required String username,
    @required String password,
  }) async {
    // here we handling the streams content

    // if status is authlogin that means user it login else may be return
    // unauth status
    if (authrisedUser.containsKey(username) &&
        (authrisedUser[username]) == password) {
      final _secureStorage = SecureStorage();
      // this store the user to secure storage
      await _secureStorage.writeSecureStorage('user', username);
      await Future.delayed(
        Duration(microseconds: 500),
        () => _ctrl.add(AuthenticationStatus.authLogin),
      );

      return {'login': 'success'};
    }

    await Future.delayed(
      Duration(microseconds: 300),
      () => _ctrl.add(AuthenticationStatus.unauthenticated),
    );
    return {'login': 'failed'};
  }

  void logout() {
    // if click on the logout then user gets logout from the app
    // and notify the application about the user status
    // here we can need to remove the auth user token if any
    final _secureStorage = SecureStorage();
    _secureStorage.deletAllSecureStorage();
    _ctrl.add(AuthenticationStatus.authLogout);
  }

  // close the streams if ctrl no longer need
  void dispose() => _ctrl.close();
}
