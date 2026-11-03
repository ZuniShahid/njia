// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_run.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefreshRun {

/// Firestore document id.
 String get id; String? get startedAt; String? get finishedAt; int? get sourcesChecked; int? get sourcesChanged; int? get sourcesFailed; List<String> get changeRequestIds;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) RefreshRunStatus? get status; String? get notifiedAt;
/// Create a copy of RefreshRun
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefreshRunCopyWith<RefreshRun> get copyWith => _$RefreshRunCopyWithImpl<RefreshRun>(this as RefreshRun, _$identity);

  /// Serializes this RefreshRun to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RefreshRun;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefreshRun&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.finishedAt, _this.finishedAt) || other.finishedAt == _this.finishedAt)&&(identical(other.sourcesChecked, _this.sourcesChecked) || other.sourcesChecked == _this.sourcesChecked)&&(identical(other.sourcesChanged, _this.sourcesChanged) || other.sourcesChanged == _this.sourcesChanged)&&(identical(other.sourcesFailed, _this.sourcesFailed) || other.sourcesFailed == _this.sourcesFailed)&&const DeepCollectionEquality().equals(other.changeRequestIds, _this.changeRequestIds)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.notifiedAt, _this.notifiedAt) || other.notifiedAt == _this.notifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RefreshRun;
  return Object.hash(runtimeType,_this.id,_this.startedAt,_this.finishedAt,_this.sourcesChecked,_this.sourcesChanged,_this.sourcesFailed,const DeepCollectionEquality().hash(_this.changeRequestIds),_this.status,_this.notifiedAt);
}

@override
String toString() {
  final _this = this as RefreshRun;
  return 'RefreshRun(id: ${_this.id}, startedAt: ${_this.startedAt}, finishedAt: ${_this.finishedAt}, sourcesChecked: ${_this.sourcesChecked}, sourcesChanged: ${_this.sourcesChanged}, sourcesFailed: ${_this.sourcesFailed}, changeRequestIds: ${_this.changeRequestIds}, status: ${_this.status}, notifiedAt: ${_this.notifiedAt})';
}


}

