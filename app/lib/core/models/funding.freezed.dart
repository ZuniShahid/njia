// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'funding.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FundingEligibility {

/// ISO alpha-2 or 'any'
 List<String> get nationalities; List<Isced> get isced; List<String> get fields; int? get maxAge; int? get minExperienceMonths; String? get note;
/// Create a copy of FundingEligibility
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundingEligibilityCopyWith<FundingEligibility> get copyWith => _$FundingEligibilityCopyWithImpl<FundingEligibility>(this as FundingEligibility, _$identity);

  /// Serializes this FundingEligibility to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FundingEligibility;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FundingEligibility&&const DeepCollectionEquality().equals(other.nationalities, _this.nationalities)&&const DeepCollectionEquality().equals(other.isced, _this.isced)&&const DeepCollectionEquality().equals(other.fields, _this.fields)&&(identical(other.maxAge, _this.maxAge) || other.maxAge == _this.maxAge)&&(identical(other.minExperienceMonths, _this.minExperienceMonths) || other.minExperienceMonths == _this.minExperienceMonths)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FundingEligibility;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.nationalities),const DeepCollectionEquality().hash(_this.isced),const DeepCollectionEquality().hash(_this.fields),_this.maxAge,_this.minExperienceMonths,_this.note);
}

@override
String toString() {
  final _this = this as FundingEligibility;
  return 'FundingEligibility(nationalities: ${_this.nationalities}, isced: ${_this.isced}, fields: ${_this.fields}, maxAge: ${_this.maxAge}, minExperienceMonths: ${_this.minExperienceMonths}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $FundingEligibilityCopyWith<$Res>  {
  factory $FundingEligibilityCopyWith(FundingEligibility value, $Res Function(FundingEligibility) _then) = _$FundingEligibilityCopyWithImpl;
@useResult
$Res call({
 List<String> nationalities, List<Isced> isced, List<String> fields, int? maxAge, int? minExperienceMonths, String? note
});




}
/// @nodoc
class _$FundingEligibilityCopyWithImpl<$Res>
    implements $FundingEligibilityCopyWith<$Res> {
  _$FundingEligibilityCopyWithImpl(this._self, this._then);

  final FundingEligibility _self;
  final $Res Function(FundingEligibility) _then;

/// Create a copy of FundingEligibility
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nationalities = null,Object? isced = null,Object? fields = null,Object? maxAge = freezed,Object? minExperienceMonths = freezed,Object? note = freezed,}) {
  return _then(FundingEligibility(
nationalities: null == nationalities ? _self.nationalities : nationalities // ignore: cast_nullable_to_non_nullable
as List<String>,isced: null == isced ? _self.isced : isced // ignore: cast_nullable_to_non_nullable
as List<Isced>,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>,maxAge: freezed == maxAge ? _self.maxAge : maxAge // ignore: cast_nullable_to_non_nullable
as int?,minExperienceMonths: freezed == minExperienceMonths ? _self.minExperienceMonths : minExperienceMonths // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [FundingEligibility].
extension FundingEligibilityPatterns on FundingEligibility {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FundingEligibility value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FundingEligibility() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FundingEligibility value)  $default,){
final _that = this;
switch (_that) {
case _FundingEligibility():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FundingEligibility value)?  $default,){
final _that = this;
switch (_that) {
case _FundingEligibility() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> nationalities,  List<Isced> isced,  List<String> fields,  int? maxAge,  int? minExperienceMonths,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FundingEligibility() when $default != null:
return $default(_that.nationalities,_that.isced,_that.fields,_that.maxAge,_that.minExperienceMonths,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> nationalities,  List<Isced> isced,  List<String> fields,  int? maxAge,  int? minExperienceMonths,  String? note)  $default,) {final _that = this;
switch (_that) {
case _FundingEligibility():
return $default(_that.nationalities,_that.isced,_that.fields,_that.maxAge,_that.minExperienceMonths,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> nationalities,  List<Isced> isced,  List<String> fields,  int? maxAge,  int? minExperienceMonths,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _FundingEligibility() when $default != null:
return $default(_that.nationalities,_that.isced,_that.fields,_that.maxAge,_that.minExperienceMonths,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FundingEligibility implements FundingEligibility {
  const _FundingEligibility({ List<String> nationalities = const [],  List<Isced> isced = const [],  List<String> fields = const [], this.maxAge, this.minExperienceMonths, this.note}): _nationalities = nationalities,_isced = isced,_fields = fields;
  factory _FundingEligibility.fromJson(Map<String, dynamic> json) => _$FundingEligibilityFromJson(json);

/// ISO alpha-2 or 'any'
 final  List<String> _nationalities;
/// ISO alpha-2 or 'any'
@override@JsonKey() List<String> get nationalities {
  if (_nationalities is EqualUnmodifiableListView) return _nationalities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nationalities);
}

 final  List<Isced> _isced;
@override@JsonKey() List<Isced> get isced {
  if (_isced is EqualUnmodifiableListView) return _isced;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_isced);
}

 final  List<String> _fields;
@override@JsonKey() List<String> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}

@override final  int? maxAge;
@override final  int? minExperienceMonths;
@override final  String? note;

/// Create a copy of FundingEligibility
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundingEligibilityCopyWith<_FundingEligibility> get copyWith => __$FundingEligibilityCopyWithImpl<_FundingEligibility>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FundingEligibilityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FundingEligibility&&const DeepCollectionEquality().equals(other.nationalities, _nationalities)&&const DeepCollectionEquality().equals(other.isced, _isced)&&const DeepCollectionEquality().equals(other.fields, _fields)&&(identical(other.maxAge, maxAge) || other.maxAge == maxAge)&&(identical(other.minExperienceMonths, minExperienceMonths) || other.minExperienceMonths == minExperienceMonths)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_nationalities),const DeepCollectionEquality().hash(_isced),const DeepCollectionEquality().hash(_fields),maxAge,minExperienceMonths,note);
}

@override
String toString() {
    return 'FundingEligibility(nationalities: $nationalities, isced: $isced, fields: $fields, maxAge: $maxAge, minExperienceMonths: $minExperienceMonths, note: $note)';
}


}

/// @nodoc
abstract mixin class _$FundingEligibilityCopyWith<$Res> implements $FundingEligibilityCopyWith<$Res> {
  factory _$FundingEligibilityCopyWith(_FundingEligibility value, $Res Function(_FundingEligibility) _then) = __$FundingEligibilityCopyWithImpl;
@override @useResult
$Res call({
 List<String> nationalities, List<Isced> isced, List<String> fields, int? maxAge, int? minExperienceMonths, String? note
});




}
/// @nodoc
class __$FundingEligibilityCopyWithImpl<$Res>
    implements _$FundingEligibilityCopyWith<$Res> {
  __$FundingEligibilityCopyWithImpl(this._self, this._then);

  final _FundingEligibility _self;
  final $Res Function(_FundingEligibility) _then;

/// Create a copy of FundingEligibility
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nationalities = null,Object? isced = null,Object? fields = null,Object? maxAge = freezed,Object? minExperienceMonths = freezed,Object? note = freezed,}) {
  return _then(_FundingEligibility(
nationalities: null == nationalities ? _self._nationalities : nationalities // ignore: cast_nullable_to_non_nullable
as List<String>,isced: null == isced ? _self._isced : isced // ignore: cast_nullable_to_non_nullable
as List<Isced>,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>,maxAge: freezed == maxAge ? _self.maxAge : maxAge // ignore: cast_nullable_to_non_nullable
as int?,minExperienceMonths: freezed == minExperienceMonths ? _self.minExperienceMonths : minExperienceMonths // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ApplicationWindow {

 String? get opens; String? get closes; String? get note;
/// Create a copy of ApplicationWindow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationWindowCopyWith<ApplicationWindow> get copyWith => _$ApplicationWindowCopyWithImpl<ApplicationWindow>(this as ApplicationWindow, _$identity);

  /// Serializes this ApplicationWindow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ApplicationWindow;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationWindow&&(identical(other.opens, _this.opens) || other.opens == _this.opens)&&(identical(other.closes, _this.closes) || other.closes == _this.closes)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ApplicationWindow;
  return Object.hash(runtimeType,_this.opens,_this.closes,_this.note);
}

@override
String toString() {
  final _this = this as ApplicationWindow;
  return 'ApplicationWindow(opens: ${_this.opens}, closes: ${_this.closes}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $ApplicationWindowCopyWith<$Res>  {
  factory $ApplicationWindowCopyWith(ApplicationWindow value, $Res Function(ApplicationWindow) _then) = _$ApplicationWindowCopyWithImpl;
@useResult
$Res call({
 String? opens, String? closes, String? note
});




}
/// @nodoc
class _$ApplicationWindowCopyWithImpl<$Res>
    implements $ApplicationWindowCopyWith<$Res> {
  _$ApplicationWindowCopyWithImpl(this._self, this._then);

  final ApplicationWindow _self;
  final $Res Function(ApplicationWindow) _then;

/// Create a copy of ApplicationWindow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? opens = freezed,Object? closes = freezed,Object? note = freezed,}) {
  return _then(ApplicationWindow(
opens: freezed == opens ? _self.opens : opens // ignore: cast_nullable_to_non_nullable
as String?,closes: freezed == closes ? _self.closes : closes // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationWindow].
extension ApplicationWindowPatterns on ApplicationWindow {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationWindow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationWindow() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationWindow value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationWindow():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationWindow value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationWindow() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? opens,  String? closes,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationWindow() when $default != null:
return $default(_that.opens,_that.closes,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? opens,  String? closes,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ApplicationWindow():
return $default(_that.opens,_that.closes,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? opens,  String? closes,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationWindow() when $default != null:
return $default(_that.opens,_that.closes,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ApplicationWindow implements ApplicationWindow {
  const _ApplicationWindow({this.opens, this.closes, this.note});
  factory _ApplicationWindow.fromJson(Map<String, dynamic> json) => _$ApplicationWindowFromJson(json);

@override final  String? opens;
@override final  String? closes;
@override final  String? note;

/// Create a copy of ApplicationWindow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationWindowCopyWith<_ApplicationWindow> get copyWith => __$ApplicationWindowCopyWithImpl<_ApplicationWindow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApplicationWindowToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationWindow&&(identical(other.opens, opens) || other.opens == opens)&&(identical(other.closes, closes) || other.closes == closes)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,opens,closes,note);
}

@override
String toString() {
    return 'ApplicationWindow(opens: $opens, closes: $closes, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ApplicationWindowCopyWith<$Res> implements $ApplicationWindowCopyWith<$Res> {
  factory _$ApplicationWindowCopyWith(_ApplicationWindow value, $Res Function(_ApplicationWindow) _then) = __$ApplicationWindowCopyWithImpl;
@override @useResult
$Res call({
 String? opens, String? closes, String? note
});




}
/// @nodoc
class __$ApplicationWindowCopyWithImpl<$Res>
    implements _$ApplicationWindowCopyWith<$Res> {
  __$ApplicationWindowCopyWithImpl(this._self, this._then);

  final _ApplicationWindow _self;
  final $Res Function(_ApplicationWindow) _then;

/// Create a copy of ApplicationWindow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? opens = freezed,Object? closes = freezed,Object? note = freezed,}) {
  return _then(_ApplicationWindow(
opens: freezed == opens ? _self.opens : opens // ignore: cast_nullable_to_non_nullable
as String?,closes: freezed == closes ? _self.closes : closes // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Funding {

/// Firestore document id.
 String get id; FundingType get type; String get name; String get funder;/// Destination countries
 List<String> get countryIds; MoneyRange? get amount; List<FundingCover> get covers; FundingEligibility get eligibility; ApplicationWindow? get applicationWindow; int? get difficulty; List<String> get requirementIds; Localized? get howToApply; String? get url; Provenance get provenance;
/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FundingCopyWith<Funding> get copyWith => _$FundingCopyWithImpl<Funding>(this as Funding, _$identity);

  /// Serializes this Funding to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Funding;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Funding&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.funder, _this.funder) || other.funder == _this.funder)&&const DeepCollectionEquality().equals(other.countryIds, _this.countryIds)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&const DeepCollectionEquality().equals(other.covers, _this.covers)&&(identical(other.eligibility, _this.eligibility) || other.eligibility == _this.eligibility)&&(identical(other.applicationWindow, _this.applicationWindow) || other.applicationWindow == _this.applicationWindow)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&const DeepCollectionEquality().equals(other.requirementIds, _this.requirementIds)&&(identical(other.howToApply, _this.howToApply) || other.howToApply == _this.howToApply)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Funding;
  return Object.hash(runtimeType,_this.id,_this.type,_this.name,_this.funder,const DeepCollectionEquality().hash(_this.countryIds),_this.amount,const DeepCollectionEquality().hash(_this.covers),_this.eligibility,_this.applicationWindow,_this.difficulty,const DeepCollectionEquality().hash(_this.requirementIds),_this.howToApply,_this.url,_this.provenance);
}

@override
String toString() {
  final _this = this as Funding;
  return 'Funding(id: ${_this.id}, type: ${_this.type}, name: ${_this.name}, funder: ${_this.funder}, countryIds: ${_this.countryIds}, amount: ${_this.amount}, covers: ${_this.covers}, eligibility: ${_this.eligibility}, applicationWindow: ${_this.applicationWindow}, difficulty: ${_this.difficulty}, requirementIds: ${_this.requirementIds}, howToApply: ${_this.howToApply}, url: ${_this.url}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $FundingCopyWith<$Res>  {
  factory $FundingCopyWith(Funding value, $Res Function(Funding) _then) = _$FundingCopyWithImpl;
@useResult
$Res call({
 String id, FundingType type, String name, String funder, List<String> countryIds, MoneyRange? amount, List<FundingCover> covers, FundingEligibility eligibility, ApplicationWindow? applicationWindow, int? difficulty, List<String> requirementIds, Localized? howToApply, String? url, Provenance provenance
});


$MoneyRangeCopyWith<$Res>? get amount;$FundingEligibilityCopyWith<$Res> get eligibility;$ApplicationWindowCopyWith<$Res>? get applicationWindow;$LocalizedCopyWith<$Res>? get howToApply;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$FundingCopyWithImpl<$Res>
    implements $FundingCopyWith<$Res> {
  _$FundingCopyWithImpl(this._self, this._then);

  final Funding _self;
  final $Res Function(Funding) _then;

/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? name = null,Object? funder = null,Object? countryIds = null,Object? amount = freezed,Object? covers = null,Object? eligibility = null,Object? applicationWindow = freezed,Object? difficulty = freezed,Object? requirementIds = null,Object? howToApply = freezed,Object? url = freezed,Object? provenance = null,}) {
  return _then(Funding(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FundingType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,funder: null == funder ? _self.funder : funder // ignore: cast_nullable_to_non_nullable
as String,countryIds: null == countryIds ? _self.countryIds : countryIds // ignore: cast_nullable_to_non_nullable
as List<String>,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as MoneyRange?,covers: null == covers ? _self.covers : covers // ignore: cast_nullable_to_non_nullable
as List<FundingCover>,eligibility: null == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as FundingEligibility,applicationWindow: freezed == applicationWindow ? _self.applicationWindow : applicationWindow // ignore: cast_nullable_to_non_nullable
as ApplicationWindow?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int?,requirementIds: null == requirementIds ? _self.requirementIds : requirementIds // ignore: cast_nullable_to_non_nullable
as List<String>,howToApply: freezed == howToApply ? _self.howToApply : howToApply // ignore: cast_nullable_to_non_nullable
as Localized?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get amount {
    if (_self.amount == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.amount!, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundingEligibilityCopyWith<$Res> get eligibility {
  
  return $FundingEligibilityCopyWith<$Res>(_self.eligibility, (value) {
    return _then(_self.copyWith(eligibility: value));
  });
}/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationWindowCopyWith<$Res>? get applicationWindow {
    if (_self.applicationWindow == null) {
    return null;
  }

  return $ApplicationWindowCopyWith<$Res>(_self.applicationWindow!, (value) {
    return _then(_self.copyWith(applicationWindow: value));
  });
}/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get howToApply {
    if (_self.howToApply == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.howToApply!, (value) {
    return _then(_self.copyWith(howToApply: value));
  });
}/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [Funding].
extension FundingPatterns on Funding {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Funding value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Funding() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Funding value)  $default,){
final _that = this;
switch (_that) {
case _Funding():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Funding value)?  $default,){
final _that = this;
switch (_that) {
case _Funding() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  FundingType type,  String name,  String funder,  List<String> countryIds,  MoneyRange? amount,  List<FundingCover> covers,  FundingEligibility eligibility,  ApplicationWindow? applicationWindow,  int? difficulty,  List<String> requirementIds,  Localized? howToApply,  String? url,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Funding() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.funder,_that.countryIds,_that.amount,_that.covers,_that.eligibility,_that.applicationWindow,_that.difficulty,_that.requirementIds,_that.howToApply,_that.url,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  FundingType type,  String name,  String funder,  List<String> countryIds,  MoneyRange? amount,  List<FundingCover> covers,  FundingEligibility eligibility,  ApplicationWindow? applicationWindow,  int? difficulty,  List<String> requirementIds,  Localized? howToApply,  String? url,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _Funding():
return $default(_that.id,_that.type,_that.name,_that.funder,_that.countryIds,_that.amount,_that.covers,_that.eligibility,_that.applicationWindow,_that.difficulty,_that.requirementIds,_that.howToApply,_that.url,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  FundingType type,  String name,  String funder,  List<String> countryIds,  MoneyRange? amount,  List<FundingCover> covers,  FundingEligibility eligibility,  ApplicationWindow? applicationWindow,  int? difficulty,  List<String> requirementIds,  Localized? howToApply,  String? url,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _Funding() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.funder,_that.countryIds,_that.amount,_that.covers,_that.eligibility,_that.applicationWindow,_that.difficulty,_that.requirementIds,_that.howToApply,_that.url,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Funding implements Funding {
  const _Funding({required this.id, required this.type, required this.name, required this.funder,  List<String> countryIds = const [], this.amount,  List<FundingCover> covers = const [], required this.eligibility, this.applicationWindow, this.difficulty,  List<String> requirementIds = const [], this.howToApply, this.url, required this.provenance}): _countryIds = countryIds,_covers = covers,_requirementIds = requirementIds;
  factory _Funding.fromJson(Map<String, dynamic> json) => _$FundingFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  FundingType type;
@override final  String name;
@override final  String funder;
/// Destination countries
 final  List<String> _countryIds;
/// Destination countries
@override@JsonKey() List<String> get countryIds {
  if (_countryIds is EqualUnmodifiableListView) return _countryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_countryIds);
}

@override final  MoneyRange? amount;
 final  List<FundingCover> _covers;
@override@JsonKey() List<FundingCover> get covers {
  if (_covers is EqualUnmodifiableListView) return _covers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_covers);
}

@override final  FundingEligibility eligibility;
@override final  ApplicationWindow? applicationWindow;
@override final  int? difficulty;
 final  List<String> _requirementIds;
@override@JsonKey() List<String> get requirementIds {
  if (_requirementIds is EqualUnmodifiableListView) return _requirementIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirementIds);
}

@override final  Localized? howToApply;
@override final  String? url;
@override final  Provenance provenance;

/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FundingCopyWith<_Funding> get copyWith => __$FundingCopyWithImpl<_Funding>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FundingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Funding&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.funder, funder) || other.funder == funder)&&const DeepCollectionEquality().equals(other.countryIds, _countryIds)&&(identical(other.amount, amount) || other.amount == amount)&&const DeepCollectionEquality().equals(other.covers, _covers)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.applicationWindow, applicationWindow) || other.applicationWindow == applicationWindow)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&const DeepCollectionEquality().equals(other.requirementIds, _requirementIds)&&(identical(other.howToApply, howToApply) || other.howToApply == howToApply)&&(identical(other.url, url) || other.url == url)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,name,funder,const DeepCollectionEquality().hash(_countryIds),amount,const DeepCollectionEquality().hash(_covers),eligibility,applicationWindow,difficulty,const DeepCollectionEquality().hash(_requirementIds),howToApply,url,provenance);
}

@override
String toString() {
    return 'Funding(id: $id, type: $type, name: $name, funder: $funder, countryIds: $countryIds, amount: $amount, covers: $covers, eligibility: $eligibility, applicationWindow: $applicationWindow, difficulty: $difficulty, requirementIds: $requirementIds, howToApply: $howToApply, url: $url, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$FundingCopyWith<$Res> implements $FundingCopyWith<$Res> {
  factory _$FundingCopyWith(_Funding value, $Res Function(_Funding) _then) = __$FundingCopyWithImpl;
@override @useResult
$Res call({
 String id, FundingType type, String name, String funder, List<String> countryIds, MoneyRange? amount, List<FundingCover> covers, FundingEligibility eligibility, ApplicationWindow? applicationWindow, int? difficulty, List<String> requirementIds, Localized? howToApply, String? url, Provenance provenance
});


@override $MoneyRangeCopyWith<$Res>? get amount;@override $FundingEligibilityCopyWith<$Res> get eligibility;@override $ApplicationWindowCopyWith<$Res>? get applicationWindow;@override $LocalizedCopyWith<$Res>? get howToApply;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$FundingCopyWithImpl<$Res>
    implements _$FundingCopyWith<$Res> {
  __$FundingCopyWithImpl(this._self, this._then);

  final _Funding _self;
  final $Res Function(_Funding) _then;

/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? name = null,Object? funder = null,Object? countryIds = null,Object? amount = freezed,Object? covers = null,Object? eligibility = null,Object? applicationWindow = freezed,Object? difficulty = freezed,Object? requirementIds = null,Object? howToApply = freezed,Object? url = freezed,Object? provenance = null,}) {
  return _then(_Funding(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as FundingType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,funder: null == funder ? _self.funder : funder // ignore: cast_nullable_to_non_nullable
as String,countryIds: null == countryIds ? _self._countryIds : countryIds // ignore: cast_nullable_to_non_nullable
as List<String>,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as MoneyRange?,covers: null == covers ? _self._covers : covers // ignore: cast_nullable_to_non_nullable
as List<FundingCover>,eligibility: null == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as FundingEligibility,applicationWindow: freezed == applicationWindow ? _self.applicationWindow : applicationWindow // ignore: cast_nullable_to_non_nullable
as ApplicationWindow?,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int?,requirementIds: null == requirementIds ? _self._requirementIds : requirementIds // ignore: cast_nullable_to_non_nullable
as List<String>,howToApply: freezed == howToApply ? _self.howToApply : howToApply // ignore: cast_nullable_to_non_nullable
as Localized?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get amount {
    if (_self.amount == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.amount!, (value) {
    return _then(_self.copyWith(amount: value));
  });
}/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FundingEligibilityCopyWith<$Res> get eligibility {
  
  return $FundingEligibilityCopyWith<$Res>(_self.eligibility, (value) {
    return _then(_self.copyWith(eligibility: value));
  });
}/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApplicationWindowCopyWith<$Res>? get applicationWindow {
    if (_self.applicationWindow == null) {
    return null;
  }

  return $ApplicationWindowCopyWith<$Res>(_self.applicationWindow!, (value) {
    return _then(_self.copyWith(applicationWindow: value));
  });
}/// Create a copy of Funding
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get howToApply {
    if (_self.howToApply == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.howToApply!, (value) {
    return _then(_self.copyWith(howToApply: value));
  });
}/// Create a copy of Funding
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
