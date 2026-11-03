// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Provenance _$ProvenanceFromJson(Map<String, dynamic> json) => _Provenance(
  sourceId: json['sourceId'] as String,
  sourceUrl: json['sourceUrl'] as String?,
  quote: json['quote'] as String?,
  trust: $enumDecode(_$ProvenanceTrustEnumMap, json['trust']),
  fetchedAt: json['fetchedAt'] as String,
  verifiedAt: json['verifiedAt'] as String?,
  verifiedBy: json['verifiedBy'] as String?,
  validUntil: json['validUntil'] as String?,
  changeRequestId: json['changeRequestId'] as String?,
);

Map<String, dynamic> _$ProvenanceToJson(_Provenance instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'sourceUrl': instance.sourceUrl,
      'quote': instance.quote,
      'trust': _$ProvenanceTrustEnumMap[instance.trust]!,
      'fetchedAt': instance.fetchedAt,
      'verifiedAt': instance.verifiedAt,
      'verifiedBy': instance.verifiedBy,
      'validUntil': instance.validUntil,
      'changeRequestId': instance.changeRequestId,
    };

const _$ProvenanceTrustEnumMap = {
  ProvenanceTrust.official: 'official',
  ProvenanceTrust.api: 'api',
  ProvenanceTrust.partner: 'partner',
  ProvenanceTrust.editorial: 'editorial',
  ProvenanceTrust.community: 'community',
  ProvenanceTrust.estimate: 'estimate',
};

_Money _$MoneyFromJson(Map<String, dynamic> json) => _Money(
  amount: (json['amount'] as num).toDouble(),
  currency: json['currency'] as String,
  period: $enumDecodeNullable(
    _$MoneyPeriodEnumMap,
    json['period'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
);

Map<String, dynamic> _$MoneyToJson(_Money instance) => <String, dynamic>{
  'amount': instance.amount,
  'currency': instance.currency,
  'period': _$MoneyPeriodEnumMap[instance.period],
};

const _$MoneyPeriodEnumMap = {
  MoneyPeriod.once: 'once',
  MoneyPeriod.month: 'month',
  MoneyPeriod.semester: 'semester',
  MoneyPeriod.year: 'year',
};

_MoneyRange _$MoneyRangeFromJson(Map<String, dynamic> json) => _MoneyRange(
  min: (json['min'] as num).toDouble(),
  max: (json['max'] as num).toDouble(),
  currency: json['currency'] as String,
  period: $enumDecodeNullable(
    _$MoneyPeriodEnumMap,
    json['period'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
);

Map<String, dynamic> _$MoneyRangeToJson(_MoneyRange instance) =>
    <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'currency': instance.currency,
      'period': _$MoneyPeriodEnumMap[instance.period],
    };

_Localized _$LocalizedFromJson(Map<String, dynamic> json) =>
    _Localized(en: json['en'] as String);

Map<String, dynamic> _$LocalizedToJson(_Localized instance) =>
    <String, dynamic>{'en': instance.en};
