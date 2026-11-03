// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProviderRating _$ProviderRatingFromJson(Map<String, dynamic> json) =>
    _ProviderRating(
      avg: (json['avg'] as num?)?.toDouble(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProviderRatingToJson(_ProviderRating instance) =>
    <String, dynamic>{'avg': instance.avg, 'count': instance.count};

_ProviderContact _$ProviderContactFromJson(Map<String, dynamic> json) =>
    _ProviderContact(
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ProviderContactToJson(_ProviderContact instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phone': instance.phone,
      'url': instance.url,
    };

_ServiceProvider _$ServiceProviderFromJson(
  Map<String, dynamic> json,
) => _ServiceProvider(
  id: json['id'] as String,
  type: $enumDecode(_$ProviderTypeEnumMap, json['type']),
  name: json['name'] as String,
  services:
      (json['services'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  countryIds:
      (json['countryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  online: json['online'] as bool?,
  priceFrom: json['priceFrom'] == null
      ? null
      : Money.fromJson(json['priceFrom'] as Map<String, dynamic>),
  verification: $enumDecode(
    _$ServiceProviderVerificationEnumMap,
    json['verification'],
  ),
  rating: json['rating'] == null
      ? null
      : ProviderRating.fromJson(json['rating'] as Map<String, dynamic>),
  contact: json['contact'] == null
      ? null
      : ProviderContact.fromJson(json['contact'] as Map<String, dynamic>),
  provenance: Provenance.fromJson(json['provenance'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ServiceProviderToJson(
  _ServiceProvider instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$ProviderTypeEnumMap[instance.type]!,
  'name': instance.name,
  'services': instance.services,
  'countryIds': instance.countryIds,
  'online': instance.online,
  'priceFrom': instance.priceFrom?.toJson(),
  'verification': _$ServiceProviderVerificationEnumMap[instance.verification]!,
  'rating': instance.rating?.toJson(),
  'contact': instance.contact?.toJson(),
  'provenance': instance.provenance.toJson(),
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

const _$ServiceProviderVerificationEnumMap = {
  ServiceProviderVerification.unverified: 'unverified',
  ServiceProviderVerification.documentsChecked: 'documents_checked',
  ServiceProviderVerification.verified: 'verified',
  ServiceProviderVerification.suspended: 'suspended',
};
