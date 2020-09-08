// GENERATED CODE - DO NOT MODIFY BY HAND

part of tournaments_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentsModel _$TournamentsModelFromJson(Map<String, dynamic> json) {
  return TournamentsModel()
    ..tournaments = (json['tournaments'] as List)
        ?.map((e) => e == null
            ? null
            : TournamentListModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..isLastBatch = json['is_last_batch'] as bool
    ..cursor = json['cursor'] as String;
}

Map<String, dynamic> _$TournamentsModelToJson(TournamentsModel instance) =>
    <String, dynamic>{
      'tournaments': instance.tournaments,
      'is_last_batch': instance.isLastBatch,
      'cursor': instance.cursor,
    };
