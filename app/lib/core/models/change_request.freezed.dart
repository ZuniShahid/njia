// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DiffEntry {

 String? get path; Object? get from; Object? get to;
/// Create a copy of DiffEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiffEntryCopyWith<DiffEntry> get copyWith => _$DiffEntryCopyWithImpl<DiffEntry>(this as DiffEntry, _$identity);

  /// Serializes this DiffEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DiffEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiffEntry&&(identical(other.path, _this.path) || other.path == _this.path)&&const DeepCollectionEquality().equals(other.from, _this.from)&&const DeepCollectionEquality().equals(other.to, _this.to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DiffEntry;
  return Object.hash(runtimeType,_this.path,const DeepCollectionEquality().hash(_this.from),const DeepCollectionEquality().hash(_this.to));
}

@override
String toString() {
  final _this = this as DiffEntry;
  return 'DiffEntry(path: ${_this.path}, from: ${_this.from}, to: ${_this.to})';
}


}

/// @nodoc
abstract mixin class $DiffEntryCopyWith<$Res>  {
  factory $DiffEntryCopyWith(DiffEntry value, $Res Function(DiffEntry) _then) = _$DiffEntryCopyWithImpl;
@useResult
$Res call({
 String? path, Object? from, Object? to
});




}
/// @nodoc
class _$DiffEntryCopyWithImpl<$Res>
    implements $DiffEntryCopyWith<$Res> {
  _$DiffEntryCopyWithImpl(this._self, this._then);

  final DiffEntry _self;
  final $Res Function(DiffEntry) _then;

/// Create a copy of DiffEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = freezed,Object? from = freezed,Object? to = freezed,}) {
  return _then(DiffEntry(
path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,from: freezed == from ? _self.from : from ,to: freezed == to ? _self.to : to ,
  ));
}

}


