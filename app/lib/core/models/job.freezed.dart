// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Job {

/// Firestore document id.
 String get id; String get title; String? get employer; String get countryId; String? get city; String? get occupationId;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobLevel? get level; MoneyRange? get salary; bool? get salaryIsEstimate; String? get languageRequired;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobVisaSponsorship? get visaSponsorship; String? get url; String get source; String? get postedAt;/// Firestore TTL field
 String get expireAt;
/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobCopyWith<Job> get copyWith => _$JobCopyWithImpl<Job>(this as Job, _$identity);

  /// Serializes this Job to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Job;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Job&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.employer, _this.employer) || other.employer == _this.employer)&&(identical(other.countryId, _this.countryId) || other.countryId == _this.countryId)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.occupationId, _this.occupationId) || other.occupationId == _this.occupationId)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.salary, _this.salary) || other.salary == _this.salary)&&(identical(other.salaryIsEstimate, _this.salaryIsEstimate) || other.salaryIsEstimate == _this.salaryIsEstimate)&&(identical(other.languageRequired, _this.languageRequired) || other.languageRequired == _this.languageRequired)&&(identical(other.visaSponsorship, _this.visaSponsorship) || other.visaSponsorship == _this.visaSponsorship)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.postedAt, _this.postedAt) || other.postedAt == _this.postedAt)&&(identical(other.expireAt, _this.expireAt) || other.expireAt == _this.expireAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Job;
  return Object.hash(runtimeType,_this.id,_this.title,_this.employer,_this.countryId,_this.city,_this.occupationId,_this.level,_this.salary,_this.salaryIsEstimate,_this.languageRequired,_this.visaSponsorship,_this.url,_this.source,_this.postedAt,_this.expireAt);
}

@override
String toString() {
  final _this = this as Job;
  return 'Job(id: ${_this.id}, title: ${_this.title}, employer: ${_this.employer}, countryId: ${_this.countryId}, city: ${_this.city}, occupationId: ${_this.occupationId}, level: ${_this.level}, salary: ${_this.salary}, salaryIsEstimate: ${_this.salaryIsEstimate}, languageRequired: ${_this.languageRequired}, visaSponsorship: ${_this.visaSponsorship}, url: ${_this.url}, source: ${_this.source}, postedAt: ${_this.postedAt}, expireAt: ${_this.expireAt})';
}


}

/// @nodoc
abstract mixin class $JobCopyWith<$Res>  {
  factory $JobCopyWith(Job value, $Res Function(Job) _then) = _$JobCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? employer, String countryId, String? city, String? occupationId,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobLevel? level, MoneyRange? salary, bool? salaryIsEstimate, String? languageRequired,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobVisaSponsorship? visaSponsorship, String? url, String source, String? postedAt, String expireAt
});


