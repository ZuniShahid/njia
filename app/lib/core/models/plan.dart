// Hand-written (not generated): users/{uid}/plans/{goalId} in schema/njia.schema.json only types
// `scores`; the shape of steps/costs/gaps/watch is defined by the planning engine
// (functions/src/engine.mjs = lib/core/engine/engine.dart). Keep the three in sync.
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'common.dart';
import 'corridor.dart';
import 'residence_permit.dart';

part 'plan.freezed.dart';
part 'plan.g.dart';

/// Step kinds as written by the engine (`steps[].kind`).
abstract final class PlanStepKind {
  static const prepare = 'prepare';
  static const apply = 'apply';
  static const visa = 'visa';
  static const study = 'study';
  static const work = 'work';
}

/// Cost kinds as written by the engine (`costs[].kind`).
abstract final class PlanCostKind {
  static const fee = 'fee';
  static const tuition = 'tuition';
  static const living = 'living';
}

/// A funding option attached to an "apply" step.
@freezed
abstract class PlanFundingOption with _$PlanFundingOption {
  const factory PlanFundingOption({
    required String id,
    required String name,
    int? difficulty,
    String? closes,
  }) = _PlanFundingOption;

  factory PlanFundingOption.fromJson(Map<String, dynamic> json) => _$PlanFundingOptionFromJson(json);
}

/// One step of the roadmap. Which optional fields are set depends on [kind].
@freezed
abstract class PlanStep with _$PlanStep {
  const factory PlanStep({
    required int order,
    required int startMonth,
    required String kind,
    required String title,
    int? durationMonths,
    // prepare
    String? requirementId,
    /// "gap" or "unknown" for prepare steps.
    String? status,
    String? howToMeet,
    @Default([]) List<ProviderType> providerTypes,
    // apply / study / work
    String? pathwayId,
    String? deadline,
    @Default([]) List<PlanFundingOption> funding,
    String? institution,
    String? city,
    // visa
    String? permitId,
    VisaApplication? applyAt,
    @Default([]) List<PermitChecklistItem> checklist,
    Money? fee,
    Money? fundsProof,
    String? note,
  }) = _PlanStep;

  factory PlanStep.fromJson(Map<String, dynamic> json) => _$PlanStepFromJson(json);
}

/// A cost line. Fees carry [amount], tuition/living carry [min]/[max].
@freezed
abstract class PlanCost with _$PlanCost {
  const factory PlanCost({
    required String label,
    required String kind,
    required int month,
    required String currency,
    double? min,
    double? max,
    double? amount,
    @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? period,
  }) = _PlanCost;

  factory PlanCost.fromJson(Map<String, dynamic> json) => _$PlanCostFromJson(json);
}

@freezed
abstract class PlanGap with _$PlanGap {
  const factory PlanGap({
    required String requirementId,
    /// "gap" or "unknown".
    required String status,
    String? label,
  }) = _PlanGap;

  factory PlanGap.fromJson(Map<String, dynamic> json) => _$PlanGapFromJson(json);
}

/// readiness 0–100 · difficulty 1–5 · realism 0–100 · financeCoverage 0–100 (see docs/architecture.md → Scores).
@freezed
abstract class PlanScores with _$PlanScores {
  const factory PlanScores({
    required int readiness,
    required double difficulty,
    required int realism,
    int? financeCoverage,
  }) = _PlanScores;

  factory PlanScores.fromJson(Map<String, dynamic> json) => _$PlanScoresFromJson(json);
}

/// "Watch out" items: visa travel, local language, closing funding windows.
@freezed
abstract class WatchItem with _$WatchItem {
  const factory WatchItem({
    required String kind,
    required String text,
    String? fundingId,
  }) = _WatchItem;

  factory WatchItem.fromJson(Map<String, dynamic> json) => _$WatchItemFromJson(json);
}

/// Computed roadmap. The server copy (users/{uid}/plans/{goalId}) is canonical; the Dart engine
/// produces the same shape for instant offline previews.
@freezed
abstract class Plan with _$Plan {
  const factory Plan({
    /// Firestore document id (= goalId).
    String? id,
    String? goalId,
    String? corridorId,
    @Default([]) List<String> pathwayIds,
    @Default([]) List<Map<String, dynamic>> phases,
    @Default([]) List<PlanStep> steps,
    @Default(0) int totalMonths,
    @Default([]) List<PlanCost> costs,
    @Default([]) List<PlanGap> gaps,
    required PlanScores scores,
    @Default([]) List<WatchItem> watch,
    /// meta/content.version the plan was computed against (server only).
    String? contentVersion,
    String? computedAt,
  }) = _Plan;

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