/// Adds pattern-matching-related methods to [DiffEntry].
extension DiffEntryPatterns on DiffEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiffEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiffEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiffEntry value)  $default,){
final _that = this;
switch (_that) {
case _DiffEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiffEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DiffEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? path,  Object? from,  Object? to)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiffEntry() when $default != null:
return $default(_that.path,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? path,  Object? from,  Object? to)  $default,) {final _that = this;
switch (_that) {
case _DiffEntry():
return $default(_that.path,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? path,  Object? from,  Object? to)?  $default,) {final _that = this;
switch (_that) {
case _DiffEntry() when $default != null:
return $default(_that.path,_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiffEntry implements DiffEntry {
  const _DiffEntry({this.path, this.from, this.to});
  factory _DiffEntry.fromJson(Map<String, dynamic> json) => _$DiffEntryFromJson(json);

@override final  String? path;
@override final  Object? from;
@override final  Object? to;

/// Create a copy of DiffEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiffEntryCopyWith<_DiffEntry> get copyWith => __$DiffEntryCopyWithImpl<_DiffEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiffEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiffEntry&&(identical(other.path, path) || other.path == path)&&const DeepCollectionEquality().equals(other.from, from)&&const DeepCollectionEquality().equals(other.to, to));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,path,const DeepCollectionEquality().hash(from),const DeepCollectionEquality().hash(to));
}

@override
String toString() {
    return 'DiffEntry(path: $path, from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class _$DiffEntryCopyWith<$Res> implements $DiffEntryCopyWith<$Res> {
  factory _$DiffEntryCopyWith(_DiffEntry value, $Res Function(_DiffEntry) _then) = __$DiffEntryCopyWithImpl;
@override @useResult
$Res call({
 String? path, Object? from, Object? to
});




}
/// @nodoc
class __$DiffEntryCopyWithImpl<$Res>
    implements _$DiffEntryCopyWith<$Res> {
  __$DiffEntryCopyWithImpl(this._self, this._then);

  final _DiffEntry _self;
  final $Res Function(_DiffEntry) _then;

/// Create a copy of DiffEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = freezed,Object? from = freezed,Object? to = freezed,}) {
  return _then(_DiffEntry(
path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,from: freezed == from ? _self.from : from ,to: freezed == to ? _self.to : to ,
  ));
}


}


/// @nodoc
mixin _$Evidence {

 String? get url; String? get quote; String? get fetchedAt;
/// Create a copy of Evidence
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EvidenceCopyWith<Evidence> get copyWith => _$EvidenceCopyWithImpl<Evidence>(this as Evidence, _$identity);

  /// Serializes this Evidence to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Evidence;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Evidence&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.quote, _this.quote) || other.quote == _this.quote)&&(identical(other.fetchedAt, _this.fetchedAt) || other.fetchedAt == _this.fetchedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Evidence;
  return Object.hash(runtimeType,_this.url,_this.quote,_this.fetchedAt);
}

@override
String toString() {
  final _this = this as Evidence;
  return 'Evidence(url: ${_this.url}, quote: ${_this.quote}, fetchedAt: ${_this.fetchedAt})';
}


}

/// @nodoc
abstract mixin class $EvidenceCopyWith<$Res>  {
  factory $EvidenceCopyWith(Evidence value, $Res Function(Evidence) _then) = _$EvidenceCopyWithImpl;
@useResult
$Res call({
 String? url, String? quote, String? fetchedAt
});




}
/// @nodoc
class _$EvidenceCopyWithImpl<$Res>
    implements $EvidenceCopyWith<$Res> {
  _$EvidenceCopyWithImpl(this._self, this._then);

  final Evidence _self;
  final $Res Function(Evidence) _then;

/// Create a copy of Evidence
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? url = freezed,Object? quote = freezed,Object? fetchedAt = freezed,}) {
  return _then(Evidence(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,fetchedAt: freezed == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Evidence].
extension EvidencePatterns on Evidence {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Evidence value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Evidence() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Evidence value)  $default,){
final _that = this;
switch (_that) {
case _Evidence():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Evidence value)?  $default,){
final _that = this;
switch (_that) {
case _Evidence() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? url,  String? quote,  String? fetchedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Evidence() when $default != null:
return $default(_that.url,_that.quote,_that.fetchedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? url,  String? quote,  String? fetchedAt)  $default,) {final _that = this;
switch (_that) {
case _Evidence():
return $default(_that.url,_that.quote,_that.fetchedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? url,  String? quote,  String? fetchedAt)?  $default,) {final _that = this;
switch (_that) {
case _Evidence() when $default != null:
return $default(_that.url,_that.quote,_that.fetchedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Evidence implements Evidence {
  const _Evidence({this.url, this.quote, this.fetchedAt});
  factory _Evidence.fromJson(Map<String, dynamic> json) => _$EvidenceFromJson(json);

@override final  String? url;
@override final  String? quote;
@override final  String? fetchedAt;

/// Create a copy of Evidence
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EvidenceCopyWith<_Evidence> get copyWith => __$EvidenceCopyWithImpl<_Evidence>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EvidenceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Evidence&&(identical(other.url, url) || other.url == url)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,url,quote,fetchedAt);
}

@override
String toString() {
    return 'Evidence(url: $url, quote: $quote, fetchedAt: $fetchedAt)';
}


}

/// @nodoc
abstract mixin class _$EvidenceCopyWith<$Res> implements $EvidenceCopyWith<$Res> {
  factory _$EvidenceCopyWith(_Evidence value, $Res Function(_Evidence) _then) = __$EvidenceCopyWithImpl;
@override @useResult
$Res call({
 String? url, String? quote, String? fetchedAt
});




}
/// @nodoc
class __$EvidenceCopyWithImpl<$Res>
    implements _$EvidenceCopyWith<$Res> {
  __$EvidenceCopyWithImpl(this._self, this._then);

  final _Evidence _self;
  final $Res Function(_Evidence) _then;

/// Create a copy of Evidence
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? url = freezed,Object? quote = freezed,Object? fetchedAt = freezed,}) {
  return _then(_Evidence(
url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,fetchedAt: freezed == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReviewDecision {

 String? get uid;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ReviewDecisionChannel? get channel; String? get note; String? get decidedAt;
/// Create a copy of ReviewDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDecisionCopyWith<ReviewDecision> get copyWith => _$ReviewDecisionCopyWithImpl<ReviewDecision>(this as ReviewDecision, _$identity);

  /// Serializes this ReviewDecision to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReviewDecision;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDecision&&(identical(other.uid, _this.uid) || other.uid == _this.uid)&&(identical(other.channel, _this.channel) || other.channel == _this.channel)&&(identical(other.note, _this.note) || other.note == _this.note)&&(identical(other.decidedAt, _this.decidedAt) || other.decidedAt == _this.decidedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReviewDecision;
  return Object.hash(runtimeType,_this.uid,_this.channel,_this.note,_this.decidedAt);
}

@override
String toString() {
  final _this = this as ReviewDecision;
  return 'ReviewDecision(uid: ${_this.uid}, channel: ${_this.channel}, note: ${_this.note}, decidedAt: ${_this.decidedAt})';
}


}

/// @nodoc
abstract mixin class $ReviewDecisionCopyWith<$Res>  {
  factory $ReviewDecisionCopyWith(ReviewDecision value, $Res Function(ReviewDecision) _then) = _$ReviewDecisionCopyWithImpl;
@useResult
$Res call({
 String? uid,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ReviewDecisionChannel? channel, String? note, String? decidedAt
});




}
/// @nodoc
class _$ReviewDecisionCopyWithImpl<$Res>
    implements $ReviewDecisionCopyWith<$Res> {
  _$ReviewDecisionCopyWithImpl(this._self, this._then);

  final ReviewDecision _self;
  final $Res Function(ReviewDecision) _then;

/// Create a copy of ReviewDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = freezed,Object? channel = freezed,Object? note = freezed,Object? decidedAt = freezed,}) {
  return _then(ReviewDecision(
uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ReviewDecisionChannel?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,decidedAt: freezed == decidedAt ? _self.decidedAt : decidedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewDecision].
extension ReviewDecisionPatterns on ReviewDecision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewDecision value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewDecision() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewDecision value)  $default,){
final _that = this;
switch (_that) {
case _ReviewDecision():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewDecision value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewDecision() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? uid, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ReviewDecisionChannel? channel,  String? note,  String? decidedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewDecision() when $default != null:
return $default(_that.uid,_that.channel,_that.note,_that.decidedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? uid, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ReviewDecisionChannel? channel,  String? note,  String? decidedAt)  $default,) {final _that = this;
switch (_that) {
case _ReviewDecision():
return $default(_that.uid,_that.channel,_that.note,_that.decidedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? uid, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ReviewDecisionChannel? channel,  String? note,  String? decidedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReviewDecision() when $default != null:
return $default(_that.uid,_that.channel,_that.note,_that.decidedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewDecision implements ReviewDecision {
  const _ReviewDecision({this.uid, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.channel, this.note, this.decidedAt});
  factory _ReviewDecision.fromJson(Map<String, dynamic> json) => _$ReviewDecisionFromJson(json);

@override final  String? uid;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ReviewDecisionChannel? channel;
@override final  String? note;
@override final  String? decidedAt;

/// Create a copy of ReviewDecision
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDecisionCopyWith<_ReviewDecision> get copyWith => __$ReviewDecisionCopyWithImpl<_ReviewDecision>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDecisionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDecision&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.note, note) || other.note == note)&&(identical(other.decidedAt, decidedAt) || other.decidedAt == decidedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,uid,channel,note,decidedAt);
}

@override
String toString() {
    return 'ReviewDecision(uid: $uid, channel: $channel, note: $note, decidedAt: $decidedAt)';
}


}

/// @nodoc
abstract mixin class _$ReviewDecisionCopyWith<$Res> implements $ReviewDecisionCopyWith<$Res> {
  factory _$ReviewDecisionCopyWith(_ReviewDecision value, $Res Function(_ReviewDecision) _then) = __$ReviewDecisionCopyWithImpl;
@override @useResult
$Res call({
 String? uid,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ReviewDecisionChannel? channel, String? note, String? decidedAt
});




}
/// @nodoc
class __$ReviewDecisionCopyWithImpl<$Res>
    implements _$ReviewDecisionCopyWith<$Res> {
  __$ReviewDecisionCopyWithImpl(this._self, this._then);

  final _ReviewDecision _self;
  final $Res Function(_ReviewDecision) _then;

/// Create a copy of ReviewDecision
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = freezed,Object? channel = freezed,Object? note = freezed,Object? decidedAt = freezed,}) {
  return _then(_ReviewDecision(
uid: freezed == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String?,channel: freezed == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as ReviewDecisionChannel?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,decidedAt: freezed == decidedAt ? _self.decidedAt : decidedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChangeRequest {

/// Firestore document id.
 String get id; String? get runId; String get targetCollection; String get targetId; ChangeRequestOp get op; Map<String, dynamic>? get before; Map<String, dynamic> get after; List<DiffEntry> get diff; String get sourceId; Evidence? get evidence;/// model id or 'manual'
 String? get extractedBy; double? get confidence; ChangeRequestStatus get status; ReviewDecision? get reviewer;/// HMAC token embedded in approve/reject links
 String? get approvalToken; String get createdAt; String? get appliedAt; String? get error;
/// Create a copy of ChangeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeRequestCopyWith<ChangeRequest> get copyWith => _$ChangeRequestCopyWithImpl<ChangeRequest>(this as ChangeRequest, _$identity);

  /// Serializes this ChangeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChangeRequest;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeRequest&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.runId, _this.runId) || other.runId == _this.runId)&&(identical(other.targetCollection, _this.targetCollection) || other.targetCollection == _this.targetCollection)&&(identical(other.targetId, _this.targetId) || other.targetId == _this.targetId)&&(identical(other.op, _this.op) || other.op == _this.op)&&const DeepCollectionEquality().equals(other.before, _this.before)&&const DeepCollectionEquality().equals(other.after, _this.after)&&const DeepCollectionEquality().equals(other.diff, _this.diff)&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.evidence, _this.evidence) || other.evidence == _this.evidence)&&(identical(other.extractedBy, _this.extractedBy) || other.extractedBy == _this.extractedBy)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.reviewer, _this.reviewer) || other.reviewer == _this.reviewer)&&(identical(other.approvalToken, _this.approvalToken) || other.approvalToken == _this.approvalToken)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.appliedAt, _this.appliedAt) || other.appliedAt == _this.appliedAt)&&(identical(other.error, _this.error) || other.error == _this.error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChangeRequest;
  return Object.hash(runtimeType,_this.id,_this.runId,_this.targetCollection,_this.targetId,_this.op,const DeepCollectionEquality().hash(_this.before),const DeepCollectionEquality().hash(_this.after),const DeepCollectionEquality().hash(_this.diff),_this.sourceId,_this.evidence,_this.extractedBy,_this.confidence,_this.status,_this.reviewer,_this.approvalToken,_this.createdAt,_this.appliedAt,_this.error);
}

@override
String toString() {
  final _this = this as ChangeRequest;
  return 'ChangeRequest(id: ${_this.id}, runId: ${_this.runId}, targetCollection: ${_this.targetCollection}, targetId: ${_this.targetId}, op: ${_this.op}, before: ${_this.before}, after: ${_this.after}, diff: ${_this.diff}, sourceId: ${_this.sourceId}, evidence: ${_this.evidence}, extractedBy: ${_this.extractedBy}, confidence: ${_this.confidence}, status: ${_this.status}, reviewer: ${_this.reviewer}, approvalToken: ${_this.approvalToken}, createdAt: ${_this.createdAt}, appliedAt: ${_this.appliedAt}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $ChangeRequestCopyWith<$Res>  {
  factory $ChangeRequestCopyWith(ChangeRequest value, $Res Function(ChangeRequest) _then) = _$ChangeRequestCopyWithImpl;
@useResult
$Res call({
 String id, String? runId, String targetCollection, String targetId, ChangeRequestOp op, Map<String, dynamic>? before, Map<String, dynamic> after, List<DiffEntry> diff, String sourceId, Evidence? evidence, String? extractedBy, double? confidence, ChangeRequestStatus status, ReviewDecision? reviewer, String? approvalToken, String createdAt, String? appliedAt, String? error
});


$EvidenceCopyWith<$Res>? get evidence;$ReviewDecisionCopyWith<$Res>? get reviewer;

}
/// @nodoc
class _$ChangeRequestCopyWithImpl<$Res>
    implements $ChangeRequestCopyWith<$Res> {
  _$ChangeRequestCopyWithImpl(this._self, this._then);

  final ChangeRequest _self;
  final $Res Function(ChangeRequest) _then;

/// Create a copy of ChangeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? runId = freezed,Object? targetCollection = null,Object? targetId = null,Object? op = null,Object? before = freezed,Object? after = null,Object? diff = null,Object? sourceId = null,Object? evidence = freezed,Object? extractedBy = freezed,Object? confidence = freezed,Object? status = null,Object? reviewer = freezed,Object? approvalToken = freezed,Object? createdAt = null,Object? appliedAt = freezed,Object? error = freezed,}) {
  return _then(ChangeRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,runId: freezed == runId ? _self.runId : runId // ignore: cast_nullable_to_non_nullable
as String?,targetCollection: null == targetCollection ? _self.targetCollection : targetCollection // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,op: null == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as ChangeRequestOp,before: freezed == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,after: null == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,diff: null == diff ? _self.diff : diff // ignore: cast_nullable_to_non_nullable
as List<DiffEntry>,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,evidence: freezed == evidence ? _self.evidence : evidence // ignore: cast_nullable_to_non_nullable
as Evidence?,extractedBy: freezed == extractedBy ? _self.extractedBy : extractedBy // ignore: cast_nullable_to_non_nullable
as String?,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChangeRequestStatus,reviewer: freezed == reviewer ? _self.reviewer : reviewer // ignore: cast_nullable_to_non_nullable
as ReviewDecision?,approvalToken: freezed == approvalToken ? _self.approvalToken : approvalToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,appliedAt: freezed == appliedAt ? _self.appliedAt : appliedAt // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ChangeRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EvidenceCopyWith<$Res>? get evidence {
    if (_self.evidence == null) {
    return null;
  }

  return $EvidenceCopyWith<$Res>(_self.evidence!, (value) {
    return _then(_self.copyWith(evidence: value));
  });
}/// Create a copy of ChangeRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewDecisionCopyWith<$Res>? get reviewer {
    if (_self.reviewer == null) {
    return null;
  }

  return $ReviewDecisionCopyWith<$Res>(_self.reviewer!, (value) {
    return _then(_self.copyWith(reviewer: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChangeRequest].
extension ChangeRequestPatterns on ChangeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeRequest value)  $default,){
final _that = this;
switch (_that) {
case _ChangeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? runId,  String targetCollection,  String targetId,  ChangeRequestOp op,  Map<String, dynamic>? before,  Map<String, dynamic> after,  List<DiffEntry> diff,  String sourceId,  Evidence? evidence,  String? extractedBy,  double? confidence,  ChangeRequestStatus status,  ReviewDecision? reviewer,  String? approvalToken,  String createdAt,  String? appliedAt,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeRequest() when $default != null:
return $default(_that.id,_that.runId,_that.targetCollection,_that.targetId,_that.op,_that.before,_that.after,_that.diff,_that.sourceId,_that.evidence,_that.extractedBy,_that.confidence,_that.status,_that.reviewer,_that.approvalToken,_that.createdAt,_that.appliedAt,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? runId,  String targetCollection,  String targetId,  ChangeRequestOp op,  Map<String, dynamic>? before,  Map<String, dynamic> after,  List<DiffEntry> diff,  String sourceId,  Evidence? evidence,  String? extractedBy,  double? confidence,  ChangeRequestStatus status,  ReviewDecision? reviewer,  String? approvalToken,  String createdAt,  String? appliedAt,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ChangeRequest():
return $default(_that.id,_that.runId,_that.targetCollection,_that.targetId,_that.op,_that.before,_that.after,_that.diff,_that.sourceId,_that.evidence,_that.extractedBy,_that.confidence,_that.status,_that.reviewer,_that.approvalToken,_that.createdAt,_that.appliedAt,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? runId,  String targetCollection,  String targetId,  ChangeRequestOp op,  Map<String, dynamic>? before,  Map<String, dynamic> after,  List<DiffEntry> diff,  String sourceId,  Evidence? evidence,  String? extractedBy,  double? confidence,  ChangeRequestStatus status,  ReviewDecision? reviewer,  String? approvalToken,  String createdAt,  String? appliedAt,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ChangeRequest() when $default != null:
return $default(_that.id,_that.runId,_that.targetCollection,_that.targetId,_that.op,_that.before,_that.after,_that.diff,_that.sourceId,_that.evidence,_that.extractedBy,_that.confidence,_that.status,_that.reviewer,_that.approvalToken,_that.createdAt,_that.appliedAt,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChangeRequest implements ChangeRequest {
  const _ChangeRequest({required this.id, this.runId, required this.targetCollection, required this.targetId, required this.op,  Map<String, dynamic>? before, required  Map<String, dynamic> after,  List<DiffEntry> diff = const [], required this.sourceId, this.evidence, this.extractedBy, this.confidence, required this.status, this.reviewer, this.approvalToken, required this.createdAt, this.appliedAt, this.error}): _before = before,_after = after,_diff = diff;
  factory _ChangeRequest.fromJson(Map<String, dynamic> json) => _$ChangeRequestFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  String? runId;
@override final  String targetCollection;
@override final  String targetId;
@override final  ChangeRequestOp op;
 final  Map<String, dynamic>? _before;
@override Map<String, dynamic>? get before {
  final value = _before;
  if (value == null) return null;
  if (_before is EqualUnmodifiableMapView) return _before;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic> _after;
@override Map<String, dynamic> get after {
  if (_after is EqualUnmodifiableMapView) return _after;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_after);
}

 final  List<DiffEntry> _diff;
@override@JsonKey() List<DiffEntry> get diff {
  if (_diff is EqualUnmodifiableListView) return _diff;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_diff);
}

@override final  String sourceId;
@override final  Evidence? evidence;
/// model id or 'manual'
@override final  String? extractedBy;
@override final  double? confidence;
@override final  ChangeRequestStatus status;
@override final  ReviewDecision? reviewer;
/// HMAC token embedded in approve/reject links
@override final  String? approvalToken;
@override final  String createdAt;
@override final  String? appliedAt;
@override final  String? error;

/// Create a copy of ChangeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeRequestCopyWith<_ChangeRequest> get copyWith => __$ChangeRequestCopyWithImpl<_ChangeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChangeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.runId, runId) || other.runId == runId)&&(identical(other.targetCollection, targetCollection) || other.targetCollection == targetCollection)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.op, op) || other.op == op)&&const DeepCollectionEquality().equals(other.before, _before)&&const DeepCollectionEquality().equals(other.after, _after)&&const DeepCollectionEquality().equals(other.diff, _diff)&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.evidence, evidence) || other.evidence == evidence)&&(identical(other.extractedBy, extractedBy) || other.extractedBy == extractedBy)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.status, status) || other.status == status)&&(identical(other.reviewer, reviewer) || other.reviewer == reviewer)&&(identical(other.approvalToken, approvalToken) || other.approvalToken == approvalToken)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.appliedAt, appliedAt) || other.appliedAt == appliedAt)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,runId,targetCollection,targetId,op,const DeepCollectionEquality().hash(_before),const DeepCollectionEquality().hash(_after),const DeepCollectionEquality().hash(_diff),sourceId,evidence,extractedBy,confidence,status,reviewer,approvalToken,createdAt,appliedAt,error);
}

@override
String toString() {
    return 'ChangeRequest(id: $id, runId: $runId, targetCollection: $targetCollection, targetId: $targetId, op: $op, before: $before, after: $after, diff: $diff, sourceId: $sourceId, evidence: $evidence, extractedBy: $extractedBy, confidence: $confidence, status: $status, reviewer: $reviewer, approvalToken: $approvalToken, createdAt: $createdAt, appliedAt: $appliedAt, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ChangeRequestCopyWith<$Res> implements $ChangeRequestCopyWith<$Res> {
  factory _$ChangeRequestCopyWith(_ChangeRequest value, $Res Function(_ChangeRequest) _then) = __$ChangeRequestCopyWithImpl;
@override @useResult
$Res call({
 String id, String? runId, String targetCollection, String targetId, ChangeRequestOp op, Map<String, dynamic>? before, Map<String, dynamic> after, List<DiffEntry> diff, String sourceId, Evidence? evidence, String? extractedBy, double? confidence, ChangeRequestStatus status, ReviewDecision? reviewer, String? approvalToken, String createdAt, String? appliedAt, String? error
});


@override $EvidenceCopyWith<$Res>? get evidence;@override $ReviewDecisionCopyWith<$Res>? get reviewer;

}
/// @nodoc
class __$ChangeRequestCopyWithImpl<$Res>
    implements _$ChangeRequestCopyWith<$Res> {
  __$ChangeRequestCopyWithImpl(this._self, this._then);

  final _ChangeRequest _self;
  final $Res Function(_ChangeRequest) _then;

/// Create a copy of ChangeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? runId = freezed,Object? targetCollection = null,Object? targetId = null,Object? op = null,Object? before = freezed,Object? after = null,Object? diff = null,Object? sourceId = null,Object? evidence = freezed,Object? extractedBy = freezed,Object? confidence = freezed,Object? status = null,Object? reviewer = freezed,Object? approvalToken = freezed,Object? createdAt = null,Object? appliedAt = freezed,Object? error = freezed,}) {
  return _then(_ChangeRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,runId: freezed == runId ? _self.runId : runId // ignore: cast_nullable_to_non_nullable
as String?,targetCollection: null == targetCollection ? _self.targetCollection : targetCollection // ignore: cast_nullable_to_non_nullable
as String,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,op: null == op ? _self.op : op // ignore: cast_nullable_to_non_nullable
as ChangeRequestOp,before: freezed == before ? _self._before : before // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,after: null == after ? _self._after : after // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,diff: null == diff ? _self._diff : diff // ignore: cast_nullable_to_non_nullable
as List<DiffEntry>,sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,evidence: freezed == evidence ? _self.evidence : evidence // ignore: cast_nullable_to_non_nullable
as Evidence?,extractedBy: freezed == extractedBy ? _self.extractedBy : extractedBy // ignore: cast_nullable_to_non_nullable
as String?,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ChangeRequestStatus,reviewer: freezed == reviewer ? _self.reviewer : reviewer // ignore: cast_nullable_to_non_nullable
as ReviewDecision?,approvalToken: freezed == approvalToken ? _self.approvalToken : approvalToken // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,appliedAt: freezed == appliedAt ? _self.appliedAt : appliedAt // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ChangeRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EvidenceCopyWith<$Res>? get evidence {
    if (_self.evidence == null) {
    return null;
  }

  return $EvidenceCopyWith<$Res>(_self.evidence!, (value) {
    return _then(_self.copyWith(evidence: value));
  });
}/// Create a copy of ChangeRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewDecisionCopyWith<$Res>? get reviewer {
    if (_self.reviewer == null) {
    return null;
  }

  return $ReviewDecisionCopyWith<$Res>(_self.reviewer!, (value) {
    return _then(_self.copyWith(reviewer: value));
  });
}
}

// dart format on
