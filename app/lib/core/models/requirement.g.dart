// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requirement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Requirement _$RequirementFromJson(Map<String, dynamic> json) => _Requirement(
  id: json['id'] as String,
  type: $enumDecode(_$RequirementTypeEnumMap, json['type']),
  label: Localized.fromJson(json['label'] as Map<String, dynamic>),
  key: json['key'] as String?,
  operator: $enumDecodeNullable(
    _$RequirementOperatorEnumMap,
    json['operator'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  value: json['value'],
  cefr: $enumDecodeNullable(
    _$CefrEnumMap,
    json['cefr'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  money: json['money'] == null
      ? null
      : Money.fromJson(json['money'] as Map<String, dynamic>),
  evidenceDocType: json['evidenceDocType'] as String?,
  validityMonths: (json['validityMonths'] as num?)?.toInt(),
  howToMeet: json['howToMeet'] == null
      ? null
      : Localized.fromJson(json['howToMeet'] as Map<String, dynamic>),
  providerTypes:
      (json['providerTypes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ProviderTypeEnumMap, e))
          .toList() ??
      const [],
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RequirementToJson(_Requirement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RequirementTypeEnumMap[instance.type]!,
      'label': instance.label.toJson(),
      'key': instance.key,
      'operator': _$RequirementOperatorEnumMap[instance.operator],
      'value': instance.value,
      'cefr': _$CefrEnumMap[instance.cefr],
      'money': instance.money?.toJson(),
      'evidenceDocType': instance.evidenceDocType,
      'validityMonths': instance.validityMonths,
      'howToMeet': instance.howToMeet?.toJson(),
      'providerTypes': instance.providerTypes
          .map((e) => _$ProviderTypeEnumMap[e]!)
          .toList(),
      'provenance': instance.provenance.toJson(),
    };

const _$RequirementTypeEnumMap = {
  RequirementType.languageTest: 'language_test',
  RequirementType.degree: 'degree',
  RequirementType.grade: 'grade',
  RequirementType.recognition: 'recognition',
  RequirementType.funds: 'funds',
  RequirementType.experience: 'experience',
  RequirementType.document: 'document',
  RequirementType.age: 'age',
  RequirementType.insurance: 'insurance',
  RequirementType.admission: 'admission',
  RequirementType.exam: 'exam',
  RequirementType.other: 'other',
};

const _$RequirementOperatorEnumMap = {
  RequirementOperator.gte: '>=',
  RequirementOperator.lte: '<=',
  RequirementOperator.eq: '==',
  RequirementOperator.inList: 'in',
  RequirementOperator.exists: 'exists',
};

const _$CefrEnumMap = {
  Cefr.a1: 'A1',
  Cefr.a2: 'A2',
  Cefr.b1: 'B1',
  Cefr.b2: 'B2',
  Cefr.c1: 'C1',
  Cefr.c2: 'C2',
};

const _$ProviderTypeEnumMap = {
  ProviderType.tutor: 'tutor',
  ProviderType.languageSchool: 'language_school',
  ProviderType.testCentre: 'test_centre',
  ProviderType.coach: 'coach',
  ProviderType.agency: 'agency',
  ProviderType.universityOffice: 'university_office',
  ProviderType.ngo: 'ngo',
};
