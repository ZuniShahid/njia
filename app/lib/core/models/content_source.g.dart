// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SourceTarget _$SourceTargetFromJson(Map<String, dynamic> json) =>
    _SourceTarget(
      collection: json['collection'] as String?,
      docId: json['docId'] as String?,
      fields:
          (json['fields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SourceTargetToJson(_SourceTarget instance) =>
    <String, dynamic>{
      'collection': instance.collection,
      'docId': instance.docId,
      'fields': instance.fields,
    };

_ContentSource _$ContentSourceFromJson(Map<String, dynamic> json) =>
    _ContentSource(
      id: json['id'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
      type: $enumDecode(_$SourceTypeEnumMap, json['type']),
      license: json['license'] as String?,
      cadenceDays: (json['cadenceDays'] as num).toInt(),
      targets:
          (json['targets'] as List<dynamic>?)
              ?.map((e) => SourceTarget.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      extractor: $enumDecodeNullable(
        _$ContentSourceExtractorEnumMap,
        json['extractor'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      selector: json['selector'] as String?,
      ownerUid: json['ownerUid'] as String?,
      lastFetchedAt: json['lastFetchedAt'] as String?,
      lastCheckedAt: json['lastCheckedAt'] as String?,
      lastHash: json['lastHash'] as String?,
      lastStatus: $enumDecodeNullable(
        _$ContentSourceLastStatusEnumMap,
        json['lastStatus'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$ContentSourceToJson(_ContentSource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'type': _$SourceTypeEnumMap[instance.type]!,
      'license': instance.license,
      'cadenceDays': instance.cadenceDays,
      'targets': instance.targets.map((e) => e.toJson()).toList(),
      'extractor': _$ContentSourceExtractorEnumMap[instance.extractor],
      'selector': instance.selector,
      'ownerUid': instance.ownerUid,
      'lastFetchedAt': instance.lastFetchedAt,
      'lastCheckedAt': instance.lastCheckedAt,
      'lastHash': instance.lastHash,
      'lastStatus': _$ContentSourceLastStatusEnumMap[instance.lastStatus],
      'active': instance.active,
    };

const _$SourceTypeEnumMap = {
  SourceType.official: 'official',
  SourceType.api: 'api',
  SourceType.partner: 'partner',
  SourceType.editorial: 'editorial',
  SourceType.community: 'community',
};

const _$ContentSourceExtractorEnumMap = {
  ContentSourceExtractor.none: 'none',
  ContentSourceExtractor.htmlDiff: 'html_diff',
  ContentSourceExtractor.claudeSchema: 'claude_schema',
  ContentSourceExtractor.api: 'api',
};

const _$ContentSourceLastStatusEnumMap = {
  ContentSourceLastStatus.ok: 'ok',
  ContentSourceLastStatus.changed: 'changed',
  ContentSourceLastStatus.error: 'error',
  ContentSourceLastStatus.never: 'never',
};
