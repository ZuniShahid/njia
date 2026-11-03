// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trust_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrustAlert _$TrustAlertFromJson(Map<String, dynamic> json) => _TrustAlert(
  id: json['id'] as String,
  title: Localized.fromJson(json['title'] as Map<String, dynamic>),
  pattern: Localized.fromJson(json['pattern'] as Map<String, dynamic>),
  advice: json['advice'] == null
      ? null
      : Localized.fromJson(json['advice'] as Map<String, dynamic>),
  countryIds:
      (json['countryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  severity: $enumDecode(_$TrustAlertSeverityEnumMap, json['severity']),
  url: json['url'] as String?,
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TrustAlertToJson(_TrustAlert instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title.toJson(),
      'pattern': instance.pattern.toJson(),
      'advice': instance.advice?.toJson(),
      'countryIds': instance.countryIds,
      'severity': _$TrustAlertSeverityEnumMap[instance.severity]!,
      'url': instance.url,
      'provenance': instance.provenance.toJson(),
    };

const _$TrustAlertSeverityEnumMap = {
  TrustAlertSeverity.info: 'info',
  TrustAlertSeverity.warning: 'warning',
  TrustAlertSeverity.critical: 'critical',
};
