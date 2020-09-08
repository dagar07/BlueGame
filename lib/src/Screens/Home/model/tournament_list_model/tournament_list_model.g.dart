// GENERATED CODE - DO NOT MODIFY BY HAND

part of tournament_list_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentListModel _$TournamentListModelFromJson(Map<String, dynamic> json) {
  return TournamentListModel()
    ..name = json['name'] as String
    ..coverUrl = json['cover_url'] as String
    ..gameName = json['game_name'] as String
    ..tournamentId = json['tournament_id'] as String;
}

Map<String, dynamic> _$TournamentListModelToJson(
        TournamentListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cover_url': instance.coverUrl,
      'game_name': instance.gameName,
      'tournament_id': instance.tournamentId,
    };
