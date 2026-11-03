// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanFundingOption _$PlanFundingOptionFromJson(Map<String, dynamic> json) =>
    _PlanFundingOption(
      id: json['id'] as String,
      name: json['name'] as String,
      difficulty: (json['difficulty'] as num?)?.toInt(),
      closes: json['closes'] as String?,
    );

Map<String, dynamic> _$PlanFundingOptionToJson(_PlanFundingOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'difficulty': instance.difficulty,
      'closes': instance.closes,
    };

_PlanStep _$PlanStepFromJson(Map<String, dynamic> json) => _PlanStep(
  order: (json['order'] as num).toInt(),
  startMonth: (json['startMonth'] as num).toInt(),
  kind: json['kind'] as String,
  title: json['title'] as String,
  durationMonths: (json['durationMonths'] as num?)?.toInt(),
  requirementId: json['requirementId'] as String?,
  status: json['status'] as String?,
  howToMeet: json['howToMeet'] as String?,
  providerTypes:
      (json['providerTypes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$ProviderTypeEnumMap, e))
          .toList() ??
      const [],
  pathwayId: json['pathwayId'] as String?,
  deadline: json['deadline'] as String?,
  funding:
      (json['funding'] as List<dynamic>?)
          ?.map((e) => PlanFundingOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  institution: json['institution'] as String?,
  city: json['city'] as String?,
  permitId: json['permitId'] as String?,
  applyAt: json['applyAt'] == null
      ? null
      : VisaApplication.fromJson(json['applyAt'] as Map<String, dynamic>),
  checklist:
      (json['checklist'] as List<dynamic>?)
          ?.map((e) => PermitChecklistItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  fee: json['fee'] == null
      ? null
      : Money.fromJson(json['fee'] as Map<String, dynamic>),
  fundsProof: json['fundsProof'] == null
      ? null
      : Money.fromJson(json['fundsProof'] as Map<String, dynamic>),
  note: json['note'] as String?,
);

Map<String, dynamic> _$PlanStepToJson(_PlanStep instance) => <String, dynamic>{
  'order': instance.order,
  'startMonth': instance.startMonth,
  'kind': instance.kind,
  'title': instance.title,
  'durationMonths': instance.durationMonths,
  'requirementId': instance.requirementId,
  'status': instance.status,
  'howToMeet': instance.howToMeet,
  'providerTypes': instance.providerTypes
      .map((e) => _$ProviderTypeEnumMap[e]!)
      .toList(),
  'pathwayId': instance.pathwayId,
  'deadline': instance.deadline,
  'funding': instance.funding.map((e) => e.toJson()).toList(),
  'institution': instance.institution,
  'city': instance.city,
  'permitId': instance.permitId,
  'applyAt': instance.applyAt?.toJson(),
  'checklist': instance.checklist.map((e) => e.toJson()).toList(),
  'fee': instance.fee?.toJson(),
  'fundsProof': instance.fundsProof?.toJson(),
  'note': instance.note,
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

_PlanCost _$PlanCostFromJson(Map<String, dynamic> json) => _PlanCost(
  label: json['label'] as String,
  kind: json['kind'] as String,
  month: (json['month'] as num).toInt(),
  currency: json['currency'] as String,
  min: (json['min'] as num?)?.toDouble(),
  max: (json['max'] as num?)?.toDouble(),
  amount: (json['amount'] as num?)?.toDouble(),
  period: $enumDecodeNullable(
    _$MoneyPeriodEnumMap,
    json['period'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
);

Map<String, dynamic> _$PlanCostToJson(_PlanCost instance) => <String, dynamic>{
  'label': instance.label,
  'kind': instance.kind,
  'month': instance.month,
  'currency': instance.currency,
  'min': instance.min,
  'max': instance.max,
  'amount': instance.amount,
  'period': _$MoneyPeriodEnumMap[instance.period],
};

const _$MoneyPeriodEnumMap = {
  MoneyPeriod.once: 'once',
  MoneyPeriod.month: 'month',
  MoneyPeriod.semester: 'semester',
  MoneyPeriod.year: 'year',
};

_PlanGap _$PlanGapFromJson(Map<String, dynamic> json) => _PlanGap(
  requirementId: json['requirementId'] as String,
  status: json['status'] as String,
  label: json['label'] as String?,
);

Map<String, dynamic> _$PlanGapToJson(_PlanGap instance) => <String, dynamic>{
  'requirementId': instance.requirementId,
  'status': instance.status,
  'label': instance.label,
};

_PlanScores _$PlanScoresFromJson(Map<String, dynamic> json) => _PlanScores(
  readiness: (json['readiness'] as num).toInt(),
  difficulty: (json['difficulty'] as num).toDouble(),
  realism: (json['realism'] as num).toInt(),
  financeCoverage: (json['financeCoverage'] as num?)?.toInt(),
);

Map<String, dynamic> _$PlanScoresToJson(_PlanScores instance) =>
    <String, dynamic>{
      'readiness': instance.readiness,
      'difficulty': instance.difficulty,
      'realism': instance.realism,
      'financeCoverage': instance.financeCoverage,
    };

_WatchItem _$WatchItemFromJson(Map<String, dynamic> json) => _WatchItem(
  kind: json['kind'] as String,
  text: json['text'] as String,
  fundingId: json['fundingId'] as String?,
);

Map<String, dynamic> _$WatchItemToJson(_WatchItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'text': instance.text,
      'fundingId': instance.fundingId,
    };

_Plan _$PlanFromJson(Map<String, dynamic> json) => _Plan(
  id: json['id'] as String?,
  goalId: json['goalId'] as String?,
  corridorId: json['corridorId'] as String?,
  pathwayIds:
      (json['pathwayIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  phases:
      (json['phases'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  steps:
      (json['steps'] as List<dynamic>?)
          ?.map((e) => PlanStep.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalMonths: (json['totalMonths'] as num?)?.toInt() ?? 0,
  costs:
      (json['costs'] as List<dynamic>?)
          ?.map((e) => PlanCost.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  gaps:
      (json['gaps'] as List<dynamic>?)
          ?.map((e) => PlanGap.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  scores: PlanScores.fromJson(json['scores'] as Map<String, dynamic>),
  watch:
      (json['watch'] as List<dynamic>?)
          ?.map((e) => WatchItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  contentVersion: json['contentVersion'] as String?,
  computedAt: json['computedAt'] as String?,
);

Map<String, dynamic> _$PlanToJson(_Plan instance) => <String, dynamic>{
  'id': instance.id,
  'goalId': instance.goalId,
  'corridorId': instance.corridorId,
  'pathwayIds': instance.pathwayIds,
  'phases': instance.phases,
  'steps': instance.steps.map((e) => e.toJson()).toList(),
  'totalMonths': instance.totalMonths,
  'costs': instance.costs.map((e) => e.toJson()).toList(),
  'gaps': instance.gaps.map((e) => e.toJson()).toList(),
  'scores': instance.scores.toJson(),
  'watch': instance.watch.map((e) => e.toJson()).toList(),
  'contentVersion': instance.contentVersion,
  'computedAt': instance.computedAt,
};
