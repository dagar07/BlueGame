library tournaments_model;

import 'package:BlueGame/src/Screens/Home/model/tournament_list_model/tournament_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tournaments_model.g.dart';

@JsonSerializable()
class TournamentsModel {
  List<TournamentListModel> tournaments;

  @JsonKey(name: 'is_last_batch')
  bool isLastBatch;

  String cursor;

  TournamentsModel();

  factory TournamentsModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentsModelFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentsModelToJson(this);
}
