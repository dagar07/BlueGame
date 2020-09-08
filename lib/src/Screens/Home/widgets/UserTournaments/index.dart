import 'package:BlueGame/src/constants/colors.dart';
import 'package:flutter/material.dart';

class UserTournaments extends StatelessWidget {
  Widget _renderTextFormat(String count, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.0),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: _renderTextFormat('34', 'Tournaments played'),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    orangeDark,
                    orangeLight,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: _renderTextFormat('09', 'Tournaments won'),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    purpuleDark,
                    purpuleLight,
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: _renderTextFormat('26%', 'Winning percentage'),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    redLightDark,
                    redLight,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
