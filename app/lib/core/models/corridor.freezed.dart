// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'corridor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VisaApplication {

 String? get authority; String get city; String get country;/// External service provider, e.g. VFS, TLScontact, CAPAGO
 String? get provider;/// Where the decision is taken if different
 String? get decidedIn; String? get url; bool? get travelRequired;
/// Create a copy of VisaApplication
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VisaApplicationCopyWith<VisaApplication> get copyWith => _$VisaApplicationCopyWithImpl<VisaApplication>(this as VisaApplication, _$identity);

  /// Serializes this VisaApplication to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as VisaApplication;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VisaApplication&&(identical(other.authority, _this.authority) || other.authority == _this.authority)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.country, _this.country) || other.country == _this.country)&&(identical(other.provider, _this.provider) || other.provider == _this.provider)&&(identical(other.decidedIn, _this.decidedIn) || other.decidedIn == _this.decidedIn)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.travelRequired, _this.travelRequired) || other.travelRequired == _this.travelRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as VisaApplication;
  return Object.hash(runtimeType,_this.authority,_this.city,_this.country,_this.provider,_this.decidedIn,_this.url,_this.travelRequired);
}

@override
String toString() {
  final _this = this as VisaApplication;
  return 'VisaApplication(authority: ${_this.authority}, city: ${_this.city}, country: ${_this.country}, provider: ${_this.provider}, decidedIn: ${_this.decidedIn}, url: ${_this.url}, travelRequired: ${_this.travelRequired})';
}


}

/// @nodoc
abstract mixin class $VisaApplicationCopyWith<$Res>  {
  factory $VisaApplicationCopyWith(VisaApplication value, $Res Function(VisaApplication) _then) = _$VisaApplicationCopyWithImpl;
@useResult
$Res call({
 String? authority, String city, String country, String? provider, String? decidedIn, String? url, bool? travelRequired
});




}
/// @nodoc
class _$VisaApplicationCopyWithImpl<$Res>
    implements $VisaApplicationCopyWith<$Res> {
  _$VisaApplicationCopyWithImpl(this._self, this._then);

  final VisaApplication _self;
  final $Res Function(VisaApplication) _then;

/// Create a copy of VisaApplication
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? authority = freezed,Object? city = null,Object? country = null,Object? provider = freezed,Object? decidedIn = freezed,Object? url = freezed,Object? travelRequired = freezed,}) {
  return _then(VisaApplication(
authority: freezed == authority ? _self.authority : authority // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,decidedIn: freezed == decidedIn ? _self.decidedIn : decidedIn // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,travelRequired: freezed == travelRequired ? _self.travelRequired : travelRequired // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [VisaApplication].
extension VisaApplicationPatterns on VisaApplication {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VisaApplication value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VisaApplication() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VisaApplication value)  $default,){
final _that = this;
switch (_that) {
case _VisaApplication():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VisaApplication value)?  $default,){
final _that = this;
switch (_that) {
case _VisaApplication() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? authority,  String city,  String country,  String? provider,  String? decidedIn,  String? url,  bool? travelRequired)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VisaApplication() when $default != null:
return $default(_that.authority,_that.city,_that.country,_that.provider,_that.decidedIn,_that.url,_that.travelRequired);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? authority,  String city,  String country,  String? provider,  String? decidedIn,  String? url,  bool? travelRequired)  $default,) {final _that = this;
switch (_that) {
case _VisaApplication():
return $default(_that.authority,_that.city,_that.country,_that.provider,_that.decidedIn,_that.url,_that.travelRequired);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? authority,  String city,  String country,  String? provider,  String? decidedIn,  String? url,  bool? travelRequired)?  $default,) {final _that = this;
switch (_that) {
case _VisaApplication() when $default != null:
return $default(_that.authority,_that.city,_that.country,_that.provider,_that.decidedIn,_that.url,_that.travelRequired);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VisaApplication implements VisaApplication {
  const _VisaApplication({this.authority, required this.city, required this.country, this.provider, this.decidedIn, this.url, this.travelRequired});
  factory _VisaApplication.fromJson(Map<String, dynamic> json) => _$VisaApplicationFromJson(json);

@override final  String? authority;
@override final  String city;
@override final  String country;
/// External service provider, e.g. VFS, TLScontact, CAPAGO
@override final  String? provider;
/// Where the decision is taken if different
@override final  String? decidedIn;
@override final  String? url;
@override final  bool? travelRequired;

/// Create a copy of VisaApplication
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VisaApplicationCopyWith<_VisaApplication> get copyWith => __$VisaApplicationCopyWithImpl<_VisaApplication>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VisaApplicationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _VisaApplication&&(identical(other.authority, authority) || other.authority == authority)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.decidedIn, decidedIn) || other.decidedIn == decidedIn)&&(identical(other.url, url) || other.url == url)&&(identical(other.travelRequired, travelRequired) || other.travelRequired == travelRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,authority,city,country,provider,decidedIn,url,travelRequired);
}

@override
String toString() {
    return 'VisaApplication(authority: $authority, city: $city, country: $country, provider: $provider, decidedIn: $decidedIn, url: $url, travelRequired: $travelRequired)';
}


}

