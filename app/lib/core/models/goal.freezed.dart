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
 String? get id; String? get title; String? get occupationId; String? get countryId; int? get targetYear; Money? get salaryTarget; int? get priority; List<String> get pathwayIds; String? get createdAt; String? get employer; String? get area; String? get city;/// Broad field, used for alternatives and copy
@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) GoalField? get field;/// What matters most, e.g. Salary, Stability
 List<String> get priorities;/// Open to alternatives, e.g. Other EU countries
 List<String> get alternatives;/// Willing to move abroad
 bool? get relocate; String? get why; String? get updatedAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Goal&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.occupationId, _this.occupationId) || other.occupationId == _this.occupationId)&&(identical(other.countryId, _this.countryId) || other.countryId == _this.countryId)&&(identical(other.targetYear, _this.targetYear) || other.targetYear == _this.targetYear)&&(identical(other.salaryTarget, _this.salaryTarget) || other.salaryTarget == _this.salaryTarget)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&const DeepCollectionEquality().equals(other.pathwayIds, _this.pathwayIds)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.employer, _this.employer) || other.employer == _this.employer)&&(identical(other.area, _this.area) || other.area == _this.area)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.field, _this.field) || other.field == _this.field)&&const DeepCollectionEquality().equals(other.priorities, _this.priorities)&&const DeepCollectionEquality().equals(other.alternatives, _this.alternatives)&&(identical(other.relocate, _this.relocate) || other.relocate == _this.relocate)&&(identical(other.why, _this.why) || other.why == _this.why)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Goal;
  return Object.hash(runtimeType,_this.id,_this.title,_this.occupationId,_this.countryId,_this.targetYear,_this.salaryTarget,_this.priority,const DeepCollectionEquality().hash(_this.pathwayIds),_this.createdAt,_this.employer,_this.area,_this.city,_this.field,const DeepCollectionEquality().hash(_this.priorities),const DeepCollectionEquality().hash(_this.alternatives),_this.relocate,_this.why,_this.updatedAt);
}

