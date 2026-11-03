// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'residence_permit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProcessingWeeks _$ProcessingWeeksFromJson(Map<String, dynamic> json) =>
    _ProcessingWeeks(
      min: (json['min'] as num?)?.toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProcessingWeeksToJson(_ProcessingWeeks instance) =>
    <String, dynamic>{'min': instance.min, 'max': instance.max};

_WorkRights _$WorkRightsFromJson(Map<String, dynamic> json) => _WorkRights(
  allowed: json['allowed'] as bool?,
  limit: json['limit'] as String?,
);

Map<String, dynamic> _$WorkRightsToJson(_WorkRights instance) =>
    <String, dynamic>{'allowed': instance.allowed, 'limit': instance.limit};

_PermitChecklistItem _$PermitChecklistItemFromJson(Map<String, dynamic> json) =>
    _PermitChecklistItem(
      id: json['id'] as String?,
      label: json['label'] as String?,
      docType: json['docType'] as String?,
    );

Map<String, dynamic> _$PermitChecklistItemToJson(
  _PermitChecklistItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'label': instance.label,
  'docType': instance.docType,
};

_ResidencePermit _$ResidencePermitFromJson(
  Map<String, dynamic> json,
) => _ResidencePermit(
  id: json['id'] as String,
  countryId: json['countryId'] as String,
  type: $enumDecode(_$PermitTypeEnumMap, json['type']),
  name: Localized.fromJson(json['name'] as Map<String, dynamic>),
  legalBasis: json['legalBasis'] as String?,
  fee: json['fee'] == null
      ? null
      : Money.fromJson(json['fee'] as Map<String, dynamic>),
  processingWeeks: json['processingWeeks'] == null
      ? null
      : ProcessingWeeks.fromJson(
          json['processingWeeks'] as Map<String, dynamic>,
        ),
  fundsProof: json['fundsProof'] == null
      ? null
      : Money.fromJson(json['fundsProof'] as Map<String, dynamic>),
  workRights: json['workRights'] == null
      ? null
      : WorkRights.fromJson(json['workRights'] as Map<String, dynamic>),
  durationMonths: (json['durationMonths'] as num?)?.toInt(),
  requirementIds:
      (json['requirementIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  followOnPermitIds:
      (json['followOnPermitIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  checklist:
      (json['checklist'] as List<dynamic>?)
          ?.map((e) => PermitChecklistItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  url: json['url'] as String?,
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ResidencePermitToJson(_ResidencePermit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'countryId': instance.countryId,
      'type': _$PermitTypeEnumMap[instance.type]!,
      'name': instance.name.toJson(),
      'legalBasis': instance.legalBasis,
      'fee': instance.fee?.toJson(),
      'processingWeeks': instance.processingWeeks?.toJson(),
      'fundsProof': instance.fundsProof?.toJson(),
      'workRights': instance.workRights?.toJson(),
      'durationMonths': instance.durationMonths,
      'requirementIds': instance.requirementIds,
      'followOnPermitIds': instance.followOnPermitIds,
      'checklist': instance.checklist.map((e) => e.toJson()).toList(),
      'url': instance.url,
      'provenance': instance.provenance.toJson(),
    };

const _$PermitTypeEnumMap = {
  PermitType.student: 'student',
  PermitType.languageCourse: 'language_course',
  PermitType.jobSeeker: 'job_seeker',
  PermitType.work: 'work',
  PermitType.blueCard: 'blue_card',
  PermitType.trainee: 'trainee',
  PermitType.researcher: 'researcher',
  PermitType.family: 'family',
};