/// @nodoc
abstract mixin class _$VisaApplicationCopyWith<$Res> implements $VisaApplicationCopyWith<$Res> {
  factory _$VisaApplicationCopyWith(_VisaApplication value, $Res Function(_VisaApplication) _then) = __$VisaApplicationCopyWithImpl;
@override @useResult
$Res call({
 String? authority, String city, String country, String? provider, String? decidedIn, String? url, bool? travelRequired
});




}
/// @nodoc
class __$VisaApplicationCopyWithImpl<$Res>
    implements _$VisaApplicationCopyWith<$Res> {
  __$VisaApplicationCopyWithImpl(this._self, this._then);

  final _VisaApplication _self;
  final $Res Function(_VisaApplication) _then;

/// Create a copy of VisaApplication
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? authority = freezed,Object? city = null,Object? country = null,Object? provider = freezed,Object? decidedIn = freezed,Object? url = freezed,Object? travelRequired = freezed,}) {
  return _then(_VisaApplication(
authority: freezed == authority ? _self.authority : authority // ignore: cast_nullable_to_non_nullable
as String?,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,decidedIn: freezed == decidedIn ? _self.decidedIn : decidedIn // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,travelRequired: freezed == travelRequired ? _self.travelRequired : travelRequired // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$SchoolLeavingRecognition {

 String? get originQualification; String? get status; String? get note; String? get url;
/// Create a copy of SchoolLeavingRecognition
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SchoolLeavingRecognitionCopyWith<SchoolLeavingRecognition> get copyWith => _$SchoolLeavingRecognitionCopyWithImpl<SchoolLeavingRecognition>(this as SchoolLeavingRecognition, _$identity);

  /// Serializes this SchoolLeavingRecognition to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SchoolLeavingRecognition;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SchoolLeavingRecognition&&(identical(other.originQualification, _this.originQualification) || other.originQualification == _this.originQualification)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.url, _this.url) || other.url == _this.url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SchoolLeavingRecognition;
  return Object.hash(runtimeType,_this.originQualification,_this.status,_this.note,_this.url);
}

@override
String toString() {
  final _this = this as SchoolLeavingRecognition;
  return 'SchoolLeavingRecognition(originQualification: ${_this.originQualification}, status: ${_this.status}, note: ${_this.note}, url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $SchoolLeavingRecognitionCopyWith<$Res>  {
  factory $SchoolLeavingRecognitionCopyWith(SchoolLeavingRecognition value, $Res Function(SchoolLeavingRecognition) _then) = _$SchoolLeavingRecognitionCopyWithImpl;
@useResult
$Res call({
 String? originQualification, String? status, String? note, String? url
});




}
/// @nodoc
class _$SchoolLeavingRecognitionCopyWithImpl<$Res>
    implements $SchoolLeavingRecognitionCopyWith<$Res> {
  _$SchoolLeavingRecognitionCopyWithImpl(this._self, this._then);

  final SchoolLeavingRecognition _self;
  final $Res Function(SchoolLeavingRecognition) _then;

/// Create a copy of SchoolLeavingRecognition
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originQualification = freezed,Object? status = freezed,Object? note = freezed,Object? url = freezed,}) {
  return _then(SchoolLeavingRecognition(
originQualification: freezed == originQualification ? _self.originQualification : originQualification // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SchoolLeavingRecognition].
extension SchoolLeavingRecognitionPatterns on SchoolLeavingRecognition {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SchoolLeavingRecognition value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SchoolLeavingRecognition() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SchoolLeavingRecognition value)  $default,){
final _that = this;
switch (_that) {
case _SchoolLeavingRecognition():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SchoolLeavingRecognition value)?  $default,){
final _that = this;
switch (_that) {
case _SchoolLeavingRecognition() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? originQualification,  String? status,  String? note,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SchoolLeavingRecognition() when $default != null:
return $default(_that.originQualification,_that.status,_that.note,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? originQualification,  String? status,  String? note,  String? url)  $default,) {final _that = this;
switch (_that) {
case _SchoolLeavingRecognition():
return $default(_that.originQualification,_that.status,_that.note,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? originQualification,  String? status,  String? note,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _SchoolLeavingRecognition() when $default != null:
return $default(_that.originQualification,_that.status,_that.note,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SchoolLeavingRecognition implements SchoolLeavingRecognition {
  const _SchoolLeavingRecognition({this.originQualification, this.status, this.note, this.url});
  factory _SchoolLeavingRecognition.fromJson(Map<String, dynamic> json) => _$SchoolLeavingRecognitionFromJson(json);

@override final  String? originQualification;
@override final  String? status;
@override final  String? note;
@override final  String? url;

/// Create a copy of SchoolLeavingRecognition
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SchoolLeavingRecognitionCopyWith<_SchoolLeavingRecognition> get copyWith => __$SchoolLeavingRecognitionCopyWithImpl<_SchoolLeavingRecognition>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SchoolLeavingRecognitionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SchoolLeavingRecognition&&(identical(other.originQualification, originQualification) || other.originQualification == originQualification)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,originQualification,status,note,url);
}

@override
String toString() {
    return 'SchoolLeavingRecognition(originQualification: $originQualification, status: $status, note: $note, url: $url)';
}


}

/// @nodoc
abstract mixin class _$SchoolLeavingRecognitionCopyWith<$Res> implements $SchoolLeavingRecognitionCopyWith<$Res> {
  factory _$SchoolLeavingRecognitionCopyWith(_SchoolLeavingRecognition value, $Res Function(_SchoolLeavingRecognition) _then) = __$SchoolLeavingRecognitionCopyWithImpl;
@override @useResult
$Res call({
 String? originQualification, String? status, String? note, String? url
});




}
/// @nodoc
class __$SchoolLeavingRecognitionCopyWithImpl<$Res>
    implements _$SchoolLeavingRecognitionCopyWith<$Res> {
  __$SchoolLeavingRecognitionCopyWithImpl(this._self, this._then);

  final _SchoolLeavingRecognition _self;
  final $Res Function(_SchoolLeavingRecognition) _then;

/// Create a copy of SchoolLeavingRecognition
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originQualification = freezed,Object? status = freezed,Object? note = freezed,Object? url = freezed,}) {
  return _then(_SchoolLeavingRecognition(
originQualification: freezed == originQualification ? _self.originQualification : originQualification // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ScoreBase {

 int? get difficulty; double? get visaApprovalRate;
/// Create a copy of ScoreBase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScoreBaseCopyWith<ScoreBase> get copyWith => _$ScoreBaseCopyWithImpl<ScoreBase>(this as ScoreBase, _$identity);

  /// Serializes this ScoreBase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ScoreBase;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScoreBase&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.visaApprovalRate, _this.visaApprovalRate) || other.visaApprovalRate == _this.visaApprovalRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ScoreBase;
  return Object.hash(runtimeType,_this.difficulty,_this.visaApprovalRate);
}

@override
String toString() {
  final _this = this as ScoreBase;
  return 'ScoreBase(difficulty: ${_this.difficulty}, visaApprovalRate: ${_this.visaApprovalRate})';
}


}

/// @nodoc
abstract mixin class $ScoreBaseCopyWith<$Res>  {
  factory $ScoreBaseCopyWith(ScoreBase value, $Res Function(ScoreBase) _then) = _$ScoreBaseCopyWithImpl;
@useResult
$Res call({
 int? difficulty, double? visaApprovalRate
});




}
/// @nodoc
class _$ScoreBaseCopyWithImpl<$Res>
    implements $ScoreBaseCopyWith<$Res> {
  _$ScoreBaseCopyWithImpl(this._self, this._then);

  final ScoreBase _self;
  final $Res Function(ScoreBase) _then;

/// Create a copy of ScoreBase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? difficulty = freezed,Object? visaApprovalRate = freezed,}) {
  return _then(ScoreBase(
difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int?,visaApprovalRate: freezed == visaApprovalRate ? _self.visaApprovalRate : visaApprovalRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScoreBase].
extension ScoreBasePatterns on ScoreBase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScoreBase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScoreBase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScoreBase value)  $default,){
final _that = this;
switch (_that) {
case _ScoreBase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScoreBase value)?  $default,){
final _that = this;
switch (_that) {
case _ScoreBase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? difficulty,  double? visaApprovalRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScoreBase() when $default != null:
return $default(_that.difficulty,_that.visaApprovalRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? difficulty,  double? visaApprovalRate)  $default,) {final _that = this;
switch (_that) {
case _ScoreBase():
return $default(_that.difficulty,_that.visaApprovalRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? difficulty,  double? visaApprovalRate)?  $default,) {final _that = this;
switch (_that) {
case _ScoreBase() when $default != null:
return $default(_that.difficulty,_that.visaApprovalRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScoreBase implements ScoreBase {
  const _ScoreBase({this.difficulty, this.visaApprovalRate});
  factory _ScoreBase.fromJson(Map<String, dynamic> json) => _$ScoreBaseFromJson(json);

@override final  int? difficulty;
@override final  double? visaApprovalRate;

/// Create a copy of ScoreBase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScoreBaseCopyWith<_ScoreBase> get copyWith => __$ScoreBaseCopyWithImpl<_ScoreBase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScoreBaseToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScoreBase&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.visaApprovalRate, visaApprovalRate) || other.visaApprovalRate == visaApprovalRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,difficulty,visaApprovalRate);
}

@override
String toString() {
    return 'ScoreBase(difficulty: $difficulty, visaApprovalRate: $visaApprovalRate)';
}


}

/// @nodoc
abstract mixin class _$ScoreBaseCopyWith<$Res> implements $ScoreBaseCopyWith<$Res> {
  factory _$ScoreBaseCopyWith(_ScoreBase value, $Res Function(_ScoreBase) _then) = __$ScoreBaseCopyWithImpl;
@override @useResult
$Res call({
 int? difficulty, double? visaApprovalRate
});




}
/// @nodoc
class __$ScoreBaseCopyWithImpl<$Res>
    implements _$ScoreBaseCopyWith<$Res> {
  __$ScoreBaseCopyWithImpl(this._self, this._then);

  final _ScoreBase _self;
  final $Res Function(_ScoreBase) _then;

/// Create a copy of ScoreBase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? difficulty = freezed,Object? visaApprovalRate = freezed,}) {
  return _then(_ScoreBase(
difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int?,visaApprovalRate: freezed == visaApprovalRate ? _self.visaApprovalRate : visaApprovalRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$Corridor {

/// Firestore document id.
 String get id; String get origin; String get destination; Localized? get summary;/// Where a resident of origin applies for destination's long-stay visa
 VisaApplication get visaApplication; SchoolLeavingRecognition? get schoolLeavingRecognition;/// Editorial priors used by realism/difficulty until calibrated
 ScoreBase? get scoreBase; bool? get active; Provenance get provenance;
/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorridorCopyWith<Corridor> get copyWith => _$CorridorCopyWithImpl<Corridor>(this as Corridor, _$identity);

  /// Serializes this Corridor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Corridor;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Corridor&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.origin, _this.origin) || other.origin == _this.origin)&&(identical(other.destination, _this.destination) || other.destination == _this.destination)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&(identical(other.visaApplication, _this.visaApplication) || other.visaApplication == _this.visaApplication)&&(identical(other.schoolLeavingRecognition, _this.schoolLeavingRecognition) || other.schoolLeavingRecognition == _this.schoolLeavingRecognition)&&(identical(other.scoreBase, _this.scoreBase) || other.scoreBase == _this.scoreBase)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Corridor;
  return Object.hash(runtimeType,_this.id,_this.origin,_this.destination,_this.summary,_this.visaApplication,_this.schoolLeavingRecognition,_this.scoreBase,_this.active,_this.provenance);
}

@override
String toString() {
  final _this = this as Corridor;
  return 'Corridor(id: ${_this.id}, origin: ${_this.origin}, destination: ${_this.destination}, summary: ${_this.summary}, visaApplication: ${_this.visaApplication}, schoolLeavingRecognition: ${_this.schoolLeavingRecognition}, scoreBase: ${_this.scoreBase}, active: ${_this.active}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $CorridorCopyWith<$Res>  {
  factory $CorridorCopyWith(Corridor value, $Res Function(Corridor) _then) = _$CorridorCopyWithImpl;
@useResult
$Res call({
 String id, String origin, String destination, Localized? summary, VisaApplication visaApplication, SchoolLeavingRecognition? schoolLeavingRecognition, ScoreBase? scoreBase, bool? active, Provenance provenance
});


$LocalizedCopyWith<$Res>? get summary;$VisaApplicationCopyWith<$Res> get visaApplication;$SchoolLeavingRecognitionCopyWith<$Res>? get schoolLeavingRecognition;$ScoreBaseCopyWith<$Res>? get scoreBase;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$CorridorCopyWithImpl<$Res>
    implements $CorridorCopyWith<$Res> {
  _$CorridorCopyWithImpl(this._self, this._then);

  final Corridor _self;
  final $Res Function(Corridor) _then;

/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? origin = null,Object? destination = null,Object? summary = freezed,Object? visaApplication = null,Object? schoolLeavingRecognition = freezed,Object? scoreBase = freezed,Object? active = freezed,Object? provenance = null,}) {
  return _then(Corridor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Localized?,visaApplication: null == visaApplication ? _self.visaApplication : visaApplication // ignore: cast_nullable_to_non_nullable
as VisaApplication,schoolLeavingRecognition: freezed == schoolLeavingRecognition ? _self.schoolLeavingRecognition : schoolLeavingRecognition // ignore: cast_nullable_to_non_nullable
as SchoolLeavingRecognition?,scoreBase: freezed == scoreBase ? _self.scoreBase : scoreBase // ignore: cast_nullable_to_non_nullable
as ScoreBase?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VisaApplicationCopyWith<$Res> get visaApplication {
  
  return $VisaApplicationCopyWith<$Res>(_self.visaApplication, (value) {
    return _then(_self.copyWith(visaApplication: value));
  });
}/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SchoolLeavingRecognitionCopyWith<$Res>? get schoolLeavingRecognition {
    if (_self.schoolLeavingRecognition == null) {
    return null;
  }

  return $SchoolLeavingRecognitionCopyWith<$Res>(_self.schoolLeavingRecognition!, (value) {
    return _then(_self.copyWith(schoolLeavingRecognition: value));
  });
}/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBaseCopyWith<$Res>? get scoreBase {
    if (_self.scoreBase == null) {
    return null;
  }

  return $ScoreBaseCopyWith<$Res>(_self.scoreBase!, (value) {
    return _then(_self.copyWith(scoreBase: value));
  });
}/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [Corridor].
extension CorridorPatterns on Corridor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Corridor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Corridor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Corridor value)  $default,){
final _that = this;
switch (_that) {
case _Corridor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Corridor value)?  $default,){
final _that = this;
switch (_that) {
case _Corridor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String origin,  String destination,  Localized? summary,  VisaApplication visaApplication,  SchoolLeavingRecognition? schoolLeavingRecognition,  ScoreBase? scoreBase,  bool? active,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Corridor() when $default != null:
return $default(_that.id,_that.origin,_that.destination,_that.summary,_that.visaApplication,_that.schoolLeavingRecognition,_that.scoreBase,_that.active,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String origin,  String destination,  Localized? summary,  VisaApplication visaApplication,  SchoolLeavingRecognition? schoolLeavingRecognition,  ScoreBase? scoreBase,  bool? active,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _Corridor():
return $default(_that.id,_that.origin,_that.destination,_that.summary,_that.visaApplication,_that.schoolLeavingRecognition,_that.scoreBase,_that.active,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String origin,  String destination,  Localized? summary,  VisaApplication visaApplication,  SchoolLeavingRecognition? schoolLeavingRecognition,  ScoreBase? scoreBase,  bool? active,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _Corridor() when $default != null:
return $default(_that.id,_that.origin,_that.destination,_that.summary,_that.visaApplication,_that.schoolLeavingRecognition,_that.scoreBase,_that.active,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Corridor implements Corridor {
  const _Corridor({required this.id, required this.origin, required this.destination, this.summary, required this.visaApplication, this.schoolLeavingRecognition, this.scoreBase, this.active, required this.provenance});
  factory _Corridor.fromJson(Map<String, dynamic> json) => _$CorridorFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  String origin;
@override final  String destination;
@override final  Localized? summary;
/// Where a resident of origin applies for destination's long-stay visa
@override final  VisaApplication visaApplication;
@override final  SchoolLeavingRecognition? schoolLeavingRecognition;
/// Editorial priors used by realism/difficulty until calibrated
@override final  ScoreBase? scoreBase;
@override final  bool? active;
@override final  Provenance provenance;

/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorridorCopyWith<_Corridor> get copyWith => __$CorridorCopyWithImpl<_Corridor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CorridorToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Corridor&&(identical(other.id, id) || other.id == id)&&(identical(other.origin, origin) || other.origin == origin)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.visaApplication, visaApplication) || other.visaApplication == visaApplication)&&(identical(other.schoolLeavingRecognition, schoolLeavingRecognition) || other.schoolLeavingRecognition == schoolLeavingRecognition)&&(identical(other.scoreBase, scoreBase) || other.scoreBase == scoreBase)&&(identical(other.active, active) || other.active == active)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,origin,destination,summary,visaApplication,schoolLeavingRecognition,scoreBase,active,provenance);
}

@override
String toString() {
    return 'Corridor(id: $id, origin: $origin, destination: $destination, summary: $summary, visaApplication: $visaApplication, schoolLeavingRecognition: $schoolLeavingRecognition, scoreBase: $scoreBase, active: $active, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$CorridorCopyWith<$Res> implements $CorridorCopyWith<$Res> {
  factory _$CorridorCopyWith(_Corridor value, $Res Function(_Corridor) _then) = __$CorridorCopyWithImpl;
@override @useResult
$Res call({
 String id, String origin, String destination, Localized? summary, VisaApplication visaApplication, SchoolLeavingRecognition? schoolLeavingRecognition, ScoreBase? scoreBase, bool? active, Provenance provenance
});


@override $LocalizedCopyWith<$Res>? get summary;@override $VisaApplicationCopyWith<$Res> get visaApplication;@override $SchoolLeavingRecognitionCopyWith<$Res>? get schoolLeavingRecognition;@override $ScoreBaseCopyWith<$Res>? get scoreBase;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$CorridorCopyWithImpl<$Res>
    implements _$CorridorCopyWith<$Res> {
  __$CorridorCopyWithImpl(this._self, this._then);

  final _Corridor _self;
  final $Res Function(_Corridor) _then;

/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? origin = null,Object? destination = null,Object? summary = freezed,Object? visaApplication = null,Object? schoolLeavingRecognition = freezed,Object? scoreBase = freezed,Object? active = freezed,Object? provenance = null,}) {
  return _then(_Corridor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,origin: null == origin ? _self.origin : origin // ignore: cast_nullable_to_non_nullable
as String,destination: null == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as String,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as Localized?,visaApplication: null == visaApplication ? _self.visaApplication : visaApplication // ignore: cast_nullable_to_non_nullable
as VisaApplication,schoolLeavingRecognition: freezed == schoolLeavingRecognition ? _self.schoolLeavingRecognition : schoolLeavingRecognition // ignore: cast_nullable_to_non_nullable
as SchoolLeavingRecognition?,scoreBase: freezed == scoreBase ? _self.scoreBase : scoreBase // ignore: cast_nullable_to_non_nullable
as ScoreBase?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VisaApplicationCopyWith<$Res> get visaApplication {
  
  return $VisaApplicationCopyWith<$Res>(_self.visaApplication, (value) {
    return _then(_self.copyWith(visaApplication: value));
  });
}/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SchoolLeavingRecognitionCopyWith<$Res>? get schoolLeavingRecognition {
    if (_self.schoolLeavingRecognition == null) {
    return null;
  }

  return $SchoolLeavingRecognitionCopyWith<$Res>(_self.schoolLeavingRecognition!, (value) {
    return _then(_self.copyWith(schoolLeavingRecognition: value));
  });
}/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScoreBaseCopyWith<$Res>? get scoreBase {
    if (_self.scoreBase == null) {
    return null;
  }

  return $ScoreBaseCopyWith<$Res>(_self.scoreBase!, (value) {
    return _then(_self.copyWith(scoreBase: value));
  });
}/// Create a copy of Corridor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}

// dart format on
