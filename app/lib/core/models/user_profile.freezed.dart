// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserEducation {

@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Isced? get isced; String? get field; String? get institution; String? get country; String? get gradeScale; String? get grade; int? get year;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserEducationStatus? get status;
/// Create a copy of UserEducation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserEducationCopyWith<UserEducation> get copyWith => _$UserEducationCopyWithImpl<UserEducation>(this as UserEducation, _$identity);

  /// Serializes this UserEducation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserEducation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserEducation&&(identical(other.isced, _this.isced) || other.isced == _this.isced)&&(identical(other.field, _this.field) || other.field == _this.field)&&(identical(other.institution, _this.institution) || other.institution == _this.institution)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.gradeScale, _this.gradeScale) || other.gradeScale == _this.gradeScale)&&(identical(other.grade, _this.grade) || other.grade == _this.grade)&&(identical(other.year, _this.year) || other.year == _this.year)&&(identical(other.status, _this.status) || other.status == _this.status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserEducation;
  return Object.hash(runtimeType,_this.isced,_this.field,_this.institution,_this.country,_this.gradeScale,_this.grade,_this.year,_this.status);
}

@override
String toString() {
  final _this = this as UserEducation;
  return 'UserEducation(isced: ${_this.isced}, field: ${_this.field}, institution: ${_this.institution}, country: ${_this.country}, gradeScale: ${_this.gradeScale}, grade: ${_this.grade}, year: ${_this.year}, status: ${_this.status})';
}


}

