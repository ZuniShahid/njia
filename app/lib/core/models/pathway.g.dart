// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pathway.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Pathway _$PathwayFromJson(Map<String, dynamic> json) => _Pathway(
  id: json['id'] as String,
  type: $enumDecode(_$PathwayTypeEnumMap, json['type']),
  title: json['title'] as String,
  institution: json['institution'] as String?,
  institutionId: json['institutionId'] as String?,
  countryId: json['countryId'] as String,
  city: json['city'] as String?,
  isced: $enumDecodeNullable(
    _$IscedEnumMap,
    json['isced'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  field: json['field'] as String?,
  languageOfInstruction: json['languageOfInstruction'] as String?,
  durationMonths: (json['durationMonths'] as num?)?.toInt(),
  mode: $enumDecodeNullable(
    _$PathwayModeEnumMap,
    json['mode'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  tuition: json['tuition'] == null
      ? null
      : MoneyRange.fromJson(json['tuition'] as Map<String, dynamic>),
  intakes:
      (json['intakes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  applicationDeadline: json['applicationDeadline'] as String?,
  requirementIds:
      (json['requirementIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  fundingIds:
      (json['fundingIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  leadsToOccupationIds:
      (json['leadsToOccupationIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  unlocksPermitIds:
      (json['unlocksPermitIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  url: json['url'] as String?,
  status: $enumDecodeNullable(
    _$PathwayStatusEnumMap,
    json['status'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PathwayToJson(_Pathway instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$PathwayTypeEnumMap[instance.type]!,
  'title': instance.title,
  'institution': instance.institution,
  'institutionId': instance.institutionId,
  'countryId': instance.countryId,
  'city': instance.city,
  'isced': _$IscedEnumMap[instance.isced],
  'field': instance.field,
  'languageOfInstruction': instance.languageOfInstruction,
  'durationMonths': instance.durationMonths,
  'mode': _$PathwayModeEnumMap[instance.mode],
  'tuition': instance.tuition?.toJson(),
  'intakes': instance.intakes,
  'applicationDeadline': instance.applicationDeadline,
  'requirementIds': instance.requirementIds,
  'fundingIds': instance.fundingIds,
  'leadsToOccupationIds': instance.leadsToOccupationIds,
  'unlocksPermitIds': instance.unlocksPermitIds,
  'url': instance.url,
  'status': _$PathwayStatusEnumMap[instance.status],
  'provenance': instance.provenance.toJson(),
};

const _$PathwayTypeEnumMap = {
  PathwayType.bachelor: 'bachelor',
  PathwayType.master: 'master',
  PathwayType.phd: 'phd',
  PathwayType.vocational: 'vocational',
  PathwayType.course: 'course',
  PathwayType.languageCourse: 'language_course',
  PathwayType.test: 'test',
  PathwayType.internship: 'internship',
  PathwayType.trainee: 'trainee',
  PathwayType.job: 'job',
};

const _$IscedEnumMap = {
  Isced.level3: '3',
  Isced.level4: '4',
  Isced.level5: '5',
  Isced.level6: '6',
  Isced.level7: '7',
  Isced.level8: '8',
};

const _$PathwayModeEnumMap = {
  PathwayMode.onSite: 'on_site',
  PathwayMode.online: 'online',
  PathwayMode.hybrid: 'hybrid',
};

const _$PathwayStatusEnumMap = {
  PathwayStatus.published: 'published',
  PathwayStatus.withdrawn: 'withdrawn',
};
