library tournament_list_model;

import 'package:json_annotation/json_annotation.dart';

part 'tournament_list_model.g.dart';

@JsonSerializable()
class TournamentListModel {
  String name;

  @JsonKey(name: 'cover_url')
  String coverUrl;

  @JsonKey(name: 'game_name')
  String gameName;

  @JsonKey(name: 'tournament_id')
  String tournamentId;

  TournamentListModel();

  factory TournamentListModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentListModelFromJson(json);

  Map<String, dynamic> toJson() => _$TournamentListModelToJson(this);
}
