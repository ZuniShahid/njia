// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Goal {

/// Firestore document id (null before the doc is created).
 String? get id; String? get title; String? get occupationId; String? get countryId; int? get targetYear; Money? get salaryTarget; int? get priority; List<String> get pathwayIds; String? get createdAt;
/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoalCopyWith<Goal> get copyWith => _$GoalCopyWithImpl<Goal>(this as Goal, _$identity);

  /// Serializes this Goal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Goal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Goal&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.occupationId, _this.occupationId) || other.occupationId == _this.occupationId)&&(identical(other.countryId, _this.countryId) || other.countryId == _this.countryId)&&(identical(other.targetYear, _this.targetYear) || other.targetYear == _this.targetYear)&&(identical(other.salaryTarget, _this.salaryTarget) || other.salaryTarget == _this.salaryTarget)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&const DeepCollectionEquality().equals(other.pathwayIds, _this.pathwayIds)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Goal;
  return Object.hash(runtimeType,_this.id,_this.title,_this.occupationId,_this.countryId,_this.targetYear,_this.salaryTarget,_this.priority,const DeepCollectionEquality().hash(_this.pathwayIds),_this.createdAt);
}

@override
String toString() {
  final _this = this as Goal;
  return 'Goal(id: ${_this.id}, title: ${_this.title}, occupationId: ${_this.occupationId}, countryId: ${_this.countryId}, targetYear: ${_this.targetYear}, salaryTarget: ${_this.salaryTarget}, priority: ${_this.priority}, pathwayIds: ${_this.pathwayIds}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $GoalCopyWith<$Res>  {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) _then) = _$GoalCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, String? occupationId, String? countryId, int? targetYear, Money? salaryTarget, int? priority, List<String> pathwayIds, String? createdAt
});


$MoneyCopyWith<$Res>? get salaryTarget;

}
/// @nodoc
class _$GoalCopyWithImpl<$Res>
    implements $GoalCopyWith<$Res> {
  _$GoalCopyWithImpl(this._self, this._then);

  final Goal _self;
  final $Res Function(Goal) _then;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? occupationId = freezed,Object? countryId = freezed,Object? targetYear = freezed,Object? salaryTarget = freezed,Object? priority = freezed,Object? pathwayIds = null,Object? createdAt = freezed,}) {
  return _then(Goal(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,targetYear: freezed == targetYear ? _self.targetYear : targetYear // ignore: cast_nullable_to_non_nullable
as int?,salaryTarget: freezed == salaryTarget ? _self.salaryTarget : salaryTarget // ignore: cast_nullable_to_non_nullable
as Money?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,pathwayIds: null == pathwayIds ? _self.pathwayIds : pathwayIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get salaryTarget {
    if (_self.salaryTarget == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.salaryTarget!, (value) {
    return _then(_self.copyWith(salaryTarget: value));
  });
}
}


/// Adds pattern-matching-related methods to [Goal].
extension GoalPatterns on Goal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Goal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Goal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Goal value)  $default,){
final _that = this;
switch (_that) {
case _Goal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Goal value)?  $default,){
final _that = this;
switch (_that) {
case _Goal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  String? occupationId,  String? countryId,  int? targetYear,  Money? salaryTarget,  int? priority,  List<String> pathwayIds,  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.title,_that.occupationId,_that.countryId,_that.targetYear,_that.salaryTarget,_that.priority,_that.pathwayIds,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  String? occupationId,  String? countryId,  int? targetYear,  Money? salaryTarget,  int? priority,  List<String> pathwayIds,  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Goal():
return $default(_that.id,_that.title,_that.occupationId,_that.countryId,_that.targetYear,_that.salaryTarget,_that.priority,_that.pathwayIds,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  String? occupationId,  String? countryId,  int? targetYear,  Money? salaryTarget,  int? priority,  List<String> pathwayIds,  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.title,_that.occupationId,_that.countryId,_that.targetYear,_that.salaryTarget,_that.priority,_that.pathwayIds,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Goal implements Goal {
  const _Goal({this.id, this.title, this.occupationId, this.countryId, this.targetYear, this.salaryTarget, this.priority,  List<String> pathwayIds = const [], this.createdAt}): _pathwayIds = pathwayIds;
  factory _Goal.fromJson(Map<String, dynamic> json) => _$GoalFromJson(json);

/// Firestore document id (null before the doc is created).
@override final  String? id;
@override final  String? title;
@override final  String? occupationId;
@override final  String? countryId;
@override final  int? targetYear;
@override final  Money? salaryTarget;
@override final  int? priority;
 final  List<String> _pathwayIds;
@override@JsonKey() List<String> get pathwayIds {
  if (_pathwayIds is EqualUnmodifiableListView) return _pathwayIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pathwayIds);
}

@override final  String? createdAt;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoalCopyWith<_Goal> get copyWith => __$GoalCopyWithImpl<_Goal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoalToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Goal&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.targetYear, targetYear) || other.targetYear == targetYear)&&(identical(other.salaryTarget, salaryTarget) || other.salaryTarget == salaryTarget)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other.pathwayIds, _pathwayIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,occupationId,countryId,targetYear,salaryTarget,priority,const DeepCollectionEquality().hash(_pathwayIds),createdAt);
}

@override
String toString() {
    return 'Goal(id: $id, title: $title, occupationId: $occupationId, countryId: $countryId, targetYear: $targetYear, salaryTarget: $salaryTarget, priority: $priority, pathwayIds: $pathwayIds, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) _then) = __$GoalCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, String? occupationId, String? countryId, int? targetYear, Money? salaryTarget, int? priority, List<String> pathwayIds, String? createdAt
});


@override $MoneyCopyWith<$Res>? get salaryTarget;

}
/// @nodoc
class __$GoalCopyWithImpl<$Res>
    implements _$GoalCopyWith<$Res> {
  __$GoalCopyWithImpl(this._self, this._then);

  final _Goal _self;
  final $Res Function(_Goal) _then;

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? occupationId = freezed,Object? countryId = freezed,Object? targetYear = freezed,Object? salaryTarget = freezed,Object? priority = freezed,Object? pathwayIds = null,Object? createdAt = freezed,}) {
  return _then(_Goal(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,occupationId: freezed == occupationId ? _self.occupationId : occupationId // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,targetYear: freezed == targetYear ? _self.targetYear : targetYear // ignore: cast_nullable_to_non_nullable
as int?,salaryTarget: freezed == salaryTarget ? _self.salaryTarget : salaryTarget // ignore: cast_nullable_to_non_nullable
as Money?,priority: freezed == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as int?,pathwayIds: null == pathwayIds ? _self._pathwayIds : pathwayIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Goal
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get salaryTarget {
    if (_self.salaryTarget == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.salaryTarget!, (value) {
    return _then(_self.copyWith(salaryTarget: value));
  });
}
}

// dart format on
