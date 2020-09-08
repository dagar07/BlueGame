import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  Widget _renderRatings() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: [
          Text(
            '2250',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.indigoAccent[700],
            ),
          ),
          SizedBox(width: 4.0),
          Text(
            'Elo rating',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.0),
        border: Border.all(
          color: Colors.indigoAccent[700],
        ),
      ),
    );
  }

  Widget _renderUserRight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tilak',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        _renderRatings(),
      ],
    );
  }

  Widget _renderUserAvatar() {
    return CircleAvatar(
      radius: 50.0,
      backgroundImage: AssetImage('assets/images/pp.jpeg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderUserAvatar(),
        SizedBox(
          width: 20.0,
        ),
        _renderUserRight(),
      ],
    );
  }
}
