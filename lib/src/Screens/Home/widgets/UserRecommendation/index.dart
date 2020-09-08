import 'package:BlueGame/src/Screens/Home/model/tournament_list_model/tournament_list_model.dart';
import 'package:flutter/material.dart';

class UserRecommended extends StatelessWidget {
  UserRecommended({Key key, @required this.tournaments}) : super(key: key);
  final List<TournamentListModel> tournaments;

  Widget _renderImageBg(url) {
    return Container(
      height: 140.0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
    );
  }

  Widget _renderCardContent(TournamentListModel tournament) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250.0,
            child: Text(
              tournament.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            tournament.gameName,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _renderCard() {
    List<Widget> cards = [];
    for (var item in tournaments) {
      cards.add(
        Card(
          key: ValueKey(item.tournamentId),
          margin: EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _renderImageBg(item.coverUrl),
              _renderCardContent(item),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          elevation: 4.0,
        ),
      );
    }

    return cards;
  }

  Widget _renderData() {
    return Column(
      children: _renderCard(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 20.0),
        Text(
          'Recommended for you',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20.0),
        _renderData(),
      ],
    );
  }
}
