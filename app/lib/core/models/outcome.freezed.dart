// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outcome.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Outcome {

/// Firestore document id (null before the doc is created).
 String? get id; String? get goalId; String? get pathwayId;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) OutcomeKind? get kind;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) OutcomeResult? get result; String? get date;
/// Create a copy of Outcome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutcomeCopyWith<Outcome> get copyWith => _$OutcomeCopyWithImpl<Outcome>(this as Outcome, _$identity);

  /// Serializes this Outcome to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Outcome;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Outcome&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.goalId, _this.goalId) || other.goalId == _this.goalId)&&(identical(other.pathwayId, _this.pathwayId) || other.pathwayId == _this.pathwayId)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.result, _this.result) || other.result == _this.result)&&(identical(other.date, _this.date) || other.date == _this.date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Outcome;
  return Object.hash(runtimeType,_this.id,_this.goalId,_this.pathwayId,_this.kind,_this.result,_this.date);
}

@override
String toString() {
  final _this = this as Outcome;
  return 'Outcome(id: ${_this.id}, goalId: ${_this.goalId}, pathwayId: ${_this.pathwayId}, kind: ${_this.kind}, result: ${_this.result}, date: ${_this.date})';
}


}

/// @nodoc
abstract mixin class $OutcomeCopyWith<$Res>  {
  factory $OutcomeCopyWith(Outcome value, $Res Function(Outcome) _then) = _$OutcomeCopyWithImpl;
@useResult
$Res call({
 String? id, String? goalId, String? pathwayId,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) OutcomeKind? kind,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) OutcomeResult? result, String? date
});




}
/// @nodoc
class _$OutcomeCopyWithImpl<$Res>
    implements $OutcomeCopyWith<$Res> {
  _$OutcomeCopyWithImpl(this._self, this._then);

  final Outcome _self;
  final $Res Function(Outcome) _then;

/// Create a copy of Outcome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? goalId = freezed,Object? pathwayId = freezed,Object? kind = freezed,Object? result = freezed,Object? date = freezed,}) {
  return _then(Outcome(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,pathwayId: freezed == pathwayId ? _self.pathwayId : pathwayId // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OutcomeKind?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as OutcomeResult?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Outcome].
extension OutcomePatterns on Outcome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Outcome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Outcome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Outcome value)  $default,){
final _that = this;
switch (_that) {
case _Outcome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Outcome value)?  $default,){
final _that = this;
switch (_that) {
case _Outcome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? goalId,  String? pathwayId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  OutcomeKind? kind, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  OutcomeResult? result,  String? date)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Outcome() when $default != null:
return $default(_that.id,_that.goalId,_that.pathwayId,_that.kind,_that.result,_that.date);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? goalId,  String? pathwayId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  OutcomeKind? kind, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  OutcomeResult? result,  String? date)  $default,) {final _that = this;
switch (_that) {
case _Outcome():
return $default(_that.id,_that.goalId,_that.pathwayId,_that.kind,_that.result,_that.date);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? goalId,  String? pathwayId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  OutcomeKind? kind, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  OutcomeResult? result,  String? date)?  $default,) {final _that = this;
switch (_that) {
case _Outcome() when $default != null:
return $default(_that.id,_that.goalId,_that.pathwayId,_that.kind,_that.result,_that.date);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Outcome implements Outcome {
  const _Outcome({this.id, this.goalId, this.pathwayId, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.kind, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.result, this.date});
  factory _Outcome.fromJson(Map<String, dynamic> json) => _$OutcomeFromJson(json);

/// Firestore document id (null before the doc is created).
@override final  String? id;
@override final  String? goalId;
@override final  String? pathwayId;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  OutcomeKind? kind;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  OutcomeResult? result;
@override final  String? date;

/// Create a copy of Outcome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OutcomeCopyWith<_Outcome> get copyWith => __$OutcomeCopyWithImpl<_Outcome>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutcomeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Outcome&&(identical(other.id, id) || other.id == id)&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.pathwayId, pathwayId) || other.pathwayId == pathwayId)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.result, result) || other.result == result)&&(identical(other.date, date) || other.date == date));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,goalId,pathwayId,kind,result,date);
}

@override
String toString() {
    return 'Outcome(id: $id, goalId: $goalId, pathwayId: $pathwayId, kind: $kind, result: $result, date: $date)';
}


}

/// @nodoc
abstract mixin class _$OutcomeCopyWith<$Res> implements $OutcomeCopyWith<$Res> {
  factory _$OutcomeCopyWith(_Outcome value, $Res Function(_Outcome) _then) = __$OutcomeCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? goalId, String? pathwayId,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) OutcomeKind? kind,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) OutcomeResult? result, String? date
});




}
/// @nodoc
class __$OutcomeCopyWithImpl<$Res>
    implements _$OutcomeCopyWith<$Res> {
  __$OutcomeCopyWithImpl(this._self, this._then);

  final _Outcome _self;
  final $Res Function(_Outcome) _then;

/// Create a copy of Outcome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? goalId = freezed,Object? pathwayId = freezed,Object? kind = freezed,Object? result = freezed,Object? date = freezed,}) {
  return _then(_Outcome(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,pathwayId: freezed == pathwayId ? _self.pathwayId : pathwayId // ignore: cast_nullable_to_non_nullable
as String?,kind: freezed == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as OutcomeKind?,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as OutcomeResult?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
