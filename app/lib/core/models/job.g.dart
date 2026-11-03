// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Job _$JobFromJson(Map<String, dynamic> json) => _Job(
  id: json['id'] as String,
  title: json['title'] as String,
  employer: json['employer'] as String?,
  countryId: json['countryId'] as String,
  city: json['city'] as String?,
  occupationId: json['occupationId'] as String?,
  level: $enumDecodeNullable(
    _$JobLevelEnumMap,
    json['level'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  salary: json['salary'] == null
      ? null
      : MoneyRange.fromJson(json['salary'] as Map<String, dynamic>),
  salaryIsEstimate: json['salaryIsEstimate'] as bool?,
  languageRequired: json['languageRequired'] as String?,
  visaSponsorship: $enumDecodeNullable(
    _$JobVisaSponsorshipEnumMap,
    json['visaSponsorship'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  url: json['url'] as String?,
  source: json['source'] as String,
  postedAt: json['postedAt'] as String?,
  expireAt: json['expireAt'] as String,
);

Map<String, dynamic> _$JobToJson(_Job instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'employer': instance.employer,
  'countryId': instance.countryId,
  'city': instance.city,
  'occupationId': instance.occupationId,
  'level': _$JobLevelEnumMap[instance.level],
  'salary': instance.salary?.toJson(),
  'salaryIsEstimate': instance.salaryIsEstimate,
  'languageRequired': instance.languageRequired,
  'visaSponsorship': _$JobVisaSponsorshipEnumMap[instance.visaSponsorship],
  'url': instance.url,
  'source': instance.source,
  'postedAt': instance.postedAt,
  'expireAt': instance.expireAt,
};

const _$JobLevelEnumMap = {
  JobLevel.internship: 'internship',
  JobLevel.entry: 'entry',
  JobLevel.mid: 'mid',
  JobLevel.senior: 'senior',
};

const _$JobVisaSponsorshipEnumMap = {
  JobVisaSponsorship.yes: 'yes',
  JobVisaSponsorship.no: 'no',
  JobVisaSponsorship.unknown: 'unknown',
};
