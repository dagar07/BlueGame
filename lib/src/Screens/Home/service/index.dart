import 'dart:convert';

import 'package:BlueGame/src/Screens/Home/model/tournaments_model.dart';
import 'package:BlueGame/src/helpers/index.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeApiClient {
  // here we call the to get user recommendation
  // limit=10&status=all // query params
  static const url =
      'http://tournaments-dot-game-tv-prod.uc.r.appspot.com/tournament/api/tournaments_list_v2';

  http.Client httpClient;

  HomeApiClient({
    @required this.httpClient,
  });

  Future<TournamentsModel> getRecommendedTournaments(
      Map<String, String> params) async {
    final queryParams = stringifyQueryParams(params);
    final finalUrl = '$url$queryParams&status=all';
    final response = await httpClient.get(finalUrl);
    if (response.statusCode != 200) {
      throw Exception('Data Not Exist!');
    }
    final tournamentsJson = jsonDecode(response.body);
    final data = tournamentsJson['data'];
    return TournamentsModel.fromJson(data);
  }
}
