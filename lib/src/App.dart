import 'package:BlueGame/src/Screens/Home/index.dart';
import 'package:BlueGame/src/Screens/Login/bloc/login_bloc.dart';
import 'package:BlueGame/src/Screens/Screens.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/bloc.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/event.dart';
import 'package:BlueGame/src/repository/authentication/index.dart';
import 'package:BlueGame/src/repository/user/user_repository.dart';
import 'package:BlueGame/src/routes/index.dart';
import 'package:BlueGame/src/theme/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  final UserRepository userRepository = UserRepository();
  final AuthenticationRepository authenticationRepository =
      AuthenticationRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticateBloc>(
          create: (context) {
            return AuthenticateBloc(
                authenticationRepository: authenticationRepository,
                userRepository: userRepository)
              ..add(AppStarted());
          },
        ),
        BlocProvider<LoginBloc>(
          create: (context) {
            return LoginBloc(
              authenticationBloc: BlocProvider.of<AuthenticateBloc>(context),
              authenticationRepository: authenticationRepository,
            );
          },
        )
      ],
      child: MaterialApp(
        title: 'BlueGame',
        theme: appThemeData(),
        home: Screens(),
        routes: routes,
      ),
    );
  }
}