@override
String toString() {
  final _this = this as Goal;
  return 'Goal(id: ${_this.id}, title: ${_this.title}, occupationId: ${_this.occupationId}, countryId: ${_this.countryId}, targetYear: ${_this.targetYear}, salaryTarget: ${_this.salaryTarget}, priority: ${_this.priority}, pathwayIds: ${_this.pathwayIds}, createdAt: ${_this.createdAt}, employer: ${_this.employer}, area: ${_this.area}, city: ${_this.city}, field: ${_this.field}, priorities: ${_this.priorities}, alternatives: ${_this.alternatives}, relocate: ${_this.relocate}, why: ${_this.why}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $GoalCopyWith<$Res>  {
  factory $GoalCopyWith(Goal value, $Res Function(Goal) _then) = _$GoalCopyWithImpl;
@useResult
$Res call({
 String? id, String? title, String? occupationId, String? countryId, int? targetYear, Money? salaryTarget, int? priority, List<String> pathwayIds, String? createdAt, String? employer, String? area, String? city,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) GoalField? field, List<String> priorities, List<String> alternatives, bool? relocate, String? why, String? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? occupationId = freezed,Object? countryId = freezed,Object? targetYear = freezed,Object? salaryTarget = freezed,Object? priority = freezed,Object? pathwayIds = null,Object? createdAt = freezed,Object? employer = freezed,Object? area = freezed,Object? city = freezed,Object? field = freezed,Object? priorities = null,Object? alternatives = null,Object? relocate = freezed,Object? why = freezed,Object? updatedAt = freezed,}) {
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
as String?,employer: freezed == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as GoalField?,priorities: null == priorities ? _self.priorities : priorities // ignore: cast_nullable_to_non_nullable
as List<String>,alternatives: null == alternatives ? _self.alternatives : alternatives // ignore: cast_nullable_to_non_nullable
as List<String>,relocate: freezed == relocate ? _self.relocate : relocate // ignore: cast_nullable_to_non_nullable
as bool?,why: freezed == why ? _self.why : why // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? title,  String? occupationId,  String? countryId,  int? targetYear,  Money? salaryTarget,  int? priority,  List<String> pathwayIds,  String? createdAt,  String? employer,  String? area,  String? city, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  GoalField? field,  List<String> priorities,  List<String> alternatives,  bool? relocate,  String? why,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.title,_that.occupationId,_that.countryId,_that.targetYear,_that.salaryTarget,_that.priority,_that.pathwayIds,_that.createdAt,_that.employer,_that.area,_that.city,_that.field,_that.priorities,_that.alternatives,_that.relocate,_that.why,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? title,  String? occupationId,  String? countryId,  int? targetYear,  Money? salaryTarget,  int? priority,  List<String> pathwayIds,  String? createdAt,  String? employer,  String? area,  String? city, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  GoalField? field,  List<String> priorities,  List<String> alternatives,  bool? relocate,  String? why,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Goal():
return $default(_that.id,_that.title,_that.occupationId,_that.countryId,_that.targetYear,_that.salaryTarget,_that.priority,_that.pathwayIds,_that.createdAt,_that.employer,_that.area,_that.city,_that.field,_that.priorities,_that.alternatives,_that.relocate,_that.why,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? title,  String? occupationId,  String? countryId,  int? targetYear,  Money? salaryTarget,  int? priority,  List<String> pathwayIds,  String? createdAt,  String? employer,  String? area,  String? city, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  GoalField? field,  List<String> priorities,  List<String> alternatives,  bool? relocate,  String? why,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Goal() when $default != null:
return $default(_that.id,_that.title,_that.occupationId,_that.countryId,_that.targetYear,_that.salaryTarget,_that.priority,_that.pathwayIds,_that.createdAt,_that.employer,_that.area,_that.city,_that.field,_that.priorities,_that.alternatives,_that.relocate,_that.why,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Goal implements Goal {
  const _Goal({this.id, this.title, this.occupationId, this.countryId, this.targetYear, this.salaryTarget, this.priority,  List<String> pathwayIds = const [], this.createdAt, this.employer, this.area, this.city, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.field,  List<String> priorities = const [],  List<String> alternatives = const [], this.relocate, this.why, this.updatedAt}): _pathwayIds = pathwayIds,_priorities = priorities,_alternatives = alternatives;
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
@override final  String? employer;
@override final  String? area;
@override final  String? city;
/// Broad field, used for alternatives and copy
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  GoalField? field;
/// What matters most, e.g. Salary, Stability
 final  List<String> _priorities;
/// What matters most, e.g. Salary, Stability
@override@JsonKey() List<String> get priorities {
  if (_priorities is EqualUnmodifiableListView) return _priorities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_priorities);
}

/// Open to alternatives, e.g. Other EU countries
 final  List<String> _alternatives;
/// Open to alternatives, e.g. Other EU countries
@override@JsonKey() List<String> get alternatives {
  if (_alternatives is EqualUnmodifiableListView) return _alternatives;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_alternatives);
}

/// Willing to move abroad
@override final  bool? relocate;
@override final  String? why;
@override final  String? updatedAt;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Goal&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.occupationId, occupationId) || other.occupationId == occupationId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.targetYear, targetYear) || other.targetYear == targetYear)&&(identical(other.salaryTarget, salaryTarget) || other.salaryTarget == salaryTarget)&&(identical(other.priority, priority) || other.priority == priority)&&const DeepCollectionEquality().equals(other.pathwayIds, _pathwayIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.employer, employer) || other.employer == employer)&&(identical(other.area, area) || other.area == area)&&(identical(other.city, city) || other.city == city)&&(identical(other.field, field) || other.field == field)&&const DeepCollectionEquality().equals(other.priorities, _priorities)&&const DeepCollectionEquality().equals(other.alternatives, _alternatives)&&(identical(other.relocate, relocate) || other.relocate == relocate)&&(identical(other.why, why) || other.why == why)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,occupationId,countryId,targetYear,salaryTarget,priority,const DeepCollectionEquality().hash(_pathwayIds),createdAt,employer,area,city,field,const DeepCollectionEquality().hash(_priorities),const DeepCollectionEquality().hash(_alternatives),relocate,why,updatedAt);
}

@override
String toString() {
    return 'Goal(id: $id, title: $title, occupationId: $occupationId, countryId: $countryId, targetYear: $targetYear, salaryTarget: $salaryTarget, priority: $priority, pathwayIds: $pathwayIds, createdAt: $createdAt, employer: $employer, area: $area, city: $city, field: $field, priorities: $priorities, alternatives: $alternatives, relocate: $relocate, why: $why, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$GoalCopyWith<$Res> implements $GoalCopyWith<$Res> {
  factory _$GoalCopyWith(_Goal value, $Res Function(_Goal) _then) = __$GoalCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? title, String? occupationId, String? countryId, int? targetYear, Money? salaryTarget, int? priority, List<String> pathwayIds, String? createdAt, String? employer, String? area, String? city,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) GoalField? field, List<String> priorities, List<String> alternatives, bool? relocate, String? why, String? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? occupationId = freezed,Object? countryId = freezed,Object? targetYear = freezed,Object? salaryTarget = freezed,Object? priority = freezed,Object? pathwayIds = null,Object? createdAt = freezed,Object? employer = freezed,Object? area = freezed,Object? city = freezed,Object? field = freezed,Object? priorities = null,Object? alternatives = null,Object? relocate = freezed,Object? why = freezed,Object? updatedAt = freezed,}) {
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
as String?,employer: freezed == employer ? _self.employer : employer // ignore: cast_nullable_to_non_nullable
as String?,area: freezed == area ? _self.area : area // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as GoalField?,priorities: null == priorities ? _self._priorities : priorities // ignore: cast_nullable_to_non_nullable
as List<String>,alternatives: null == alternatives ? _self._alternatives : alternatives // ignore: cast_nullable_to_non_nullable
as List<String>,relocate: freezed == relocate ? _self.relocate : relocate // ignore: cast_nullable_to_non_nullable
as bool?,why: freezed == why ? _self.why : why // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
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
