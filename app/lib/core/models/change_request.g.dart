// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DiffEntry _$DiffEntryFromJson(Map<String, dynamic> json) => _DiffEntry(
  path: json['path'] as String?,
  from: json['from'],
  to: json['to'],
);

Map<String, dynamic> _$DiffEntryToJson(_DiffEntry instance) =>
    <String, dynamic>{
      'path': instance.path,
      'from': instance.from,
      'to': instance.to,
    };

_Evidence _$EvidenceFromJson(Map<String, dynamic> json) => _Evidence(
  url: json['url'] as String?,
  quote: json['quote'] as String?,
  fetchedAt: json['fetchedAt'] as String?,
);

Map<String, dynamic> _$EvidenceToJson(_Evidence instance) => <String, dynamic>{
  'url': instance.url,
  'quote': instance.quote,
  'fetchedAt': instance.fetchedAt,
};

_ReviewDecision _$ReviewDecisionFromJson(Map<String, dynamic> json) =>
    _ReviewDecision(
      uid: json['uid'] as String?,
      channel: $enumDecodeNullable(
        _$ReviewDecisionChannelEnumMap,
        json['channel'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      note: json['note'] as String?,
      decidedAt: json['decidedAt'] as String?,
    );

Map<String, dynamic> _$ReviewDecisionToJson(_ReviewDecision instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'channel': _$ReviewDecisionChannelEnumMap[instance.channel],
      'note': instance.note,
      'decidedAt': instance.decidedAt,
    };

const _$ReviewDecisionChannelEnumMap = {
  ReviewDecisionChannel.email: 'email',
  ReviewDecisionChannel.whatsapp: 'whatsapp',
  ReviewDecisionChannel.adminUi: 'admin_ui',
};

_ChangeRequest _$ChangeRequestFromJson(Map<String, dynamic> json) =>
    _ChangeRequest(
      id: json['id'] as String,
      runId: json['runId'] as String?,
      targetCollection: json['targetCollection'] as String,
      targetId: json['targetId'] as String,
      op: $enumDecode(_$ChangeRequestOpEnumMap, json['op']),
      before: json['before'] as Map<String, dynamic>?,
      after: json['after'] as Map<String, dynamic>,
      diff:
          (json['diff'] as List<dynamic>?)
              ?.map((e) => DiffEntry.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      sourceId: json['sourceId'] as String,
      evidence: json['evidence'] == null
          ? null
          : Evidence.fromJson(json['evidence'] as Map<String, dynamic>),
      extractedBy: json['extractedBy'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
      status: $enumDecode(_$ChangeRequestStatusEnumMap, json['status']),
      reviewer: json['reviewer'] == null
          ? null
          : ReviewDecision.fromJson(json['reviewer'] as Map<String, dynamic>),
      approvalToken: json['approvalToken'] as String?,
      createdAt: json['createdAt'] as String,
      appliedAt: json['appliedAt'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ChangeRequestToJson(_ChangeRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'runId': instance.runId,
      'targetCollection': instance.targetCollection,
      'targetId': instance.targetId,
      'op': _$ChangeRequestOpEnumMap[instance.op]!,
      'before': instance.before,
      'after': instance.after,
      'diff': instance.diff.map((e) => e.toJson()).toList(),
      'sourceId': instance.sourceId,
      'evidence': instance.evidence?.toJson(),
      'extractedBy': instance.extractedBy,
      'confidence': instance.confidence,
      'status': _$ChangeRequestStatusEnumMap[instance.status]!,
      'reviewer': instance.reviewer?.toJson(),
      'approvalToken': instance.approvalToken,
      'createdAt': instance.createdAt,
      'appliedAt': instance.appliedAt,
      'error': instance.error,
    };

const _$ChangeRequestOpEnumMap = {
  ChangeRequestOp.create: 'create',
  ChangeRequestOp.update: 'update',
  ChangeRequestOp.delete: 'delete',
};

const _$ChangeRequestStatusEnumMap = {
  ChangeRequestStatus.pending: 'pending',
  ChangeRequestStatus.approved: 'approved',
  ChangeRequestStatus.rejected: 'rejected',
  ChangeRequestStatus.applied: 'applied',
  ChangeRequestStatus.failed: 'failed',
};
