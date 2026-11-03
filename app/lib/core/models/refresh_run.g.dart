// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_run.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RefreshRun _$RefreshRunFromJson(Map<String, dynamic> json) => _RefreshRun(
  id: json['id'] as String,
  startedAt: json['startedAt'] as String?,
  finishedAt: json['finishedAt'] as String?,
  sourcesChecked: (json['sourcesChecked'] as num?)?.toInt(),
  sourcesChanged: (json['sourcesChanged'] as num?)?.toInt(),
  sourcesFailed: (json['sourcesFailed'] as num?)?.toInt(),
  changeRequestIds:
      (json['changeRequestIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  status: $enumDecodeNullable(
    _$RefreshRunStatusEnumMap,
    json['status'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  notifiedAt: json['notifiedAt'] as String?,
);

Map<String, dynamic> _$RefreshRunToJson(_RefreshRun instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startedAt': instance.startedAt,
      'finishedAt': instance.finishedAt,
      'sourcesChecked': instance.sourcesChecked,
      'sourcesChanged': instance.sourcesChanged,
      'sourcesFailed': instance.sourcesFailed,
      'changeRequestIds': instance.changeRequestIds,
      'status': _$RefreshRunStatusEnumMap[instance.status],
      'notifiedAt': instance.notifiedAt,
    };

const _$RefreshRunStatusEnumMap = {
  RefreshRunStatus.running: 'running',
  RefreshRunStatus.done: 'done',
  RefreshRunStatus.failed: 'failed',
};
