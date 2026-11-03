// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDocument _$UserDocumentFromJson(Map<String, dynamic> json) =>
    _UserDocument(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      storagePath: json['storagePath'] as String?,
      issuedAt: json['issuedAt'] as String?,
      expiresAt: json['expiresAt'] as String?,
      status: $enumDecodeNullable(
        _$UserDocumentStatusEnumMap,
        json['status'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
    );

Map<String, dynamic> _$UserDocumentToJson(_UserDocument instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'storagePath': instance.storagePath,
      'issuedAt': instance.issuedAt,
      'expiresAt': instance.expiresAt,
      'status': _$UserDocumentStatusEnumMap[instance.status],
    };

const _$UserDocumentStatusEnumMap = {
  UserDocumentStatus.uploaded: 'uploaded',
  UserDocumentStatus.checked: 'checked',
  UserDocumentStatus.expired: 'expired',
};
