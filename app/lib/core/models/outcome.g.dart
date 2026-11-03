// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outcome.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Outcome _$OutcomeFromJson(Map<String, dynamic> json) => _Outcome(
  id: json['id'] as String?,
  goalId: json['goalId'] as String?,
  pathwayId: json['pathwayId'] as String?,
  kind: $enumDecodeNullable(
    _$OutcomeKindEnumMap,
    json['kind'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  result: $enumDecodeNullable(
    _$OutcomeResultEnumMap,
    json['result'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  date: json['date'] as String?,
);

Map<String, dynamic> _$OutcomeToJson(_Outcome instance) => <String, dynamic>{
  'id': instance.id,
  'goalId': instance.goalId,
  'pathwayId': instance.pathwayId,
  'kind': _$OutcomeKindEnumMap[instance.kind],
  'result': _$OutcomeResultEnumMap[instance.result],
  'date': instance.date,
};

const _$OutcomeKindEnumMap = {
  OutcomeKind.admission: 'admission',
  OutcomeKind.visa: 'visa',
  OutcomeKind.scholarship: 'scholarship',
  OutcomeKind.job: 'job',
};

const _$OutcomeResultEnumMap = {
  OutcomeResult.granted: 'granted',
  OutcomeResult.refused: 'refused',
  OutcomeResult.withdrawn: 'withdrawn',
};
