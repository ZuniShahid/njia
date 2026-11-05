// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserEducation _$UserEducationFromJson(Map<String, dynamic> json) =>
    _UserEducation(
      isced: $enumDecodeNullable(
        _$IscedEnumMap,
        json['isced'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      field: json['field'] as String?,
      institution: json['institution'] as String?,
      country: json['country'] as String?,
      gradeScale: json['gradeScale'] as String?,
      grade: json['grade'] as String?,
      year: (json['year'] as num?)?.toInt(),
      status: $enumDecodeNullable(
        _$UserEducationStatusEnumMap,
        json['status'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
    );

Map<String, dynamic> _$UserEducationToJson(_UserEducation instance) =>
    <String, dynamic>{
      'isced': _$IscedEnumMap[instance.isced],
      'field': instance.field,
      'institution': instance.institution,
      'country': instance.country,
      'gradeScale': instance.gradeScale,
      'grade': instance.grade,
      'year': instance.year,
      'status': _$UserEducationStatusEnumMap[instance.status],
    };

const _$IscedEnumMap = {
  Isced.level3: '3',
  Isced.level4: '4',
  Isced.level5: '5',
  Isced.level6: '6',
  Isced.level7: '7',
  Isced.level8: '8',
};

const _$UserEducationStatusEnumMap = {
  UserEducationStatus.inProgress: 'in_progress',
  UserEducationStatus.completed: 'completed',
};

_UserLanguage _$UserLanguageFromJson(Map<String, dynamic> json) =>
    _UserLanguage(
      lang: json['lang'] as String?,
      cefr: $enumDecodeNullable(
        _$CefrEnumMap,
        json['cefr'],
        unknownValue: JsonKey.nullForUndefinedEnumValue,
      ),
      test: json['test'] as String?,
      score: json['score'] as String?,
      testDate: json['testDate'] as String?,
      native: json['native'] as bool?,
    );

Map<String, dynamic> _$UserLanguageToJson(_UserLanguage instance) =>
    <String, dynamic>{
      'lang': instance.lang,
      'cefr': _$CefrEnumMap[instance.cefr],
      'test': instance.test,
      'score': instance.score,
      'testDate': instance.testDate,
      'native': instance.native,
    };

const _$CefrEnumMap = {
  Cefr.a1: 'A1',
  Cefr.a2: 'A2',
  Cefr.b1: 'B1',
  Cefr.b2: 'B2',
  Cefr.c1: 'C1',
  Cefr.c2: 'C2',
};

_UserConsents _$UserConsentsFromJson(Map<String, dynamic> json) =>
    _UserConsents(
      analytics: json['analytics'] as bool?,
      outcomeSharing: json['outcomeSharing'] as bool?,
    );

Map<String, dynamic> _$UserConsentsToJson(_UserConsents instance) =>
    <String, dynamic>{
      'analytics': instance.analytics,
      'outcomeSharing': instance.outcomeSharing,
    };

_UserNotifications _$UserNotificationsFromJson(Map<String, dynamic> json) =>
    _UserNotifications(
      whatsapp: json['whatsapp'] as bool?,
      sms: json['sms'] as bool?,
      email: json['email'] as bool?,
      weekly: json['weekly'] as bool?,
    );

Map<String, dynamic> _$UserNotificationsToJson(_UserNotifications instance) =>
    <String, dynamic>{
      'whatsapp': instance.whatsapp,
      'sms': instance.sms,
      'email': instance.email,
      'weekly': instance.weekly,
    };

_UserExperience _$UserExperienceFromJson(Map<String, dynamic> json) =>
    _UserExperience(
      role: json['role'] as String?,
      where: json['where'] as String?,
      months: (json['months'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserExperienceToJson(_UserExperience instance) =>
    <String, dynamic>{
      'role': instance.role,
      'where': instance.where,
      'months': instance.months,
    };

_HelpPreferences _$HelpPreferencesFromJson(
  Map<String, dynamic> json,
) => _HelpPreferences(
  channel: $enumDecodeNullable(
    _$HelpPreferencesChannelEnumMap,
    json['channel'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  frequency: $enumDecodeNullable(
    _$HelpPreferencesFrequencyEnumMap,
    json['frequency'],
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  ),
  styles:
      (json['styles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  subjects:
      (json['subjects'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  availability:
      (json['availability'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  budgetPerSession: (json['budgetPerSession'] as num?)?.toInt(),
  language: json['language'] as String?,
);

Map<String, dynamic> _$HelpPreferencesToJson(_HelpPreferences instance) =>
    <String, dynamic>{
      'channel': _$HelpPreferencesChannelEnumMap[instance.channel],
      'frequency': _$HelpPreferencesFrequencyEnumMap[instance.frequency],
      'styles': instance.styles,
      'subjects': instance.subjects,
      'availability': instance.availability,
      'budgetPerSession': instance.budgetPerSession,
      'language': instance.language,
    };

const _$HelpPreferencesChannelEnumMap = {
  HelpPreferencesChannel.whatsapp: 'whatsapp',
  HelpPreferencesChannel.sms: 'sms',
  HelpPreferencesChannel.email: 'email',
  HelpPreferencesChannel.app: 'app',
};

const _$HelpPreferencesFrequencyEnumMap = {
  HelpPreferencesFrequency.weekly: 'weekly',
  HelpPreferencesFrequency.biweekly: 'biweekly',
  HelpPreferencesFrequency.monthly: 'monthly',
};

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: json['id'] as String?,
  displayName: json['displayName'] as String?,
  email: json['email'] as String?,
  nationality: json['nationality'] as String?,
  residenceCountry: json['residenceCountry'] as String?,
  birthYear: (json['birthYear'] as num?)?.toInt(),
  education:
      (json['education'] as List<dynamic>?)
          ?.map((e) => UserEducation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  languages:
      (json['languages'] as List<dynamic>?)
          ?.map((e) => UserLanguage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  experienceMonths: (json['experienceMonths'] as num?)?.toInt(),
  interests:
      (json['interests'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  savings: json['savings'] == null
      ? null
      : Money.fromJson(json['savings'] as Map<String, dynamic>),
  monthlySupport: json['monthlySupport'] == null
      ? null
      : Money.fromJson(json['monthlySupport'] as Map<String, dynamic>),
  facts: json['facts'] as Map<String, dynamic>?,
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$UserRoleEnumMap, e))
          .toList() ??
      const [],
  consents: json['consents'] == null
      ? null
      : UserConsents.fromJson(json['consents'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
  phone: json['phone'] as String?,
  city: json['city'] as String?,
  strengths:
      (json['strengths'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  customInterests:
      (json['customInterests'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  customStrengths:
      (json['customStrengths'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  supportSource: json['supportSource'] as String?,
  earliestMoveYear: (json['earliestMoveYear'] as num?)?.toInt(),
  graduationYear: (json['graduationYear'] as num?)?.toInt(),
  passportValidUntil: json['passportValidUntil'] as String?,
  preferredCountryIds:
      (json['preferredCountryIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  constraints: json['constraints'] as String?,
  notifications: json['notifications'] == null
      ? null
      : UserNotifications.fromJson(
          json['notifications'] as Map<String, dynamic>,
        ),
  activeGoalId: json['activeGoalId'] as String?,
  experience:
      (json['experience'] as List<dynamic>?)
          ?.map((e) => UserExperience.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  progress: json['progress'] as Map<String, dynamic>?,
  helpPreferences: json['helpPreferences'] == null
      ? null
      : HelpPreferences.fromJson(
          json['helpPreferences'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'nationality': instance.nationality,
      'residenceCountry': instance.residenceCountry,
      'birthYear': instance.birthYear,
      'education': instance.education.map((e) => e.toJson()).toList(),
      'languages': instance.languages.map((e) => e.toJson()).toList(),
      'experienceMonths': instance.experienceMonths,
      'interests': instance.interests,
      'savings': instance.savings?.toJson(),
      'monthlySupport': instance.monthlySupport?.toJson(),
      'facts': instance.facts,
      'roles': instance.roles.map((e) => _$UserRoleEnumMap[e]!).toList(),
      'consents': instance.consents?.toJson(),
      'createdAt': instance.createdAt,
      'phone': instance.phone,
      'city': instance.city,
      'strengths': instance.strengths,
      'customInterests': instance.customInterests,
      'customStrengths': instance.customStrengths,
      'supportSource': instance.supportSource,
      'earliestMoveYear': instance.earliestMoveYear,
      'graduationYear': instance.graduationYear,
      'passportValidUntil': instance.passportValidUntil,
      'preferredCountryIds': instance.preferredCountryIds,
      'constraints': instance.constraints,
      'notifications': instance.notifications?.toJson(),
      'activeGoalId': instance.activeGoalId,
      'experience': instance.experience.map((e) => e.toJson()).toList(),
      'progress': instance.progress,
      'helpPreferences': instance.helpPreferences?.toJson(),
    };

const _$UserRoleEnumMap = {UserRole.editor: 'editor', UserRole.admin: 'admin'};
