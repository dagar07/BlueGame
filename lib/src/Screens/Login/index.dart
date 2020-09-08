import 'package:BlueGame/src/Screens/Login/widgets/LoginForm/index.dart';
import 'package:BlueGame/src/Screens/Login/widgets/LoginFormIcon/index.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginFormIcon(),
            LoginForm(),
            Container(
              width: 200.0,
              child: Image(
                image: AssetImage('assets/images/kisspng-xbox.png'),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/game-bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
