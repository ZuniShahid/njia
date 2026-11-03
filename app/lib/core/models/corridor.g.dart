// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corridor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VisaApplication _$VisaApplicationFromJson(Map<String, dynamic> json) =>
    _VisaApplication(
      authority: json['authority'] as String?,
      city: json['city'] as String,
      country: json['country'] as String,
      provider: json['provider'] as String?,
      decidedIn: json['decidedIn'] as String?,
      url: json['url'] as String?,
      travelRequired: json['travelRequired'] as bool?,
    );

Map<String, dynamic> _$VisaApplicationToJson(_VisaApplication instance) =>
    <String, dynamic>{
      'authority': instance.authority,
      'city': instance.city,
      'country': instance.country,
      'provider': instance.provider,
      'decidedIn': instance.decidedIn,
      'url': instance.url,
      'travelRequired': instance.travelRequired,
    };

_SchoolLeavingRecognition _$SchoolLeavingRecognitionFromJson(
  Map<String, dynamic> json,
) => _SchoolLeavingRecognition(
  originQualification: json['originQualification'] as String?,
  status: json['status'] as String?,
  note: json['note'] as String?,
  url: json['url'] as String?,
);

Map<String, dynamic> _$SchoolLeavingRecognitionToJson(
  _SchoolLeavingRecognition instance,
) => <String, dynamic>{
  'originQualification': instance.originQualification,
  'status': instance.status,
  'note': instance.note,
  'url': instance.url,
};

_ScoreBase _$ScoreBaseFromJson(Map<String, dynamic> json) => _ScoreBase(
  difficulty: (json['difficulty'] as num?)?.toInt(),
  visaApprovalRate: (json['visaApprovalRate'] as num?)?.toDouble(),
);

Map<String, dynamic> _$ScoreBaseToJson(_ScoreBase instance) =>
    <String, dynamic>{
      'difficulty': instance.difficulty,
      'visaApprovalRate': instance.visaApprovalRate,
    };

_Corridor _$CorridorFromJson(Map<String, dynamic> json) => _Corridor(
  id: json['id'] as String,
  origin: json['origin'] as String,
  destination: json['destination'] as String,
  summary: json['summary'] == null
      ? null
      : Localized.fromJson(json['summary'] as Map<String, dynamic>),
  visaApplication: VisaApplication.fromJson(
    json['visaApplication'] as Map<String, dynamic>,
  ),
  schoolLeavingRecognition: json['schoolLeavingRecognition'] == null
      ? null
      : SchoolLeavingRecognition.fromJson(
          json['schoolLeavingRecognition'] as Map<String, dynamic>,
        ),
  scoreBase: json['scoreBase'] == null
      ? null
      : ScoreBase.fromJson(json['scoreBase'] as Map<String, dynamic>),
  active: json['active'] as bool?,
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CorridorToJson(_Corridor instance) => <String, dynamic>{
  'id': instance.id,
  'origin': instance.origin,
  'destination': instance.destination,
  'summary': instance.summary?.toJson(),
  'visaApplication': instance.visaApplication.toJson(),
  'schoolLeavingRecognition': instance.schoolLeavingRecognition?.toJson(),
  'scoreBase': instance.scoreBase?.toJson(),
  'active': instance.active,
  'provenance': instance.provenance.toJson(),
};