/// @nodoc
abstract mixin class $UserEducationCopyWith<$Res>  {
  factory $UserEducationCopyWith(UserEducation value, $Res Function(UserEducation) _then) = _$UserEducationCopyWithImpl;
@useResult
$Res call({
@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Isced? isced, String? field, String? institution, String? country, String? gradeScale, String? grade, int? year,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserEducationStatus? status
});




}
/// @nodoc
class _$UserEducationCopyWithImpl<$Res>
    implements $UserEducationCopyWith<$Res> {
  _$UserEducationCopyWithImpl(this._self, this._then);

  final UserEducation _self;
  final $Res Function(UserEducation) _then;

/// Create a copy of UserEducation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isced = freezed,Object? field = freezed,Object? institution = freezed,Object? country = freezed,Object? gradeScale = freezed,Object? grade = freezed,Object? year = freezed,Object? status = freezed,}) {
  return _then(UserEducation(
isced: freezed == isced ? _self.isced : isced // ignore: cast_nullable_to_non_nullable
as Isced?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,gradeScale: freezed == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserEducationStatus?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserEducation].
extension UserEducationPatterns on UserEducation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserEducation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserEducation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserEducation value)  $default,){
final _that = this;
switch (_that) {
case _UserEducation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserEducation value)?  $default,){
final _that = this;
switch (_that) {
case _UserEducation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Isced? isced,  String? field,  String? institution,  String? country,  String? gradeScale,  String? grade,  int? year, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserEducationStatus? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserEducation() when $default != null:
return $default(_that.isced,_that.field,_that.institution,_that.country,_that.gradeScale,_that.grade,_that.year,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Isced? isced,  String? field,  String? institution,  String? country,  String? gradeScale,  String? grade,  int? year, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserEducationStatus? status)  $default,) {final _that = this;
switch (_that) {
case _UserEducation():
return $default(_that.isced,_that.field,_that.institution,_that.country,_that.gradeScale,_that.grade,_that.year,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Isced? isced,  String? field,  String? institution,  String? country,  String? gradeScale,  String? grade,  int? year, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserEducationStatus? status)?  $default,) {final _that = this;
switch (_that) {
case _UserEducation() when $default != null:
return $default(_that.isced,_that.field,_that.institution,_that.country,_that.gradeScale,_that.grade,_that.year,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserEducation implements UserEducation {
  const _UserEducation({@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.isced, this.field, this.institution, this.country, this.gradeScale, this.grade, this.year, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status});
  factory _UserEducation.fromJson(Map<String, dynamic> json) => _$UserEducationFromJson(json);

@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  Isced? isced;
@override final  String? field;
@override final  String? institution;
@override final  String? country;
@override final  String? gradeScale;
@override final  String? grade;
@override final  int? year;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  UserEducationStatus? status;

/// Create a copy of UserEducation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserEducationCopyWith<_UserEducation> get copyWith => __$UserEducationCopyWithImpl<_UserEducation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserEducationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserEducation&&(identical(other.isced, isced) || other.isced == isced)&&(identical(other.field, field) || other.field == field)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.country, country) || other.country == country)&&(identical(other.gradeScale, gradeScale) || other.gradeScale == gradeScale)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.year, year) || other.year == year)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,isced,field,institution,country,gradeScale,grade,year,status);
}

@override
String toString() {
    return 'UserEducation(isced: $isced, field: $field, institution: $institution, country: $country, gradeScale: $gradeScale, grade: $grade, year: $year, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UserEducationCopyWith<$Res> implements $UserEducationCopyWith<$Res> {
  factory _$UserEducationCopyWith(_UserEducation value, $Res Function(_UserEducation) _then) = __$UserEducationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Isced? isced, String? field, String? institution, String? country, String? gradeScale, String? grade, int? year,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserEducationStatus? status
});




}
/// @nodoc
class __$UserEducationCopyWithImpl<$Res>
    implements _$UserEducationCopyWith<$Res> {
  __$UserEducationCopyWithImpl(this._self, this._then);

  final _UserEducation _self;
  final $Res Function(_UserEducation) _then;

/// Create a copy of UserEducation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isced = freezed,Object? field = freezed,Object? institution = freezed,Object? country = freezed,Object? gradeScale = freezed,Object? grade = freezed,Object? year = freezed,Object? status = freezed,}) {
  return _then(_UserEducation(
isced: freezed == isced ? _self.isced : isced // ignore: cast_nullable_to_non_nullable
as Isced?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,gradeScale: freezed == gradeScale ? _self.gradeScale : gradeScale // ignore: cast_nullable_to_non_nullable
as String?,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String?,year: freezed == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserEducationStatus?,
  ));
}


}


/// @nodoc
mixin _$UserLanguage {

 String? get lang;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Cefr? get cefr; String? get test; String? get score; String? get testDate; bool? get native;
/// Create a copy of UserLanguage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserLanguageCopyWith<UserLanguage> get copyWith => _$UserLanguageCopyWithImpl<UserLanguage>(this as UserLanguage, _$identity);

  /// Serializes this UserLanguage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserLanguage;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserLanguage&&(identical(other.lang, _this.lang) || other.lang == _this.lang)&&(identical(other.cefr, _this.cefr) || other.cefr == _this.cefr)&&(identical(other.test, _this.test) || other.test == _this.test)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.testDate, _this.testDate) || other.testDate == _this.testDate)&&(identical(other.native, _this.native) || other.native == _this.native));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserLanguage;
  return Object.hash(runtimeType,_this.lang,_this.cefr,_this.test,_this.score,_this.testDate,_this.native);
}

@override
String toString() {
  final _this = this as UserLanguage;
  return 'UserLanguage(lang: ${_this.lang}, cefr: ${_this.cefr}, test: ${_this.test}, score: ${_this.score}, testDate: ${_this.testDate}, native: ${_this.native})';
}


}

/// @nodoc
abstract mixin class $UserLanguageCopyWith<$Res>  {
  factory $UserLanguageCopyWith(UserLanguage value, $Res Function(UserLanguage) _then) = _$UserLanguageCopyWithImpl;
@useResult
$Res call({
 String? lang,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Cefr? cefr, String? test, String? score, String? testDate, bool? native
});




}
/// @nodoc
class _$UserLanguageCopyWithImpl<$Res>
    implements $UserLanguageCopyWith<$Res> {
  _$UserLanguageCopyWithImpl(this._self, this._then);

  final UserLanguage _self;
  final $Res Function(UserLanguage) _then;

/// Create a copy of UserLanguage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lang = freezed,Object? cefr = freezed,Object? test = freezed,Object? score = freezed,Object? testDate = freezed,Object? native = freezed,}) {
  return _then(UserLanguage(
lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,cefr: freezed == cefr ? _self.cefr : cefr // ignore: cast_nullable_to_non_nullable
as Cefr?,test: freezed == test ? _self.test : test // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as String?,testDate: freezed == testDate ? _self.testDate : testDate // ignore: cast_nullable_to_non_nullable
as String?,native: freezed == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserLanguage].
extension UserLanguagePatterns on UserLanguage {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserLanguage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserLanguage() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserLanguage value)  $default,){
final _that = this;
switch (_that) {
case _UserLanguage():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserLanguage value)?  $default,){
final _that = this;
switch (_that) {
case _UserLanguage() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? lang, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Cefr? cefr,  String? test,  String? score,  String? testDate,  bool? native)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserLanguage() when $default != null:
return $default(_that.lang,_that.cefr,_that.test,_that.score,_that.testDate,_that.native);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? lang, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Cefr? cefr,  String? test,  String? score,  String? testDate,  bool? native)  $default,) {final _that = this;
switch (_that) {
case _UserLanguage():
return $default(_that.lang,_that.cefr,_that.test,_that.score,_that.testDate,_that.native);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? lang, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Cefr? cefr,  String? test,  String? score,  String? testDate,  bool? native)?  $default,) {final _that = this;
switch (_that) {
case _UserLanguage() when $default != null:
return $default(_that.lang,_that.cefr,_that.test,_that.score,_that.testDate,_that.native);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserLanguage implements UserLanguage {
  const _UserLanguage({this.lang, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.cefr, this.test, this.score, this.testDate, this.native});
  factory _UserLanguage.fromJson(Map<String, dynamic> json) => _$UserLanguageFromJson(json);

@override final  String? lang;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  Cefr? cefr;
@override final  String? test;
@override final  String? score;
@override final  String? testDate;
@override final  bool? native;

/// Create a copy of UserLanguage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserLanguageCopyWith<_UserLanguage> get copyWith => __$UserLanguageCopyWithImpl<_UserLanguage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserLanguageToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserLanguage&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.cefr, cefr) || other.cefr == cefr)&&(identical(other.test, test) || other.test == test)&&(identical(other.score, score) || other.score == score)&&(identical(other.testDate, testDate) || other.testDate == testDate)&&(identical(other.native, native) || other.native == native));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,lang,cefr,test,score,testDate,native);
}

@override
String toString() {
    return 'UserLanguage(lang: $lang, cefr: $cefr, test: $test, score: $score, testDate: $testDate, native: $native)';
}


}

/// @nodoc
abstract mixin class _$UserLanguageCopyWith<$Res> implements $UserLanguageCopyWith<$Res> {
  factory _$UserLanguageCopyWith(_UserLanguage value, $Res Function(_UserLanguage) _then) = __$UserLanguageCopyWithImpl;
@override @useResult
$Res call({
 String? lang,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Cefr? cefr, String? test, String? score, String? testDate, bool? native
});




}
/// @nodoc
class __$UserLanguageCopyWithImpl<$Res>
    implements _$UserLanguageCopyWith<$Res> {
  __$UserLanguageCopyWithImpl(this._self, this._then);

  final _UserLanguage _self;
  final $Res Function(_UserLanguage) _then;

/// Create a copy of UserLanguage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lang = freezed,Object? cefr = freezed,Object? test = freezed,Object? score = freezed,Object? testDate = freezed,Object? native = freezed,}) {
  return _then(_UserLanguage(
lang: freezed == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String?,cefr: freezed == cefr ? _self.cefr : cefr // ignore: cast_nullable_to_non_nullable
as Cefr?,test: freezed == test ? _self.test : test // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as String?,testDate: freezed == testDate ? _self.testDate : testDate // ignore: cast_nullable_to_non_nullable
as String?,native: freezed == native ? _self.native : native // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$UserConsents {

 bool? get analytics; bool? get outcomeSharing;
/// Create a copy of UserConsents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserConsentsCopyWith<UserConsents> get copyWith => _$UserConsentsCopyWithImpl<UserConsents>(this as UserConsents, _$identity);

  /// Serializes this UserConsents to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserConsents;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserConsents&&(identical(other.analytics, _this.analytics) || other.analytics == _this.analytics)&&(identical(other.outcomeSharing, _this.outcomeSharing) || other.outcomeSharing == _this.outcomeSharing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserConsents;
  return Object.hash(runtimeType,_this.analytics,_this.outcomeSharing);
}

@override
String toString() {
  final _this = this as UserConsents;
  return 'UserConsents(analytics: ${_this.analytics}, outcomeSharing: ${_this.outcomeSharing})';
}


}

/// @nodoc
abstract mixin class $UserConsentsCopyWith<$Res>  {
  factory $UserConsentsCopyWith(UserConsents value, $Res Function(UserConsents) _then) = _$UserConsentsCopyWithImpl;
@useResult
$Res call({
 bool? analytics, bool? outcomeSharing
});




}
/// @nodoc
class _$UserConsentsCopyWithImpl<$Res>
    implements $UserConsentsCopyWith<$Res> {
  _$UserConsentsCopyWithImpl(this._self, this._then);

  final UserConsents _self;
  final $Res Function(UserConsents) _then;

/// Create a copy of UserConsents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? analytics = freezed,Object? outcomeSharing = freezed,}) {
  return _then(UserConsents(
analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as bool?,outcomeSharing: freezed == outcomeSharing ? _self.outcomeSharing : outcomeSharing // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserConsents].
extension UserConsentsPatterns on UserConsents {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserConsents value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserConsents() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserConsents value)  $default,){
final _that = this;
switch (_that) {
case _UserConsents():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserConsents value)?  $default,){
final _that = this;
switch (_that) {
case _UserConsents() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? analytics,  bool? outcomeSharing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserConsents() when $default != null:
return $default(_that.analytics,_that.outcomeSharing);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? analytics,  bool? outcomeSharing)  $default,) {final _that = this;
switch (_that) {
case _UserConsents():
return $default(_that.analytics,_that.outcomeSharing);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? analytics,  bool? outcomeSharing)?  $default,) {final _that = this;
switch (_that) {
case _UserConsents() when $default != null:
return $default(_that.analytics,_that.outcomeSharing);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserConsents implements UserConsents {
  const _UserConsents({this.analytics, this.outcomeSharing});
  factory _UserConsents.fromJson(Map<String, dynamic> json) => _$UserConsentsFromJson(json);

@override final  bool? analytics;
@override final  bool? outcomeSharing;

/// Create a copy of UserConsents
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserConsentsCopyWith<_UserConsents> get copyWith => __$UserConsentsCopyWithImpl<_UserConsents>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserConsentsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserConsents&&(identical(other.analytics, analytics) || other.analytics == analytics)&&(identical(other.outcomeSharing, outcomeSharing) || other.outcomeSharing == outcomeSharing));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,analytics,outcomeSharing);
}

@override
String toString() {
    return 'UserConsents(analytics: $analytics, outcomeSharing: $outcomeSharing)';
}


}

/// @nodoc
abstract mixin class _$UserConsentsCopyWith<$Res> implements $UserConsentsCopyWith<$Res> {
  factory _$UserConsentsCopyWith(_UserConsents value, $Res Function(_UserConsents) _then) = __$UserConsentsCopyWithImpl;
@override @useResult
$Res call({
 bool? analytics, bool? outcomeSharing
});




}
/// @nodoc
class __$UserConsentsCopyWithImpl<$Res>
    implements _$UserConsentsCopyWith<$Res> {
  __$UserConsentsCopyWithImpl(this._self, this._then);

  final _UserConsents _self;
  final $Res Function(_UserConsents) _then;

/// Create a copy of UserConsents
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? analytics = freezed,Object? outcomeSharing = freezed,}) {
  return _then(_UserConsents(
analytics: freezed == analytics ? _self.analytics : analytics // ignore: cast_nullable_to_non_nullable
as bool?,outcomeSharing: freezed == outcomeSharing ? _self.outcomeSharing : outcomeSharing // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$UserNotifications {

 bool? get whatsapp; bool? get sms; bool? get email; bool? get weekly;
/// Create a copy of UserNotifications
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserNotificationsCopyWith<UserNotifications> get copyWith => _$UserNotificationsCopyWithImpl<UserNotifications>(this as UserNotifications, _$identity);

  /// Serializes this UserNotifications to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserNotifications;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserNotifications&&(identical(other.whatsapp, _this.whatsapp) || other.whatsapp == _this.whatsapp)&&(identical(other.sms, _this.sms) || other.sms == _this.sms)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.weekly, _this.weekly) || other.weekly == _this.weekly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserNotifications;
  return Object.hash(runtimeType,_this.whatsapp,_this.sms,_this.email,_this.weekly);
}

@override
String toString() {
  final _this = this as UserNotifications;
  return 'UserNotifications(whatsapp: ${_this.whatsapp}, sms: ${_this.sms}, email: ${_this.email}, weekly: ${_this.weekly})';
}


}

/// @nodoc
abstract mixin class $UserNotificationsCopyWith<$Res>  {
  factory $UserNotificationsCopyWith(UserNotifications value, $Res Function(UserNotifications) _then) = _$UserNotificationsCopyWithImpl;
@useResult
$Res call({
 bool? whatsapp, bool? sms, bool? email, bool? weekly
});




}
/// @nodoc
class _$UserNotificationsCopyWithImpl<$Res>
    implements $UserNotificationsCopyWith<$Res> {
  _$UserNotificationsCopyWithImpl(this._self, this._then);

  final UserNotifications _self;
  final $Res Function(UserNotifications) _then;

/// Create a copy of UserNotifications
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? whatsapp = freezed,Object? sms = freezed,Object? email = freezed,Object? weekly = freezed,}) {
  return _then(UserNotifications(
whatsapp: freezed == whatsapp ? _self.whatsapp : whatsapp // ignore: cast_nullable_to_non_nullable
as bool?,sms: freezed == sms ? _self.sms : sms // ignore: cast_nullable_to_non_nullable
as bool?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as bool?,weekly: freezed == weekly ? _self.weekly : weekly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserNotifications].
extension UserNotificationsPatterns on UserNotifications {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserNotifications value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserNotifications() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserNotifications value)  $default,){
final _that = this;
switch (_that) {
case _UserNotifications():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserNotifications value)?  $default,){
final _that = this;
switch (_that) {
case _UserNotifications() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? whatsapp,  bool? sms,  bool? email,  bool? weekly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserNotifications() when $default != null:
return $default(_that.whatsapp,_that.sms,_that.email,_that.weekly);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? whatsapp,  bool? sms,  bool? email,  bool? weekly)  $default,) {final _that = this;
switch (_that) {
case _UserNotifications():
return $default(_that.whatsapp,_that.sms,_that.email,_that.weekly);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? whatsapp,  bool? sms,  bool? email,  bool? weekly)?  $default,) {final _that = this;
switch (_that) {
case _UserNotifications() when $default != null:
return $default(_that.whatsapp,_that.sms,_that.email,_that.weekly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserNotifications implements UserNotifications {
  const _UserNotifications({this.whatsapp, this.sms, this.email, this.weekly});
  factory _UserNotifications.fromJson(Map<String, dynamic> json) => _$UserNotificationsFromJson(json);

@override final  bool? whatsapp;
@override final  bool? sms;
@override final  bool? email;
@override final  bool? weekly;

/// Create a copy of UserNotifications
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserNotificationsCopyWith<_UserNotifications> get copyWith => __$UserNotificationsCopyWithImpl<_UserNotifications>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserNotificationsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserNotifications&&(identical(other.whatsapp, whatsapp) || other.whatsapp == whatsapp)&&(identical(other.sms, sms) || other.sms == sms)&&(identical(other.email, email) || other.email == email)&&(identical(other.weekly, weekly) || other.weekly == weekly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,whatsapp,sms,email,weekly);
}

@override
String toString() {
    return 'UserNotifications(whatsapp: $whatsapp, sms: $sms, email: $email, weekly: $weekly)';
}


}

/// @nodoc
abstract mixin class _$UserNotificationsCopyWith<$Res> implements $UserNotificationsCopyWith<$Res> {
  factory _$UserNotificationsCopyWith(_UserNotifications value, $Res Function(_UserNotifications) _then) = __$UserNotificationsCopyWithImpl;
@override @useResult
$Res call({
 bool? whatsapp, bool? sms, bool? email, bool? weekly
});




}
/// @nodoc
class __$UserNotificationsCopyWithImpl<$Res>
    implements _$UserNotificationsCopyWith<$Res> {
  __$UserNotificationsCopyWithImpl(this._self, this._then);

  final _UserNotifications _self;
  final $Res Function(_UserNotifications) _then;

/// Create a copy of UserNotifications
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? whatsapp = freezed,Object? sms = freezed,Object? email = freezed,Object? weekly = freezed,}) {
  return _then(_UserNotifications(
whatsapp: freezed == whatsapp ? _self.whatsapp : whatsapp // ignore: cast_nullable_to_non_nullable
as bool?,sms: freezed == sms ? _self.sms : sms // ignore: cast_nullable_to_non_nullable
as bool?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as bool?,weekly: freezed == weekly ? _self.weekly : weekly // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$UserExperience {

 String? get role;/// Organisation · place · when
 String? get where; int? get months;
/// Create a copy of UserExperience
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserExperienceCopyWith<UserExperience> get copyWith => _$UserExperienceCopyWithImpl<UserExperience>(this as UserExperience, _$identity);

  /// Serializes this UserExperience to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserExperience;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserExperience&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.where, _this.where) || other.where == _this.where)&&(identical(other.months, _this.months) || other.months == _this.months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserExperience;
  return Object.hash(runtimeType,_this.role,_this.where,_this.months);
}

@override
String toString() {
  final _this = this as UserExperience;
  return 'UserExperience(role: ${_this.role}, where: ${_this.where}, months: ${_this.months})';
}


}

/// @nodoc
abstract mixin class $UserExperienceCopyWith<$Res>  {
  factory $UserExperienceCopyWith(UserExperience value, $Res Function(UserExperience) _then) = _$UserExperienceCopyWithImpl;
@useResult
$Res call({
 String? role, String? where, int? months
});




}
/// @nodoc
class _$UserExperienceCopyWithImpl<$Res>
    implements $UserExperienceCopyWith<$Res> {
  _$UserExperienceCopyWithImpl(this._self, this._then);

  final UserExperience _self;
  final $Res Function(UserExperience) _then;

/// Create a copy of UserExperience
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = freezed,Object? where = freezed,Object? months = freezed,}) {
  return _then(UserExperience(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,where: freezed == where ? _self.where : where // ignore: cast_nullable_to_non_nullable
as String?,months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserExperience].
extension UserExperiencePatterns on UserExperience {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserExperience value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserExperience() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserExperience value)  $default,){
final _that = this;
switch (_that) {
case _UserExperience():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserExperience value)?  $default,){
final _that = this;
switch (_that) {
case _UserExperience() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? role,  String? where,  int? months)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserExperience() when $default != null:
return $default(_that.role,_that.where,_that.months);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? role,  String? where,  int? months)  $default,) {final _that = this;
switch (_that) {
case _UserExperience():
return $default(_that.role,_that.where,_that.months);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? role,  String? where,  int? months)?  $default,) {final _that = this;
switch (_that) {
case _UserExperience() when $default != null:
return $default(_that.role,_that.where,_that.months);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserExperience implements UserExperience {
  const _UserExperience({this.role, this.where, this.months});
  factory _UserExperience.fromJson(Map<String, dynamic> json) => _$UserExperienceFromJson(json);

@override final  String? role;
/// Organisation · place · when
@override final  String? where;
@override final  int? months;

/// Create a copy of UserExperience
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserExperienceCopyWith<_UserExperience> get copyWith => __$UserExperienceCopyWithImpl<_UserExperience>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserExperienceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserExperience&&(identical(other.role, role) || other.role == role)&&(identical(other.where, where) || other.where == where)&&(identical(other.months, months) || other.months == months));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,role,where,months);
}

@override
String toString() {
    return 'UserExperience(role: $role, where: $where, months: $months)';
}


}

/// @nodoc
abstract mixin class _$UserExperienceCopyWith<$Res> implements $UserExperienceCopyWith<$Res> {
  factory _$UserExperienceCopyWith(_UserExperience value, $Res Function(_UserExperience) _then) = __$UserExperienceCopyWithImpl;
@override @useResult
$Res call({
 String? role, String? where, int? months
});




}
/// @nodoc
class __$UserExperienceCopyWithImpl<$Res>
    implements _$UserExperienceCopyWith<$Res> {
  __$UserExperienceCopyWithImpl(this._self, this._then);

  final _UserExperience _self;
  final $Res Function(_UserExperience) _then;

/// Create a copy of UserExperience
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = freezed,Object? where = freezed,Object? months = freezed,}) {
  return _then(_UserExperience(
role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,where: freezed == where ? _self.where : where // ignore: cast_nullable_to_non_nullable
as String?,months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$UserProfile {

/// Firestore document id (null before the doc is created).
 String? get id; String? get displayName; String? get email; String? get nationality; String? get residenceCountry; int? get birthYear; List<UserEducation> get education; List<UserLanguage> get languages; int? get experienceMonths; List<String> get interests; Money? get savings; Money? get monthlySupport;/// Flattened key→value map matched against requirements.key, e.g. {"language.en.ielts": 6.5, "funds.eur": 3000}
 Map<String, dynamic>? get facts;/// Mirrored from custom claims; editors approve change requests
 List<UserRole> get roles; UserConsents? get consents; String? get createdAt;/// E.164, for SMS / WhatsApp reminders
 String? get phone; String? get city; List<String> get strengths;/// User-added interest chips (removable)
 List<String> get customInterests;/// User-added strength chips (removable)
 List<String> get customStrengths;/// Who supports the student financially (never shown to employers)
 String? get supportSource; int? get earliestMoveYear; int? get graduationYear;/// YYYY-MM
 String? get passportValidUntil; List<String> get preferredCountryIds;/// Things the plan must respect (family duties, work, health, religion)
 String? get constraints; UserNotifications? get notifications;/// users/{uid}/goals/{id} shown in the cockpit
 String? get activeGoalId;/// Work experience entries; experienceMonths is kept in sync (sum)
 List<UserExperience> get experience;/// Per-goal progress kept by the client, keyed by goalId: { steps: {stepKey: 0|1|2}, tasks: {stepKey: true}, decisions: {decisionId: optionIndex}, where: {stepKey: optionIndex} }. Not read by the engine.
 Map<String, dynamic>? get progress;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserProfile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.displayName, _this.displayName) || other.displayName == _this.displayName)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.nationality, _this.nationality) || other.nationality == _this.nationality)&&(identical(other.residenceCountry, _this.residenceCountry) || other.residenceCountry == _this.residenceCountry)&&(identical(other.birthYear, _this.birthYear) || other.birthYear == _this.birthYear)&&const DeepCollectionEquality().equals(other.education, _this.education)&&const DeepCollectionEquality().equals(other.languages, _this.languages)&&(identical(other.experienceMonths, _this.experienceMonths) || other.experienceMonths == _this.experienceMonths)&&const DeepCollectionEquality().equals(other.interests, _this.interests)&&(identical(other.savings, _this.savings) || other.savings == _this.savings)&&(identical(other.monthlySupport, _this.monthlySupport) || other.monthlySupport == _this.monthlySupport)&&const DeepCollectionEquality().equals(other.facts, _this.facts)&&const DeepCollectionEquality().equals(other.roles, _this.roles)&&(identical(other.consents, _this.consents) || other.consents == _this.consents)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.city, _this.city) || other.city == _this.city)&&const DeepCollectionEquality().equals(other.strengths, _this.strengths)&&const DeepCollectionEquality().equals(other.customInterests, _this.customInterests)&&const DeepCollectionEquality().equals(other.customStrengths, _this.customStrengths)&&(identical(other.supportSource, _this.supportSource) || other.supportSource == _this.supportSource)&&(identical(other.earliestMoveYear, _this.earliestMoveYear) || other.earliestMoveYear == _this.earliestMoveYear)&&(identical(other.graduationYear, _this.graduationYear) || other.graduationYear == _this.graduationYear)&&(identical(other.passportValidUntil, _this.passportValidUntil) || other.passportValidUntil == _this.passportValidUntil)&&const DeepCollectionEquality().equals(other.preferredCountryIds, _this.preferredCountryIds)&&(identical(other.constraints, _this.constraints) || other.constraints == _this.constraints)&&(identical(other.notifications, _this.notifications) || other.notifications == _this.notifications)&&(identical(other.activeGoalId, _this.activeGoalId) || other.activeGoalId == _this.activeGoalId)&&const DeepCollectionEquality().equals(other.experience, _this.experience)&&const DeepCollectionEquality().equals(other.progress, _this.progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserProfile;
  return Object.hashAll([runtimeType,_this.id,_this.displayName,_this.email,_this.nationality,_this.residenceCountry,_this.birthYear,const DeepCollectionEquality().hash(_this.education),const DeepCollectionEquality().hash(_this.languages),_this.experienceMonths,const DeepCollectionEquality().hash(_this.interests),_this.savings,_this.monthlySupport,const DeepCollectionEquality().hash(_this.facts),const DeepCollectionEquality().hash(_this.roles),_this.consents,_this.createdAt,_this.phone,_this.city,const DeepCollectionEquality().hash(_this.strengths),const DeepCollectionEquality().hash(_this.customInterests),const DeepCollectionEquality().hash(_this.customStrengths),_this.supportSource,_this.earliestMoveYear,_this.graduationYear,_this.passportValidUntil,const DeepCollectionEquality().hash(_this.preferredCountryIds),_this.constraints,_this.notifications,_this.activeGoalId,const DeepCollectionEquality().hash(_this.experience),const DeepCollectionEquality().hash(_this.progress)]);
}

@override
String toString() {
  final _this = this as UserProfile;
  return 'UserProfile(id: ${_this.id}, displayName: ${_this.displayName}, email: ${_this.email}, nationality: ${_this.nationality}, residenceCountry: ${_this.residenceCountry}, birthYear: ${_this.birthYear}, education: ${_this.education}, languages: ${_this.languages}, experienceMonths: ${_this.experienceMonths}, interests: ${_this.interests}, savings: ${_this.savings}, monthlySupport: ${_this.monthlySupport}, facts: ${_this.facts}, roles: ${_this.roles}, consents: ${_this.consents}, createdAt: ${_this.createdAt}, phone: ${_this.phone}, city: ${_this.city}, strengths: ${_this.strengths}, customInterests: ${_this.customInterests}, customStrengths: ${_this.customStrengths}, supportSource: ${_this.supportSource}, earliestMoveYear: ${_this.earliestMoveYear}, graduationYear: ${_this.graduationYear}, passportValidUntil: ${_this.passportValidUntil}, preferredCountryIds: ${_this.preferredCountryIds}, constraints: ${_this.constraints}, notifications: ${_this.notifications}, activeGoalId: ${_this.activeGoalId}, experience: ${_this.experience}, progress: ${_this.progress})';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String? id, String? displayName, String? email, String? nationality, String? residenceCountry, int? birthYear, List<UserEducation> education, List<UserLanguage> languages, int? experienceMonths, List<String> interests, Money? savings, Money? monthlySupport, Map<String, dynamic>? facts, List<UserRole> roles, UserConsents? consents, String? createdAt, String? phone, String? city, List<String> strengths, List<String> customInterests, List<String> customStrengths, String? supportSource, int? earliestMoveYear, int? graduationYear, String? passportValidUntil, List<String> preferredCountryIds, String? constraints, UserNotifications? notifications, String? activeGoalId, List<UserExperience> experience, Map<String, dynamic>? progress
});


