// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'funding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FundingEligibility _$FundingEligibilityFromJson(Map<String, dynamic> json) =>
    _FundingEligibility(
      nationalities:
          (json['nationalities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      isced:
          (json['isced'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$IscedEnumMap, e))
              .toList() ??
          const [],
      fields:
          (json['fields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      maxAge: (json['maxAge'] as num?)?.toInt(),
      minExperienceMonths: (json['minExperienceMonths'] as num?)?.toInt(),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$FundingEligibilityToJson(_FundingEligibility instance) =>
    <String, dynamic>{
      'nationalities': instance.nationalities,
      'isced': instance.isced.map((e) => _$IscedEnumMap[e]!).toList(),
      'fields': instance.fields,
      'maxAge': instance.maxAge,
      'minExperienceMonths': instance.minExperienceMonths,
      'note': instance.note,
    };

const _$IscedEnumMap = {
  Isced.level3: '3',
  Isced.level4: '4',
  Isced.level5: '5',
  Isced.level6: '6',
  Isced.level7: '7',
  Isced.level8: '8',
};

_ApplicationWindow _$ApplicationWindowFromJson(Map<String, dynamic> json) =>
    _ApplicationWindow(
      opens: json['opens'] as String?,
      closes: json['closes'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ApplicationWindowToJson(_ApplicationWindow instance) =>
    <String, dynamic>{
      'opens': instance.opens,
      'closes': instance.closes,
      'note': instance.note,
    };

_Funding _$FundingFromJson(Map<String, dynamic> json) => _Funding(
  id: json['id'] as String,
  type: $enumDecode(_$FundingTypeEnumMap, json['type']),
  name: json['name'] as String,
  funder: json['funder'] as String,
  countryIds:
      (json['countryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  amount: json['amount'] == null
      ? null
      : MoneyRange.fromJson(json['amount'] as Map<String, dynamic>),
  covers:
      (json['covers'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$FundingCoverEnumMap, e))
          .toList() ??
      const [],
  eligibility: FundingEligibility.fromJson(
    json['eligibility'] as Map<String, dynamic>,
  ),
  applicationWindow: json['applicationWindow'] == null
      ? null
      : ApplicationWindow.fromJson(
          json['applicationWindow'] as Map<String, dynamic>,
        ),
  difficulty: (json['difficulty'] as num?)?.toInt(),
  requirementIds:
      (json['requirementIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  howToApply: json['howToApply'] == null
      ? null
      : Localized.fromJson(json['howToApply'] as Map<String, dynamic>),
  url: json['url'] as String?,
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FundingToJson(_Funding instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$FundingTypeEnumMap[instance.type]!,
  'name': instance.name,
  'funder': instance.funder,
  'countryIds': instance.countryIds,
  'amount': instance.amount?.toJson(),
  'covers': instance.covers.map((e) => _$FundingCoverEnumMap[e]!).toList(),
  'eligibility': instance.eligibility.toJson(),
  'applicationWindow': instance.applicationWindow?.toJson(),
  'difficulty': instance.difficulty,
  'requirementIds': instance.requirementIds,
  'howToApply': instance.howToApply?.toJson(),
  'url': instance.url,
  'provenance': instance.provenance.toJson(),
};

const _$FundingTypeEnumMap = {
  FundingType.scholarship: 'scholarship',
  FundingType.grant: 'grant',
  FundingType.loan: 'loan',
  FundingType.blockedAccount: 'blocked_account',
  FundingType.tuitionWaiver: 'tuition_waiver',
  FundingType.workStudy: 'work_study',
  FundingType.insurance: 'insurance',
};

const _$FundingCoverEnumMap = {
  FundingCover.tuition: 'tuition',
  FundingCover.living: 'living',
  FundingCover.travel: 'travel',
  FundingCover.insurance: 'insurance',
  FundingCover.visa: 'visa',
  FundingCover.languageCourse: 'language_course',
};
