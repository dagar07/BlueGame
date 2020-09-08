import 'package:BlueGame/src/Screens/Home/model/tournaments_model.dart';
import 'package:BlueGame/src/Screens/Home/service/index.dart';
import 'package:flutter/material.dart';

class HomeRepository {
  HomeApiClient homeApiClient;

  HomeRepository({@required this.homeApiClient});

  Future<TournamentsModel> getTheTournaments(params) async {
    final TournamentsModel tournaments =
        await homeApiClient.getRecommendedTournaments(params);
    return tournaments;
  }
}