$MoneyCopyWith<$Res>? get savings;$MoneyCopyWith<$Res>? get monthlySupport;$UserConsentsCopyWith<$Res>? get consents;$UserNotificationsCopyWith<$Res>? get notifications;

}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? displayName = freezed,Object? email = freezed,Object? nationality = freezed,Object? residenceCountry = freezed,Object? birthYear = freezed,Object? education = null,Object? languages = null,Object? experienceMonths = freezed,Object? interests = null,Object? savings = freezed,Object? monthlySupport = freezed,Object? facts = freezed,Object? roles = null,Object? consents = freezed,Object? createdAt = freezed,Object? phone = freezed,Object? city = freezed,Object? strengths = null,Object? customInterests = null,Object? customStrengths = null,Object? supportSource = freezed,Object? earliestMoveYear = freezed,Object? graduationYear = freezed,Object? passportValidUntil = freezed,Object? preferredCountryIds = null,Object? constraints = freezed,Object? notifications = freezed,Object? activeGoalId = freezed,Object? experience = null,Object? progress = freezed,}) {
  return _then(UserProfile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,residenceCountry: freezed == residenceCountry ? _self.residenceCountry : residenceCountry // ignore: cast_nullable_to_non_nullable
as String?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,education: null == education ? _self.education : education // ignore: cast_nullable_to_non_nullable
as List<UserEducation>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<UserLanguage>,experienceMonths: freezed == experienceMonths ? _self.experienceMonths : experienceMonths // ignore: cast_nullable_to_non_nullable
as int?,interests: null == interests ? _self.interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as Money?,monthlySupport: freezed == monthlySupport ? _self.monthlySupport : monthlySupport // ignore: cast_nullable_to_non_nullable
as Money?,facts: freezed == facts ? _self.facts : facts // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRole>,consents: freezed == consents ? _self.consents : consents // ignore: cast_nullable_to_non_nullable
as UserConsents?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,strengths: null == strengths ? _self.strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,customInterests: null == customInterests ? _self.customInterests : customInterests // ignore: cast_nullable_to_non_nullable
as List<String>,customStrengths: null == customStrengths ? _self.customStrengths : customStrengths // ignore: cast_nullable_to_non_nullable
as List<String>,supportSource: freezed == supportSource ? _self.supportSource : supportSource // ignore: cast_nullable_to_non_nullable
as String?,earliestMoveYear: freezed == earliestMoveYear ? _self.earliestMoveYear : earliestMoveYear // ignore: cast_nullable_to_non_nullable
as int?,graduationYear: freezed == graduationYear ? _self.graduationYear : graduationYear // ignore: cast_nullable_to_non_nullable
as int?,passportValidUntil: freezed == passportValidUntil ? _self.passportValidUntil : passportValidUntil // ignore: cast_nullable_to_non_nullable
as String?,preferredCountryIds: null == preferredCountryIds ? _self.preferredCountryIds : preferredCountryIds // ignore: cast_nullable_to_non_nullable
as List<String>,constraints: freezed == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as String?,notifications: freezed == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as UserNotifications?,activeGoalId: freezed == activeGoalId ? _self.activeGoalId : activeGoalId // ignore: cast_nullable_to_non_nullable
as String?,experience: null == experience ? _self.experience : experience // ignore: cast_nullable_to_non_nullable
as List<UserExperience>,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get savings {
    if (_self.savings == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.savings!, (value) {
    return _then(_self.copyWith(savings: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get monthlySupport {
    if (_self.monthlySupport == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.monthlySupport!, (value) {
    return _then(_self.copyWith(monthlySupport: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserConsentsCopyWith<$Res>? get consents {
    if (_self.consents == null) {
    return null;
  }

  return $UserConsentsCopyWith<$Res>(_self.consents!, (value) {
    return _then(_self.copyWith(consents: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserNotificationsCopyWith<$Res>? get notifications {
    if (_self.notifications == null) {
    return null;
  }

  return $UserNotificationsCopyWith<$Res>(_self.notifications!, (value) {
    return _then(_self.copyWith(notifications: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? displayName,  String? email,  String? nationality,  String? residenceCountry,  int? birthYear,  List<UserEducation> education,  List<UserLanguage> languages,  int? experienceMonths,  List<String> interests,  Money? savings,  Money? monthlySupport,  Map<String, dynamic>? facts,  List<UserRole> roles,  UserConsents? consents,  String? createdAt,  String? phone,  String? city,  List<String> strengths,  List<String> customInterests,  List<String> customStrengths,  String? supportSource,  int? earliestMoveYear,  int? graduationYear,  String? passportValidUntil,  List<String> preferredCountryIds,  String? constraints,  UserNotifications? notifications,  String? activeGoalId,  List<UserExperience> experience,  Map<String, dynamic>? progress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.displayName,_that.email,_that.nationality,_that.residenceCountry,_that.birthYear,_that.education,_that.languages,_that.experienceMonths,_that.interests,_that.savings,_that.monthlySupport,_that.facts,_that.roles,_that.consents,_that.createdAt,_that.phone,_that.city,_that.strengths,_that.customInterests,_that.customStrengths,_that.supportSource,_that.earliestMoveYear,_that.graduationYear,_that.passportValidUntil,_that.preferredCountryIds,_that.constraints,_that.notifications,_that.activeGoalId,_that.experience,_that.progress);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? displayName,  String? email,  String? nationality,  String? residenceCountry,  int? birthYear,  List<UserEducation> education,  List<UserLanguage> languages,  int? experienceMonths,  List<String> interests,  Money? savings,  Money? monthlySupport,  Map<String, dynamic>? facts,  List<UserRole> roles,  UserConsents? consents,  String? createdAt,  String? phone,  String? city,  List<String> strengths,  List<String> customInterests,  List<String> customStrengths,  String? supportSource,  int? earliestMoveYear,  int? graduationYear,  String? passportValidUntil,  List<String> preferredCountryIds,  String? constraints,  UserNotifications? notifications,  String? activeGoalId,  List<UserExperience> experience,  Map<String, dynamic>? progress)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.displayName,_that.email,_that.nationality,_that.residenceCountry,_that.birthYear,_that.education,_that.languages,_that.experienceMonths,_that.interests,_that.savings,_that.monthlySupport,_that.facts,_that.roles,_that.consents,_that.createdAt,_that.phone,_that.city,_that.strengths,_that.customInterests,_that.customStrengths,_that.supportSource,_that.earliestMoveYear,_that.graduationYear,_that.passportValidUntil,_that.preferredCountryIds,_that.constraints,_that.notifications,_that.activeGoalId,_that.experience,_that.progress);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? displayName,  String? email,  String? nationality,  String? residenceCountry,  int? birthYear,  List<UserEducation> education,  List<UserLanguage> languages,  int? experienceMonths,  List<String> interests,  Money? savings,  Money? monthlySupport,  Map<String, dynamic>? facts,  List<UserRole> roles,  UserConsents? consents,  String? createdAt,  String? phone,  String? city,  List<String> strengths,  List<String> customInterests,  List<String> customStrengths,  String? supportSource,  int? earliestMoveYear,  int? graduationYear,  String? passportValidUntil,  List<String> preferredCountryIds,  String? constraints,  UserNotifications? notifications,  String? activeGoalId,  List<UserExperience> experience,  Map<String, dynamic>? progress)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.displayName,_that.email,_that.nationality,_that.residenceCountry,_that.birthYear,_that.education,_that.languages,_that.experienceMonths,_that.interests,_that.savings,_that.monthlySupport,_that.facts,_that.roles,_that.consents,_that.createdAt,_that.phone,_that.city,_that.strengths,_that.customInterests,_that.customStrengths,_that.supportSource,_that.earliestMoveYear,_that.graduationYear,_that.passportValidUntil,_that.preferredCountryIds,_that.constraints,_that.notifications,_that.activeGoalId,_that.experience,_that.progress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({this.id, this.displayName, this.email, this.nationality, this.residenceCountry, this.birthYear,  List<UserEducation> education = const [],  List<UserLanguage> languages = const [], this.experienceMonths,  List<String> interests = const [], this.savings, this.monthlySupport,  Map<String, dynamic>? facts,  List<UserRole> roles = const [], this.consents, this.createdAt, this.phone, this.city,  List<String> strengths = const [],  List<String> customInterests = const [],  List<String> customStrengths = const [], this.supportSource, this.earliestMoveYear, this.graduationYear, this.passportValidUntil,  List<String> preferredCountryIds = const [], this.constraints, this.notifications, this.activeGoalId,  List<UserExperience> experience = const [],  Map<String, dynamic>? progress}): _education = education,_languages = languages,_interests = interests,_facts = facts,_roles = roles,_strengths = strengths,_customInterests = customInterests,_customStrengths = customStrengths,_preferredCountryIds = preferredCountryIds,_experience = experience,_progress = progress;
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

/// Firestore document id (null before the doc is created).
@override final  String? id;
@override final  String? displayName;
@override final  String? email;
@override final  String? nationality;
@override final  String? residenceCountry;
@override final  int? birthYear;
 final  List<UserEducation> _education;
@override@JsonKey() List<UserEducation> get education {
  if (_education is EqualUnmodifiableListView) return _education;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_education);
}

 final  List<UserLanguage> _languages;
@override@JsonKey() List<UserLanguage> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override final  int? experienceMonths;
 final  List<String> _interests;
@override@JsonKey() List<String> get interests {
  if (_interests is EqualUnmodifiableListView) return _interests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_interests);
}

@override final  Money? savings;
@override final  Money? monthlySupport;
/// Flattened key→value map matched against requirements.key, e.g. {"language.en.ielts": 6.5, "funds.eur": 3000}
 final  Map<String, dynamic>? _facts;
/// Flattened key→value map matched against requirements.key, e.g. {"language.en.ielts": 6.5, "funds.eur": 3000}
@override Map<String, dynamic>? get facts {
  final value = _facts;
  if (value == null) return null;
  if (_facts is EqualUnmodifiableMapView) return _facts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Mirrored from custom claims; editors approve change requests
 final  List<UserRole> _roles;
/// Mirrored from custom claims; editors approve change requests
@override@JsonKey() List<UserRole> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  UserConsents? consents;
@override final  String? createdAt;
/// E.164, for SMS / WhatsApp reminders
@override final  String? phone;
@override final  String? city;
 final  List<String> _strengths;
@override@JsonKey() List<String> get strengths {
  if (_strengths is EqualUnmodifiableListView) return _strengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_strengths);
}

/// User-added interest chips (removable)
 final  List<String> _customInterests;
/// User-added interest chips (removable)
@override@JsonKey() List<String> get customInterests {
  if (_customInterests is EqualUnmodifiableListView) return _customInterests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customInterests);
}

/// User-added strength chips (removable)
 final  List<String> _customStrengths;
/// User-added strength chips (removable)
@override@JsonKey() List<String> get customStrengths {
  if (_customStrengths is EqualUnmodifiableListView) return _customStrengths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customStrengths);
}

/// Who supports the student financially (never shown to employers)
@override final  String? supportSource;
@override final  int? earliestMoveYear;
@override final  int? graduationYear;
/// YYYY-MM
@override final  String? passportValidUntil;
 final  List<String> _preferredCountryIds;
@override@JsonKey() List<String> get preferredCountryIds {
  if (_preferredCountryIds is EqualUnmodifiableListView) return _preferredCountryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preferredCountryIds);
}

/// Things the plan must respect (family duties, work, health, religion)
@override final  String? constraints;
@override final  UserNotifications? notifications;
/// users/{uid}/goals/{id} shown in the cockpit
@override final  String? activeGoalId;
/// Work experience entries; experienceMonths is kept in sync (sum)
 final  List<UserExperience> _experience;
/// Work experience entries; experienceMonths is kept in sync (sum)
@override@JsonKey() List<UserExperience> get experience {
  if (_experience is EqualUnmodifiableListView) return _experience;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_experience);
}

/// Per-goal progress kept by the client, keyed by goalId: { steps: {stepKey: 0|1|2}, tasks: {stepKey: true}, decisions: {decisionId: optionIndex}, where: {stepKey: optionIndex} }. Not read by the engine.
 final  Map<String, dynamic>? _progress;
/// Per-goal progress kept by the client, keyed by goalId: { steps: {stepKey: 0|1|2}, tasks: {stepKey: true}, decisions: {decisionId: optionIndex}, where: {stepKey: optionIndex} }. Not read by the engine.
@override Map<String, dynamic>? get progress {
  final value = _progress;
  if (value == null) return null;
  if (_progress is EqualUnmodifiableMapView) return _progress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.nationality, nationality) || other.nationality == nationality)&&(identical(other.residenceCountry, residenceCountry) || other.residenceCountry == residenceCountry)&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&const DeepCollectionEquality().equals(other.education, _education)&&const DeepCollectionEquality().equals(other.languages, _languages)&&(identical(other.experienceMonths, experienceMonths) || other.experienceMonths == experienceMonths)&&const DeepCollectionEquality().equals(other.interests, _interests)&&(identical(other.savings, savings) || other.savings == savings)&&(identical(other.monthlySupport, monthlySupport) || other.monthlySupport == monthlySupport)&&const DeepCollectionEquality().equals(other.facts, _facts)&&const DeepCollectionEquality().equals(other.roles, _roles)&&(identical(other.consents, consents) || other.consents == consents)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.city, city) || other.city == city)&&const DeepCollectionEquality().equals(other.strengths, _strengths)&&const DeepCollectionEquality().equals(other.customInterests, _customInterests)&&const DeepCollectionEquality().equals(other.customStrengths, _customStrengths)&&(identical(other.supportSource, supportSource) || other.supportSource == supportSource)&&(identical(other.earliestMoveYear, earliestMoveYear) || other.earliestMoveYear == earliestMoveYear)&&(identical(other.graduationYear, graduationYear) || other.graduationYear == graduationYear)&&(identical(other.passportValidUntil, passportValidUntil) || other.passportValidUntil == passportValidUntil)&&const DeepCollectionEquality().equals(other.preferredCountryIds, _preferredCountryIds)&&(identical(other.constraints, constraints) || other.constraints == constraints)&&(identical(other.notifications, notifications) || other.notifications == notifications)&&(identical(other.activeGoalId, activeGoalId) || other.activeGoalId == activeGoalId)&&const DeepCollectionEquality().equals(other.experience, _experience)&&const DeepCollectionEquality().equals(other.progress, _progress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,displayName,email,nationality,residenceCountry,birthYear,const DeepCollectionEquality().hash(_education),const DeepCollectionEquality().hash(_languages),experienceMonths,const DeepCollectionEquality().hash(_interests),savings,monthlySupport,const DeepCollectionEquality().hash(_facts),const DeepCollectionEquality().hash(_roles),consents,createdAt,phone,city,const DeepCollectionEquality().hash(_strengths),const DeepCollectionEquality().hash(_customInterests),const DeepCollectionEquality().hash(_customStrengths),supportSource,earliestMoveYear,graduationYear,passportValidUntil,const DeepCollectionEquality().hash(_preferredCountryIds),constraints,notifications,activeGoalId,const DeepCollectionEquality().hash(_experience),const DeepCollectionEquality().hash(_progress)]);
}

@override
String toString() {
    return 'UserProfile(id: $id, displayName: $displayName, email: $email, nationality: $nationality, residenceCountry: $residenceCountry, birthYear: $birthYear, education: $education, languages: $languages, experienceMonths: $experienceMonths, interests: $interests, savings: $savings, monthlySupport: $monthlySupport, facts: $facts, roles: $roles, consents: $consents, createdAt: $createdAt, phone: $phone, city: $city, strengths: $strengths, customInterests: $customInterests, customStrengths: $customStrengths, supportSource: $supportSource, earliestMoveYear: $earliestMoveYear, graduationYear: $graduationYear, passportValidUntil: $passportValidUntil, preferredCountryIds: $preferredCountryIds, constraints: $constraints, notifications: $notifications, activeGoalId: $activeGoalId, experience: $experience, progress: $progress)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? displayName, String? email, String? nationality, String? residenceCountry, int? birthYear, List<UserEducation> education, List<UserLanguage> languages, int? experienceMonths, List<String> interests, Money? savings, Money? monthlySupport, Map<String, dynamic>? facts, List<UserRole> roles, UserConsents? consents, String? createdAt, String? phone, String? city, List<String> strengths, List<String> customInterests, List<String> customStrengths, String? supportSource, int? earliestMoveYear, int? graduationYear, String? passportValidUntil, List<String> preferredCountryIds, String? constraints, UserNotifications? notifications, String? activeGoalId, List<UserExperience> experience, Map<String, dynamic>? progress
});


@override $MoneyCopyWith<$Res>? get savings;@override $MoneyCopyWith<$Res>? get monthlySupport;@override $UserConsentsCopyWith<$Res>? get consents;@override $UserNotificationsCopyWith<$Res>? get notifications;

}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? displayName = freezed,Object? email = freezed,Object? nationality = freezed,Object? residenceCountry = freezed,Object? birthYear = freezed,Object? education = null,Object? languages = null,Object? experienceMonths = freezed,Object? interests = null,Object? savings = freezed,Object? monthlySupport = freezed,Object? facts = freezed,Object? roles = null,Object? consents = freezed,Object? createdAt = freezed,Object? phone = freezed,Object? city = freezed,Object? strengths = null,Object? customInterests = null,Object? customStrengths = null,Object? supportSource = freezed,Object? earliestMoveYear = freezed,Object? graduationYear = freezed,Object? passportValidUntil = freezed,Object? preferredCountryIds = null,Object? constraints = freezed,Object? notifications = freezed,Object? activeGoalId = freezed,Object? experience = null,Object? progress = freezed,}) {
  return _then(_UserProfile(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,nationality: freezed == nationality ? _self.nationality : nationality // ignore: cast_nullable_to_non_nullable
as String?,residenceCountry: freezed == residenceCountry ? _self.residenceCountry : residenceCountry // ignore: cast_nullable_to_non_nullable
as String?,birthYear: freezed == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int?,education: null == education ? _self._education : education // ignore: cast_nullable_to_non_nullable
as List<UserEducation>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<UserLanguage>,experienceMonths: freezed == experienceMonths ? _self.experienceMonths : experienceMonths // ignore: cast_nullable_to_non_nullable
as int?,interests: null == interests ? _self._interests : interests // ignore: cast_nullable_to_non_nullable
as List<String>,savings: freezed == savings ? _self.savings : savings // ignore: cast_nullable_to_non_nullable
as Money?,monthlySupport: freezed == monthlySupport ? _self.monthlySupport : monthlySupport // ignore: cast_nullable_to_non_nullable
as Money?,facts: freezed == facts ? _self._facts : facts // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<UserRole>,consents: freezed == consents ? _self.consents : consents // ignore: cast_nullable_to_non_nullable
as UserConsents?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,strengths: null == strengths ? _self._strengths : strengths // ignore: cast_nullable_to_non_nullable
as List<String>,customInterests: null == customInterests ? _self._customInterests : customInterests // ignore: cast_nullable_to_non_nullable
as List<String>,customStrengths: null == customStrengths ? _self._customStrengths : customStrengths // ignore: cast_nullable_to_non_nullable
as List<String>,supportSource: freezed == supportSource ? _self.supportSource : supportSource // ignore: cast_nullable_to_non_nullable
as String?,earliestMoveYear: freezed == earliestMoveYear ? _self.earliestMoveYear : earliestMoveYear // ignore: cast_nullable_to_non_nullable
as int?,graduationYear: freezed == graduationYear ? _self.graduationYear : graduationYear // ignore: cast_nullable_to_non_nullable
as int?,passportValidUntil: freezed == passportValidUntil ? _self.passportValidUntil : passportValidUntil // ignore: cast_nullable_to_non_nullable
as String?,preferredCountryIds: null == preferredCountryIds ? _self._preferredCountryIds : preferredCountryIds // ignore: cast_nullable_to_non_nullable
as List<String>,constraints: freezed == constraints ? _self.constraints : constraints // ignore: cast_nullable_to_non_nullable
as String?,notifications: freezed == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as UserNotifications?,activeGoalId: freezed == activeGoalId ? _self.activeGoalId : activeGoalId // ignore: cast_nullable_to_non_nullable
as String?,experience: null == experience ? _self._experience : experience // ignore: cast_nullable_to_non_nullable
as List<UserExperience>,progress: freezed == progress ? _self._progress : progress // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get savings {
    if (_self.savings == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.savings!, (value) {
    return _then(_self.copyWith(savings: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get monthlySupport {
    if (_self.monthlySupport == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.monthlySupport!, (value) {
    return _then(_self.copyWith(monthlySupport: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserConsentsCopyWith<$Res>? get consents {
    if (_self.consents == null) {
    return null;
  }

  return $UserConsentsCopyWith<$Res>(_self.consents!, (value) {
    return _then(_self.copyWith(consents: value));
  });
}/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserNotificationsCopyWith<$Res>? get notifications {
    if (_self.notifications == null) {
    return null;
  }

  return $UserNotificationsCopyWith<$Res>(_self.notifications!, (value) {
    return _then(_self.copyWith(notifications: value));
  });
}
}

// dart format on
