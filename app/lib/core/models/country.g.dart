// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostStudyWork _$PostStudyWorkFromJson(Map<String, dynamic> json) =>
    _PostStudyWork(
      months: (json['months'] as num?)?.toInt(),
      permitId: json['permitId'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$PostStudyWorkToJson(_PostStudyWork instance) =>
    <String, dynamic>{
      'months': instance.months,
      'permitId': instance.permitId,
      'note': instance.note,
    };

_RecognitionBody _$RecognitionBodyFromJson(Map<String, dynamic> json) =>
    _RecognitionBody(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$RecognitionBodyToJson(_RecognitionBody instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};

_Country _$CountryFromJson(Map<String, dynamic> json) => _Country(
  id: json['id'] as String,
  name: Localized.fromJson(json['name'] as Map<String, dynamic>),
  region: $enumDecode(_$CountryRegionEnumMap, json['region']),
  currency: json['currency'] as String,
  languages:
      (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  livingCostMonthly: json['livingCostMonthly'] == null
      ? null
      : MoneyRange.fromJson(json['livingCostMonthly'] as Map<String, dynamic>),
  tuitionNonEu: json['tuitionNonEu'] == null
      ? null
      : MoneyRange.fromJson(json['tuitionNonEu'] as Map<String, dynamic>),
  englishTaughtOffer: $enumDecodeNullable(
    _$CountryEnglishTaughtOfferEnumMap,
    json['englishTaughtOffer'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  postStudyWork: json['postStudyWork'] == null
      ? null
      : PostStudyWork.fromJson(json['postStudyWork'] as Map<String, dynamic>),
  recognitionBody: json['recognitionBody'] == null
      ? null
      : RecognitionBody.fromJson(
          json['recognitionBody'] as Map<String, dynamic>,
        ),
  active: json['active'] as bool?,
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CountryToJson(_Country instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name.toJson(),
  'region': _$CountryRegionEnumMap[instance.region]!,
  'currency': instance.currency,
  'languages': instance.languages,
  'livingCostMonthly': instance.livingCostMonthly?.toJson(),
  'tuitionNonEu': instance.tuitionNonEu?.toJson(),
  'englishTaughtOffer':
      _$CountryEnglishTaughtOfferEnumMap[instance.englishTaughtOffer],
  'postStudyWork': instance.postStudyWork?.toJson(),
  'recognitionBody': instance.recognitionBody?.toJson(),
  'active': instance.active,
  'provenance': instance.provenance.toJson(),
};

const _$CountryRegionEnumMap = {
  CountryRegion.europe: 'europe',
  CountryRegion.africa: 'africa',
  CountryRegion.americas: 'americas',
  CountryRegion.asia: 'asia',
  CountryRegion.oceania: 'oceania',
};

const _$CountryEnglishTaughtOfferEnumMap = {
  CountryEnglishTaughtOffer.low: 'low',
  CountryEnglishTaughtOffer.medium: 'medium',
  CountryEnglishTaughtOffer.high: 'high',
};
