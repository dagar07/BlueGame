import 'package:BlueGame/src/Screens/Home/index.dart';
import 'package:BlueGame/src/Screens/Login/index.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/bloc.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/state.dart';
import 'package:BlueGame/src/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticateBloc, AuthenticationState>(
        builder: (context, state) {
      switch (state.authStatus) {
        case AuthenticationStatus.unknown:
        case AuthenticationStatus.authLogout:
        case AuthenticationStatus.unauthenticated:
          return Login();
        case AuthenticationStatus.authLogin:
          return Home();
        default:
          return Login();
      }
    });
  }
}
