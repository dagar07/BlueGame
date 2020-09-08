import 'package:flutter/material.dart';

class Splase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.network('https://cdn.game.tv/game-tv.png'),
      ),
    );
  }
}
