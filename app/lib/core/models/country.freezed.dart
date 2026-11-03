// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostStudyWork {

 int? get months; String? get permitId; String? get note;
/// Create a copy of PostStudyWork
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostStudyWorkCopyWith<PostStudyWork> get copyWith => _$PostStudyWorkCopyWithImpl<PostStudyWork>(this as PostStudyWork, _$identity);

  /// Serializes this PostStudyWork to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PostStudyWork;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostStudyWork&&(identical(other.months, _this.months) || other.months == _this.months)&&(identical(other.permitId, _this.permitId) || other.permitId == _this.permitId)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PostStudyWork;
  return Object.hash(runtimeType,_this.months,_this.permitId,_this.note);
}

@override
String toString() {
  final _this = this as PostStudyWork;
  return 'PostStudyWork(months: ${_this.months}, permitId: ${_this.permitId}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $PostStudyWorkCopyWith<$Res>  {
  factory $PostStudyWorkCopyWith(PostStudyWork value, $Res Function(PostStudyWork) _then) = _$PostStudyWorkCopyWithImpl;
@useResult
$Res call({
 int? months, String? permitId, String? note
});




}
/// @nodoc
class _$PostStudyWorkCopyWithImpl<$Res>
    implements $PostStudyWorkCopyWith<$Res> {
  _$PostStudyWorkCopyWithImpl(this._self, this._then);

  final PostStudyWork _self;
  final $Res Function(PostStudyWork) _then;

/// Create a copy of PostStudyWork
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? months = freezed,Object? permitId = freezed,Object? note = freezed,}) {
  return _then(PostStudyWork(
months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int?,permitId: freezed == permitId ? _self.permitId : permitId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostStudyWork].
extension PostStudyWorkPatterns on PostStudyWork {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostStudyWork value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostStudyWork() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostStudyWork value)  $default,){
final _that = this;
switch (_that) {
case _PostStudyWork():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostStudyWork value)?  $default,){
final _that = this;
switch (_that) {
case _PostStudyWork() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? months,  String? permitId,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostStudyWork() when $default != null:
return $default(_that.months,_that.permitId,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? months,  String? permitId,  String? note)  $default,) {final _that = this;
switch (_that) {
case _PostStudyWork():
return $default(_that.months,_that.permitId,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? months,  String? permitId,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _PostStudyWork() when $default != null:
return $default(_that.months,_that.permitId,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostStudyWork implements PostStudyWork {
  const _PostStudyWork({this.months, this.permitId, this.note});
  factory _PostStudyWork.fromJson(Map<String, dynamic> json) => _$PostStudyWorkFromJson(json);

@override final  int? months;
@override final  String? permitId;
@override final  String? note;

/// Create a copy of PostStudyWork
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostStudyWorkCopyWith<_PostStudyWork> get copyWith => __$PostStudyWorkCopyWithImpl<_PostStudyWork>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostStudyWorkToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostStudyWork&&(identical(other.months, months) || other.months == months)&&(identical(other.permitId, permitId) || other.permitId == permitId)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,months,permitId,note);
}

@override
String toString() {
    return 'PostStudyWork(months: $months, permitId: $permitId, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PostStudyWorkCopyWith<$Res> implements $PostStudyWorkCopyWith<$Res> {
  factory _$PostStudyWorkCopyWith(_PostStudyWork value, $Res Function(_PostStudyWork) _then) = __$PostStudyWorkCopyWithImpl;
@override @useResult
$Res call({
 int? months, String? permitId, String? note
});




}
/// @nodoc
class __$PostStudyWorkCopyWithImpl<$Res>
    implements _$PostStudyWorkCopyWith<$Res> {
  __$PostStudyWorkCopyWithImpl(this._self, this._then);

  final _PostStudyWork _self;
  final $Res Function(_PostStudyWork) _then;

/// Create a copy of PostStudyWork
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? months = freezed,Object? permitId = freezed,Object? note = freezed,}) {
  return _then(_PostStudyWork(
months: freezed == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int?,permitId: freezed == permitId ? _self.permitId : permitId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RecognitionBody {

 String? get name; String? get url;
/// Create a copy of RecognitionBody
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecognitionBodyCopyWith<RecognitionBody> get copyWith => _$RecognitionBodyCopyWithImpl<RecognitionBody>(this as RecognitionBody, _$identity);

  /// Serializes this RecognitionBody to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RecognitionBody;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecognitionBody&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.url, _this.url) || other.url == _this.url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RecognitionBody;
  return Object.hash(runtimeType,_this.name,_this.url);
}

@override
String toString() {
  final _this = this as RecognitionBody;
  return 'RecognitionBody(name: ${_this.name}, url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $RecognitionBodyCopyWith<$Res>  {
  factory $RecognitionBodyCopyWith(RecognitionBody value, $Res Function(RecognitionBody) _then) = _$RecognitionBodyCopyWithImpl;
@useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class _$RecognitionBodyCopyWithImpl<$Res>
    implements $RecognitionBodyCopyWith<$Res> {
  _$RecognitionBodyCopyWithImpl(this._self, this._then);

  final RecognitionBody _self;
  final $Res Function(RecognitionBody) _then;

/// Create a copy of RecognitionBody
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(RecognitionBody(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecognitionBody].
extension RecognitionBodyPatterns on RecognitionBody {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecognitionBody value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecognitionBody() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecognitionBody value)  $default,){
final _that = this;
switch (_that) {
case _RecognitionBody():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecognitionBody value)?  $default,){
final _that = this;
switch (_that) {
case _RecognitionBody() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecognitionBody() when $default != null:
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? url)  $default,) {final _that = this;
switch (_that) {
case _RecognitionBody():
return $default(_that.name,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _RecognitionBody() when $default != null:
return $default(_that.name,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecognitionBody implements RecognitionBody {
  const _RecognitionBody({this.name, this.url});
  factory _RecognitionBody.fromJson(Map<String, dynamic> json) => _$RecognitionBodyFromJson(json);

@override final  String? name;
@override final  String? url;

/// Create a copy of RecognitionBody
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecognitionBodyCopyWith<_RecognitionBody> get copyWith => __$RecognitionBodyCopyWithImpl<_RecognitionBody>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecognitionBodyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecognitionBody&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,url);
}

@override
String toString() {
    return 'RecognitionBody(name: $name, url: $url)';
}


}

/// @nodoc
abstract mixin class _$RecognitionBodyCopyWith<$Res> implements $RecognitionBodyCopyWith<$Res> {
  factory _$RecognitionBodyCopyWith(_RecognitionBody value, $Res Function(_RecognitionBody) _then) = __$RecognitionBodyCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? url
});




}
/// @nodoc
class __$RecognitionBodyCopyWithImpl<$Res>
    implements _$RecognitionBodyCopyWith<$Res> {
  __$RecognitionBodyCopyWithImpl(this._self, this._then);

  final _RecognitionBody _self;
  final $Res Function(_RecognitionBody) _then;

/// Create a copy of RecognitionBody
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? url = freezed,}) {
  return _then(_RecognitionBody(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Country {

/// Firestore document id.
 String get id; Localized get name; CountryRegion get region; String get currency;/// Main languages of instruction/daily life, BCP-47
 List<String> get languages; MoneyRange? get livingCostMonthly;/// Typical public-university tuition for third-country students
 MoneyRange? get tuitionNonEu;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) CountryEnglishTaughtOffer? get englishTaughtOffer; PostStudyWork? get postStudyWork; RecognitionBody? get recognitionBody;/// Destination offered in the app
 bool? get active; Provenance get provenance;
/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryCopyWith<Country> get copyWith => _$CountryCopyWithImpl<Country>(this as Country, _$identity);

  /// Serializes this Country to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Country;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Country&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.region, _this.region) || other.region == _this.region)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&const DeepCollectionEquality().equals(other.languages, _this.languages)&&(identical(other.livingCostMonthly, _this.livingCostMonthly) || other.livingCostMonthly == _this.livingCostMonthly)&&(identical(other.tuitionNonEu, _this.tuitionNonEu) || other.tuitionNonEu == _this.tuitionNonEu)&&(identical(other.englishTaughtOffer, _this.englishTaughtOffer) || other.englishTaughtOffer == _this.englishTaughtOffer)&&(identical(other.postStudyWork, _this.postStudyWork) || other.postStudyWork == _this.postStudyWork)&&(identical(other.recognitionBody, _this.recognitionBody) || other.recognitionBody == _this.recognitionBody)&&(identical(other.active, _this.active) || other.active == _this.active)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Country;
  return Object.hash(runtimeType,_this.id,_this.name,_this.region,_this.currency,const DeepCollectionEquality().hash(_this.languages),_this.livingCostMonthly,_this.tuitionNonEu,_this.englishTaughtOffer,_this.postStudyWork,_this.recognitionBody,_this.active,_this.provenance);
}

@override
String toString() {
  final _this = this as Country;
  return 'Country(id: ${_this.id}, name: ${_this.name}, region: ${_this.region}, currency: ${_this.currency}, languages: ${_this.languages}, livingCostMonthly: ${_this.livingCostMonthly}, tuitionNonEu: ${_this.tuitionNonEu}, englishTaughtOffer: ${_this.englishTaughtOffer}, postStudyWork: ${_this.postStudyWork}, recognitionBody: ${_this.recognitionBody}, active: ${_this.active}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $CountryCopyWith<$Res>  {
  factory $CountryCopyWith(Country value, $Res Function(Country) _then) = _$CountryCopyWithImpl;
@useResult
$Res call({
 String id, Localized name, CountryRegion region, String currency, List<String> languages, MoneyRange? livingCostMonthly, MoneyRange? tuitionNonEu,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) CountryEnglishTaughtOffer? englishTaughtOffer, PostStudyWork? postStudyWork, RecognitionBody? recognitionBody, bool? active, Provenance provenance
});


$LocalizedCopyWith<$Res> get name;$MoneyRangeCopyWith<$Res>? get livingCostMonthly;$MoneyRangeCopyWith<$Res>? get tuitionNonEu;$PostStudyWorkCopyWith<$Res>? get postStudyWork;$RecognitionBodyCopyWith<$Res>? get recognitionBody;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$CountryCopyWithImpl<$Res>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._self, this._then);

  final Country _self;
  final $Res Function(Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? region = null,Object? currency = null,Object? languages = null,Object? livingCostMonthly = freezed,Object? tuitionNonEu = freezed,Object? englishTaughtOffer = freezed,Object? postStudyWork = freezed,Object? recognitionBody = freezed,Object? active = freezed,Object? provenance = null,}) {
  return _then(Country(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as CountryRegion,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,livingCostMonthly: freezed == livingCostMonthly ? _self.livingCostMonthly : livingCostMonthly // ignore: cast_nullable_to_non_nullable
as MoneyRange?,tuitionNonEu: freezed == tuitionNonEu ? _self.tuitionNonEu : tuitionNonEu // ignore: cast_nullable_to_non_nullable
as MoneyRange?,englishTaughtOffer: freezed == englishTaughtOffer ? _self.englishTaughtOffer : englishTaughtOffer // ignore: cast_nullable_to_non_nullable
as CountryEnglishTaughtOffer?,postStudyWork: freezed == postStudyWork ? _self.postStudyWork : postStudyWork // ignore: cast_nullable_to_non_nullable
as PostStudyWork?,recognitionBody: freezed == recognitionBody ? _self.recognitionBody : recognitionBody // ignore: cast_nullable_to_non_nullable
as RecognitionBody?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get livingCostMonthly {
    if (_self.livingCostMonthly == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.livingCostMonthly!, (value) {
    return _then(_self.copyWith(livingCostMonthly: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get tuitionNonEu {
    if (_self.tuitionNonEu == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.tuitionNonEu!, (value) {
    return _then(_self.copyWith(tuitionNonEu: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostStudyWorkCopyWith<$Res>? get postStudyWork {
    if (_self.postStudyWork == null) {
    return null;
  }

  return $PostStudyWorkCopyWith<$Res>(_self.postStudyWork!, (value) {
    return _then(_self.copyWith(postStudyWork: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecognitionBodyCopyWith<$Res>? get recognitionBody {
    if (_self.recognitionBody == null) {
    return null;
  }

  return $RecognitionBodyCopyWith<$Res>(_self.recognitionBody!, (value) {
    return _then(_self.copyWith(recognitionBody: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [Country].
extension CountryPatterns on Country {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Country value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Country() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Country value)  $default,){
final _that = this;
switch (_that) {
case _Country():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Country value)?  $default,){
final _that = this;
switch (_that) {
case _Country() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Localized name,  CountryRegion region,  String currency,  List<String> languages,  MoneyRange? livingCostMonthly,  MoneyRange? tuitionNonEu, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  CountryEnglishTaughtOffer? englishTaughtOffer,  PostStudyWork? postStudyWork,  RecognitionBody? recognitionBody,  bool? active,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.id,_that.name,_that.region,_that.currency,_that.languages,_that.livingCostMonthly,_that.tuitionNonEu,_that.englishTaughtOffer,_that.postStudyWork,_that.recognitionBody,_that.active,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Localized name,  CountryRegion region,  String currency,  List<String> languages,  MoneyRange? livingCostMonthly,  MoneyRange? tuitionNonEu, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  CountryEnglishTaughtOffer? englishTaughtOffer,  PostStudyWork? postStudyWork,  RecognitionBody? recognitionBody,  bool? active,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _Country():
return $default(_that.id,_that.name,_that.region,_that.currency,_that.languages,_that.livingCostMonthly,_that.tuitionNonEu,_that.englishTaughtOffer,_that.postStudyWork,_that.recognitionBody,_that.active,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Localized name,  CountryRegion region,  String currency,  List<String> languages,  MoneyRange? livingCostMonthly,  MoneyRange? tuitionNonEu, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  CountryEnglishTaughtOffer? englishTaughtOffer,  PostStudyWork? postStudyWork,  RecognitionBody? recognitionBody,  bool? active,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _Country() when $default != null:
return $default(_that.id,_that.name,_that.region,_that.currency,_that.languages,_that.livingCostMonthly,_that.tuitionNonEu,_that.englishTaughtOffer,_that.postStudyWork,_that.recognitionBody,_that.active,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Country implements Country {
  const _Country({required this.id, required this.name, required this.region, required this.currency,  List<String> languages = const [], this.livingCostMonthly, this.tuitionNonEu, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.englishTaughtOffer, this.postStudyWork, this.recognitionBody, this.active, required this.provenance}): _languages = languages;
  factory _Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  Localized name;
@override final  CountryRegion region;
@override final  String currency;
/// Main languages of instruction/daily life, BCP-47
 final  List<String> _languages;
/// Main languages of instruction/daily life, BCP-47
@override@JsonKey() List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override final  MoneyRange? livingCostMonthly;
/// Typical public-university tuition for third-country students
@override final  MoneyRange? tuitionNonEu;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  CountryEnglishTaughtOffer? englishTaughtOffer;
@override final  PostStudyWork? postStudyWork;
@override final  RecognitionBody? recognitionBody;
/// Destination offered in the app
@override final  bool? active;
@override final  Provenance provenance;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryCopyWith<_Country> get copyWith => __$CountryCopyWithImpl<_Country>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CountryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Country&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.region, region) || other.region == region)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.languages, _languages)&&(identical(other.livingCostMonthly, livingCostMonthly) || other.livingCostMonthly == livingCostMonthly)&&(identical(other.tuitionNonEu, tuitionNonEu) || other.tuitionNonEu == tuitionNonEu)&&(identical(other.englishTaughtOffer, englishTaughtOffer) || other.englishTaughtOffer == englishTaughtOffer)&&(identical(other.postStudyWork, postStudyWork) || other.postStudyWork == postStudyWork)&&(identical(other.recognitionBody, recognitionBody) || other.recognitionBody == recognitionBody)&&(identical(other.active, active) || other.active == active)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,region,currency,const DeepCollectionEquality().hash(_languages),livingCostMonthly,tuitionNonEu,englishTaughtOffer,postStudyWork,recognitionBody,active,provenance);
}

@override
String toString() {
    return 'Country(id: $id, name: $name, region: $region, currency: $currency, languages: $languages, livingCostMonthly: $livingCostMonthly, tuitionNonEu: $tuitionNonEu, englishTaughtOffer: $englishTaughtOffer, postStudyWork: $postStudyWork, recognitionBody: $recognitionBody, active: $active, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$CountryCopyWith(_Country value, $Res Function(_Country) _then) = __$CountryCopyWithImpl;
@override @useResult
$Res call({
 String id, Localized name, CountryRegion region, String currency, List<String> languages, MoneyRange? livingCostMonthly, MoneyRange? tuitionNonEu,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) CountryEnglishTaughtOffer? englishTaughtOffer, PostStudyWork? postStudyWork, RecognitionBody? recognitionBody, bool? active, Provenance provenance
});


@override $LocalizedCopyWith<$Res> get name;@override $MoneyRangeCopyWith<$Res>? get livingCostMonthly;@override $MoneyRangeCopyWith<$Res>? get tuitionNonEu;@override $PostStudyWorkCopyWith<$Res>? get postStudyWork;@override $RecognitionBodyCopyWith<$Res>? get recognitionBody;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$CountryCopyWithImpl<$Res>
    implements _$CountryCopyWith<$Res> {
  __$CountryCopyWithImpl(this._self, this._then);

  final _Country _self;
  final $Res Function(_Country) _then;

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? region = null,Object? currency = null,Object? languages = null,Object? livingCostMonthly = freezed,Object? tuitionNonEu = freezed,Object? englishTaughtOffer = freezed,Object? postStudyWork = freezed,Object? recognitionBody = freezed,Object? active = freezed,Object? provenance = null,}) {
  return _then(_Country(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as CountryRegion,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,livingCostMonthly: freezed == livingCostMonthly ? _self.livingCostMonthly : livingCostMonthly // ignore: cast_nullable_to_non_nullable
as MoneyRange?,tuitionNonEu: freezed == tuitionNonEu ? _self.tuitionNonEu : tuitionNonEu // ignore: cast_nullable_to_non_nullable
as MoneyRange?,englishTaughtOffer: freezed == englishTaughtOffer ? _self.englishTaughtOffer : englishTaughtOffer // ignore: cast_nullable_to_non_nullable
as CountryEnglishTaughtOffer?,postStudyWork: freezed == postStudyWork ? _self.postStudyWork : postStudyWork // ignore: cast_nullable_to_non_nullable
as PostStudyWork?,recognitionBody: freezed == recognitionBody ? _self.recognitionBody : recognitionBody // ignore: cast_nullable_to_non_nullable
as RecognitionBody?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get livingCostMonthly {
    if (_self.livingCostMonthly == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.livingCostMonthly!, (value) {
    return _then(_self.copyWith(livingCostMonthly: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get tuitionNonEu {
    if (_self.tuitionNonEu == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.tuitionNonEu!, (value) {
    return _then(_self.copyWith(tuitionNonEu: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostStudyWorkCopyWith<$Res>? get postStudyWork {
    if (_self.postStudyWork == null) {
    return null;
  }

  return $PostStudyWorkCopyWith<$Res>(_self.postStudyWork!, (value) {
    return _then(_self.copyWith(postStudyWork: value));
  });
}/// Create a copy of Country
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecognitionBodyCopyWith<$Res>? get recognitionBody {
    if (_self.recognitionBody == null) {
    return null;
  }

  return $RecognitionBodyCopyWith<$Res>(_self.recognitionBody!, (value) {
    return _then(_self.copyWith(recognitionBody: value));
  });
}/// Create a copy of Country
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
