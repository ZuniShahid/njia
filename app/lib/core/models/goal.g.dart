// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Goal _$GoalFromJson(Map<String, dynamic> json) => _Goal(
  id: json['id'] as String?,
  title: json['title'] as String?,
  occupationId: json['occupationId'] as String?,
  countryId: json['countryId'] as String?,
  targetYear: (json['targetYear'] as num?)?.toInt(),
  salaryTarget: json['salaryTarget'] == null
      ? null
      : Money.fromJson(json['salaryTarget'] as Map<String, dynamic>),
  priority: (json['priority'] as num?)?.toInt(),
  pathwayIds:
      (json['pathwayIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$GoalToJson(_Goal instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'occupationId': instance.occupationId,
  'countryId': instance.countryId,
  'targetYear': instance.targetYear,
  'salaryTarget': instance.salaryTarget?.toJson(),
  'priority': instance.priority,
  'pathwayIds': instance.pathwayIds,
  'createdAt': instance.createdAt,
};