/// @nodoc
abstract mixin class $RefreshRunCopyWith<$Res>  {
  factory $RefreshRunCopyWith(RefreshRun value, $Res Function(RefreshRun) _then) = _$RefreshRunCopyWithImpl;
@useResult
$Res call({
 String id, String? startedAt, String? finishedAt, int? sourcesChecked, int? sourcesChanged, int? sourcesFailed, List<String> changeRequestIds,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) RefreshRunStatus? status, String? notifiedAt
});




}
/// @nodoc
class _$RefreshRunCopyWithImpl<$Res>
    implements $RefreshRunCopyWith<$Res> {
  _$RefreshRunCopyWithImpl(this._self, this._then);

  final RefreshRun _self;
  final $Res Function(RefreshRun) _then;

/// Create a copy of RefreshRun
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = freezed,Object? finishedAt = freezed,Object? sourcesChecked = freezed,Object? sourcesChanged = freezed,Object? sourcesFailed = freezed,Object? changeRequestIds = null,Object? status = freezed,Object? notifiedAt = freezed,}) {
  return _then(RefreshRun(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String?,sourcesChecked: freezed == sourcesChecked ? _self.sourcesChecked : sourcesChecked // ignore: cast_nullable_to_non_nullable
as int?,sourcesChanged: freezed == sourcesChanged ? _self.sourcesChanged : sourcesChanged // ignore: cast_nullable_to_non_nullable
as int?,sourcesFailed: freezed == sourcesFailed ? _self.sourcesFailed : sourcesFailed // ignore: cast_nullable_to_non_nullable
as int?,changeRequestIds: null == changeRequestIds ? _self.changeRequestIds : changeRequestIds // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RefreshRunStatus?,notifiedAt: freezed == notifiedAt ? _self.notifiedAt : notifiedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RefreshRun].
extension RefreshRunPatterns on RefreshRun {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefreshRun value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefreshRun() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefreshRun value)  $default,){
final _that = this;
switch (_that) {
case _RefreshRun():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefreshRun value)?  $default,){
final _that = this;
switch (_that) {
case _RefreshRun() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? startedAt,  String? finishedAt,  int? sourcesChecked,  int? sourcesChanged,  int? sourcesFailed,  List<String> changeRequestIds, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  RefreshRunStatus? status,  String? notifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefreshRun() when $default != null:
return $default(_that.id,_that.startedAt,_that.finishedAt,_that.sourcesChecked,_that.sourcesChanged,_that.sourcesFailed,_that.changeRequestIds,_that.status,_that.notifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? startedAt,  String? finishedAt,  int? sourcesChecked,  int? sourcesChanged,  int? sourcesFailed,  List<String> changeRequestIds, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  RefreshRunStatus? status,  String? notifiedAt)  $default,) {final _that = this;
switch (_that) {
case _RefreshRun():
return $default(_that.id,_that.startedAt,_that.finishedAt,_that.sourcesChecked,_that.sourcesChanged,_that.sourcesFailed,_that.changeRequestIds,_that.status,_that.notifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? startedAt,  String? finishedAt,  int? sourcesChecked,  int? sourcesChanged,  int? sourcesFailed,  List<String> changeRequestIds, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  RefreshRunStatus? status,  String? notifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _RefreshRun() when $default != null:
return $default(_that.id,_that.startedAt,_that.finishedAt,_that.sourcesChecked,_that.sourcesChanged,_that.sourcesFailed,_that.changeRequestIds,_that.status,_that.notifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefreshRun implements RefreshRun {
  const _RefreshRun({required this.id, this.startedAt, this.finishedAt, this.sourcesChecked, this.sourcesChanged, this.sourcesFailed,  List<String> changeRequestIds = const [], @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status, this.notifiedAt}): _changeRequestIds = changeRequestIds;
  factory _RefreshRun.fromJson(Map<String, dynamic> json) => _$RefreshRunFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  String? startedAt;
@override final  String? finishedAt;
@override final  int? sourcesChecked;
@override final  int? sourcesChanged;
@override final  int? sourcesFailed;
 final  List<String> _changeRequestIds;
@override@JsonKey() List<String> get changeRequestIds {
  if (_changeRequestIds is EqualUnmodifiableListView) return _changeRequestIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_changeRequestIds);
}

@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  RefreshRunStatus? status;
@override final  String? notifiedAt;

/// Create a copy of RefreshRun
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefreshRunCopyWith<_RefreshRun> get copyWith => __$RefreshRunCopyWithImpl<_RefreshRun>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefreshRunToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefreshRun&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.sourcesChecked, sourcesChecked) || other.sourcesChecked == sourcesChecked)&&(identical(other.sourcesChanged, sourcesChanged) || other.sourcesChanged == sourcesChanged)&&(identical(other.sourcesFailed, sourcesFailed) || other.sourcesFailed == sourcesFailed)&&const DeepCollectionEquality().equals(other.changeRequestIds, _changeRequestIds)&&(identical(other.status, status) || other.status == status)&&(identical(other.notifiedAt, notifiedAt) || other.notifiedAt == notifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startedAt,finishedAt,sourcesChecked,sourcesChanged,sourcesFailed,const DeepCollectionEquality().hash(_changeRequestIds),status,notifiedAt);
}

@override
String toString() {
    return 'RefreshRun(id: $id, startedAt: $startedAt, finishedAt: $finishedAt, sourcesChecked: $sourcesChecked, sourcesChanged: $sourcesChanged, sourcesFailed: $sourcesFailed, changeRequestIds: $changeRequestIds, status: $status, notifiedAt: $notifiedAt)';
}


}

/// @nodoc
abstract mixin class _$RefreshRunCopyWith<$Res> implements $RefreshRunCopyWith<$Res> {
  factory _$RefreshRunCopyWith(_RefreshRun value, $Res Function(_RefreshRun) _then) = __$RefreshRunCopyWithImpl;
@override @useResult
$Res call({
 String id, String? startedAt, String? finishedAt, int? sourcesChecked, int? sourcesChanged, int? sourcesFailed, List<String> changeRequestIds,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) RefreshRunStatus? status, String? notifiedAt
});




}
/// @nodoc
class __$RefreshRunCopyWithImpl<$Res>
    implements _$RefreshRunCopyWith<$Res> {
  __$RefreshRunCopyWithImpl(this._self, this._then);

  final _RefreshRun _self;
  final $Res Function(_RefreshRun) _then;

/// Create a copy of RefreshRun
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = freezed,Object? finishedAt = freezed,Object? sourcesChecked = freezed,Object? sourcesChanged = freezed,Object? sourcesFailed = freezed,Object? changeRequestIds = null,Object? status = freezed,Object? notifiedAt = freezed,}) {
  return _then(_RefreshRun(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String?,sourcesChecked: freezed == sourcesChecked ? _self.sourcesChecked : sourcesChecked // ignore: cast_nullable_to_non_nullable
as int?,sourcesChanged: freezed == sourcesChanged ? _self.sourcesChanged : sourcesChanged // ignore: cast_nullable_to_non_nullable
as int?,sourcesFailed: freezed == sourcesFailed ? _self.sourcesFailed : sourcesFailed // ignore: cast_nullable_to_non_nullable
as int?,changeRequestIds: null == changeRequestIds ? _self._changeRequestIds : changeRequestIds // ignore: cast_nullable_to_non_nullable
as List<String>,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as RefreshRunStatus?,notifiedAt: freezed == notifiedAt ? _self.notifiedAt : notifiedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
