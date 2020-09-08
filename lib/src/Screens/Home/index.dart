import 'package:BlueGame/src/Screens/Home/bloc/home_bloc.dart';
import 'package:BlueGame/src/Screens/Home/bloc/home_state.dart';
import 'package:BlueGame/src/Screens/Home/widgets/UserDetail/index.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/bloc.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(TournamentsLoadingState()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Flyingwolf',
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.short_text,
              color: Colors.black,
            ),
            onPressed: () {
              // currently handling logout on this click
              BlocProvider.of<AuthenticateBloc>(context).add(
                AuthenticationLogoutEvent(),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: UserDetail(),
      ),
    );
  }
}