$MoneyRangeCopyWith<$Res>? get salary;

}
/// @nodoc
class _$JobCopyWithImpl<$Res>
    implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._self, this._then);

  final Job _self;
  final $Res Function(Job) _then;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? employer = freezed,Object? countryId = null,Object? city = freezed,Object? occupationId = freezed,Object? level = freezed,Object? salary = freezed,Object? salaryIsEstimate = freezed,Object? languageRequired = freezed,Object? visaSponsorship = freezed,Object? url = freezed,Object? source = null,Object? postedAt = freezed,Object? expireAt = null,}) {
  return _then(Job(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,employer: freezed == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as String?,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as JobLevel?,salary: freezed == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as MoneyRange?,salaryIsEstimate: freezed == salaryIsEstimate ? _self.salaryIsEstimate : salaryIsEstimate // ignore: cast_nullable_to_non_nullable
as bool?,languageRequired: freezed == languageRequired ? _self.languageRequired : languageRequired // ignore: cast_nullable_to_non_nullable
as String?,visaSponsorship: freezed == visaSponsorship ? _self.visaSponsorship : visaSponsorship // ignore: cast_nullable_to_non_nullable
as JobVisaSponsorship?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,postedAt: freezed == postedAt ? _self.postedAt : postedAt // ignore: cast_nullable_to_non_nullable
as String?,expireAt: null == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get salary {
    if (_self.salary == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.salary!, (value) {
    return _then(_self.copyWith(salary: value));
  });
}
}


/// Adds pattern-matching-related methods to [Job].
extension JobPatterns on Job {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Job value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Job() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Job value)  $default,){
final _that = this;
switch (_that) {
case _Job():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Job value)?  $default,){
final _that = this;
switch (_that) {
case _Job() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? employer,  String countryId,  String? city,  String? occupationId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobLevel? level,  MoneyRange? salary,  bool? salaryIsEstimate,  String? languageRequired, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobVisaSponsorship? visaSponsorship,  String? url,  String source,  String? postedAt,  String expireAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Job() when $default != null:
return $default(_that.id,_that.title,_that.employer,_that.countryId,_that.city,_that.occupationId,_that.level,_that.salary,_that.salaryIsEstimate,_that.languageRequired,_that.visaSponsorship,_that.url,_that.source,_that.postedAt,_that.expireAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? employer,  String countryId,  String? city,  String? occupationId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobLevel? level,  MoneyRange? salary,  bool? salaryIsEstimate,  String? languageRequired, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobVisaSponsorship? visaSponsorship,  String? url,  String source,  String? postedAt,  String expireAt)  $default,) {final _that = this;
switch (_that) {
case _Job():
return $default(_that.id,_that.title,_that.employer,_that.countryId,_that.city,_that.occupationId,_that.level,_that.salary,_that.salaryIsEstimate,_that.languageRequired,_that.visaSponsorship,_that.url,_that.source,_that.postedAt,_that.expireAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? employer,  String countryId,  String? city,  String? occupationId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobLevel? level,  MoneyRange? salary,  bool? salaryIsEstimate,  String? languageRequired, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  JobVisaSponsorship? visaSponsorship,  String? url,  String source,  String? postedAt,  String expireAt)?  $default,) {final _that = this;
switch (_that) {
case _Job() when $default != null:
return $default(_that.id,_that.title,_that.employer,_that.countryId,_that.city,_that.occupationId,_that.level,_that.salary,_that.salaryIsEstimate,_that.languageRequired,_that.visaSponsorship,_that.url,_that.source,_that.postedAt,_that.expireAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Job implements Job {
  const _Job({required this.id, required this.title, this.employer, required this.countryId, this.city, this.occupationId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.level, this.salary, this.salaryIsEstimate, this.languageRequired, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.visaSponsorship, this.url, required this.source, this.postedAt, required this.expireAt});
  factory _Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  String title;
@override final  String? employer;
@override final  String countryId;
@override final  String? city;
@override final  String? occupationId;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  JobLevel? level;
@override final  MoneyRange? salary;
@override final  bool? salaryIsEstimate;
@override final  String? languageRequired;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  JobVisaSponsorship? visaSponsorship;
@override final  String? url;
@override final  String source;
@override final  String? postedAt;
/// Firestore TTL field
@override final  String expireAt;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobCopyWith<_Job> get copyWith => __$JobCopyWithImpl<_Job>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Job&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.employer, employer) || other.employer == employer)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.city, city) || other.city == city)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.level, level) || other.level == level)&&(identical(other.salary, salary) || other.salary == salary)&&(identical(other.salaryIsEstimate, salaryIsEstimate) || other.salaryIsEstimate == salaryIsEstimate)&&(identical(other.languageRequired, languageRequired) || other.languageRequired == languageRequired)&&(identical(other.visaSponsorship, visaSponsorship) || other.visaSponsorship == visaSponsorship)&&(identical(other.url, url) || other.url == url)&&(identical(other.source, source) || other.source == source)&&(identical(other.postedAt, postedAt) || other.postedAt == postedAt)&&(identical(other.expireAt, expireAt) || other.expireAt == expireAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,employer,countryId,city,occupationId,level,salary,salaryIsEstimate,languageRequired,visaSponsorship,url,source,postedAt,expireAt);
}

@override
String toString() {
    return 'Job(id: $id, title: $title, employer: $employer, countryId: $countryId, city: $city, occupationId: $occupationId, level: $level, salary: $salary, salaryIsEstimate: $salaryIsEstimate, languageRequired: $languageRequired, visaSponsorship: $visaSponsorship, url: $url, source: $source, postedAt: $postedAt, expireAt: $expireAt)';
}


}

/// @nodoc
abstract mixin class _$JobCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$JobCopyWith(_Job value, $Res Function(_Job) _then) = __$JobCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? employer, String countryId, String? city, String? occupationId,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobLevel? level, MoneyRange? salary, bool? salaryIsEstimate, String? languageRequired,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) JobVisaSponsorship? visaSponsorship, String? url, String source, String? postedAt, String expireAt
});


@override $MoneyRangeCopyWith<$Res>? get salary;

}
/// @nodoc
class __$JobCopyWithImpl<$Res>
    implements _$JobCopyWith<$Res> {
  __$JobCopyWithImpl(this._self, this._then);

  final _Job _self;
  final $Res Function(_Job) _then;

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? employer = freezed,Object? countryId = null,Object? city = freezed,Object? occupationId = freezed,Object? level = freezed,Object? salary = freezed,Object? salaryIsEstimate = freezed,Object? languageRequired = freezed,Object? visaSponsorship = freezed,Object? url = freezed,Object? source = null,Object? postedAt = freezed,Object? expireAt = null,}) {
  return _then(_Job(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,employer: freezed == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as String?,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as JobLevel?,salary: freezed == salary ? _self.salary : salary // ignore: cast_nullable_to_non_nullable
as MoneyRange?,salaryIsEstimate: freezed == salaryIsEstimate ? _self.salaryIsEstimate : salaryIsEstimate // ignore: cast_nullable_to_non_nullable
as bool?,languageRequired: freezed == languageRequired ? _self.languageRequired : languageRequired // ignore: cast_nullable_to_non_nullable
as String?,visaSponsorship: freezed == visaSponsorship ? _self.visaSponsorship : visaSponsorship // ignore: cast_nullable_to_non_nullable
as JobVisaSponsorship?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as String,postedAt: freezed == postedAt ? _self.postedAt : postedAt // ignore: cast_nullable_to_non_nullable
as String?,expireAt: null == expireAt ? _self.expireAt : expireAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Job
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get salary {
    if (_self.salary == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.salary!, (value) {
    return _then(_self.copyWith(salary: value));
  });
}
}

// dart format on
