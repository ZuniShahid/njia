// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalaryBand _$SalaryBandFromJson(Map<String, dynamic> json) => _SalaryBand(
  countryId: json['countryId'] as String,
  region: json['region'] as String?,
  level: $enumDecodeNullable(
    _$SalaryBandLevelEnumMap,
    json['level'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  p25: (json['p25'] as num?)?.toDouble(),
  median: (json['median'] as num?)?.toDouble(),
  p75: (json['p75'] as num?)?.toDouble(),
  currency: json['currency'] as String,
  period: $enumDecodeNullable(
    _$SalaryBandPeriodEnumMap,
    json['period'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  provenance: json['provenance'] == null
      ? null
      : Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SalaryBandToJson(_SalaryBand instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'region': instance.region,
      'level': _$SalaryBandLevelEnumMap[instance.level],
      'p25': instance.p25,
      'median': instance.median,
      'p75': instance.p75,
      'currency': instance.currency,
      'period': _$SalaryBandPeriodEnumMap[instance.period],
      'provenance': instance.provenance?.toJson(),
    };

const _$SalaryBandLevelEnumMap = {
  SalaryBandLevel.entry: 'entry',
  SalaryBandLevel.mid: 'mid',
  SalaryBandLevel.senior: 'senior',
};

const _$SalaryBandPeriodEnumMap = {
  SalaryBandPeriod.month: 'month',
  SalaryBandPeriod.year: 'year',
};

_ShortageEntry _$ShortageEntryFromJson(Map<String, dynamic> json) =>
    _ShortageEntry(
      countryId: json['countryId'] as String?,
      listed: json['listed'] as bool?,
      listName: json['listName'] as String?,
    );

Map<String, dynamic> _$ShortageEntryToJson(_ShortageEntry instance) =>
    <String, dynamic>{
      'countryId': instance.countryId,
      'listed': instance.listed,
      'listName': instance.listName,
    };

_Occupation _$OccupationFromJson(Map<String, dynamic> json) => _Occupation(
  id: json['id'] as String,
  title: Localized.fromJson(json['title'] as Map<String, dynamic>),
  iscoCode: json['iscoCode'] as String?,
  escoUri: json['escoUri'] as String?,
  salaryBands:
      (json['salaryBands'] as List<dynamic>?)
          ?.map((e) => SalaryBand.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  shortage:
      (json['shortage'] as List<dynamic>?)
          ?.map((e) => ShortageEntry.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OccupationToJson(_Occupation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title.toJson(),
      'iscoCode': instance.iscoCode,
      'escoUri': instance.escoUri,
      'salaryBands': instance.salaryBands.map((e) => e.toJson()).toList(),
      'shortage': instance.shortage.map((e) => e.toJson()).toList(),
      'provenance': instance.provenance.toJson(),
    };
