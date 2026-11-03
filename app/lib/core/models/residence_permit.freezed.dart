// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'residence_permit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProcessingWeeks {

 int? get min; int? get max;
/// Create a copy of ProcessingWeeks
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProcessingWeeksCopyWith<ProcessingWeeks> get copyWith => _$ProcessingWeeksCopyWithImpl<ProcessingWeeks>(this as ProcessingWeeks, _$identity);

  /// Serializes this ProcessingWeeks to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProcessingWeeks;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProcessingWeeks&&(identical(other.min, _this.min) || other.min == _this.min)&&(identical(other.max, _this.max) || other.max == _this.max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProcessingWeeks;
  return Object.hash(runtimeType,_this.min,_this.max);
}

@override
String toString() {
  final _this = this as ProcessingWeeks;
  return 'ProcessingWeeks(min: ${_this.min}, max: ${_this.max})';
}


}

/// @nodoc
abstract mixin class $ProcessingWeeksCopyWith<$Res>  {
  factory $ProcessingWeeksCopyWith(ProcessingWeeks value, $Res Function(ProcessingWeeks) _then) = _$ProcessingWeeksCopyWithImpl;
@useResult
$Res call({
 int? min, int? max
});




}
/// @nodoc
class _$ProcessingWeeksCopyWithImpl<$Res>
    implements $ProcessingWeeksCopyWith<$Res> {
  _$ProcessingWeeksCopyWithImpl(this._self, this._then);

  final ProcessingWeeks _self;
  final $Res Function(ProcessingWeeks) _then;

/// Create a copy of ProcessingWeeks
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = freezed,Object? max = freezed,}) {
  return _then(ProcessingWeeks(
min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProcessingWeeks].
extension ProcessingWeeksPatterns on ProcessingWeeks {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProcessingWeeks value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProcessingWeeks() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProcessingWeeks value)  $default,){
final _that = this;
switch (_that) {
case _ProcessingWeeks():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProcessingWeeks value)?  $default,){
final _that = this;
switch (_that) {
case _ProcessingWeeks() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? min,  int? max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProcessingWeeks() when $default != null:
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? min,  int? max)  $default,) {final _that = this;
switch (_that) {
case _ProcessingWeeks():
return $default(_that.min,_that.max);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? min,  int? max)?  $default,) {final _that = this;
switch (_that) {
case _ProcessingWeeks() when $default != null:
return $default(_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProcessingWeeks implements ProcessingWeeks {
  const _ProcessingWeeks({this.min, this.max});
  factory _ProcessingWeeks.fromJson(Map<String, dynamic> json) => _$ProcessingWeeksFromJson(json);

@override final  int? min;
@override final  int? max;

/// Create a copy of ProcessingWeeks
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProcessingWeeksCopyWith<_ProcessingWeeks> get copyWith => __$ProcessingWeeksCopyWithImpl<_ProcessingWeeks>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProcessingWeeksToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProcessingWeeks&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,min,max);
}

@override
String toString() {
    return 'ProcessingWeeks(min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$ProcessingWeeksCopyWith<$Res> implements $ProcessingWeeksCopyWith<$Res> {
  factory _$ProcessingWeeksCopyWith(_ProcessingWeeks value, $Res Function(_ProcessingWeeks) _then) = __$ProcessingWeeksCopyWithImpl;
@override @useResult
$Res call({
 int? min, int? max
});




}
/// @nodoc
class __$ProcessingWeeksCopyWithImpl<$Res>
    implements _$ProcessingWeeksCopyWith<$Res> {
  __$ProcessingWeeksCopyWithImpl(this._self, this._then);

  final _ProcessingWeeks _self;
  final $Res Function(_ProcessingWeeks) _then;

/// Create a copy of ProcessingWeeks
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = freezed,Object? max = freezed,}) {
  return _then(_ProcessingWeeks(
min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$WorkRights {

 bool? get allowed; String? get limit;
/// Create a copy of WorkRights
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkRightsCopyWith<WorkRights> get copyWith => _$WorkRightsCopyWithImpl<WorkRights>(this as WorkRights, _$identity);

  /// Serializes this WorkRights to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WorkRights;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkRights&&(identical(other.allowed, _this.allowed) || other.allowed == _this.allowed)&&(identical(other.limit, _this.limit) || other.limit == _this.limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WorkRights;
  return Object.hash(runtimeType,_this.allowed,_this.limit);
}

@override
String toString() {
  final _this = this as WorkRights;
  return 'WorkRights(allowed: ${_this.allowed}, limit: ${_this.limit})';
}


}

/// @nodoc
abstract mixin class $WorkRightsCopyWith<$Res>  {
  factory $WorkRightsCopyWith(WorkRights value, $Res Function(WorkRights) _then) = _$WorkRightsCopyWithImpl;
@useResult
$Res call({
 bool? allowed, String? limit
});




}
/// @nodoc
class _$WorkRightsCopyWithImpl<$Res>
    implements $WorkRightsCopyWith<$Res> {
  _$WorkRightsCopyWithImpl(this._self, this._then);

  final WorkRights _self;
  final $Res Function(WorkRights) _then;

/// Create a copy of WorkRights
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowed = freezed,Object? limit = freezed,}) {
  return _then(WorkRights(
allowed: freezed == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkRights].
extension WorkRightsPatterns on WorkRights {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkRights value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkRights() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkRights value)  $default,){
final _that = this;
switch (_that) {
case _WorkRights():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkRights value)?  $default,){
final _that = this;
switch (_that) {
case _WorkRights() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? allowed,  String? limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkRights() when $default != null:
return $default(_that.allowed,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? allowed,  String? limit)  $default,) {final _that = this;
switch (_that) {
case _WorkRights():
return $default(_that.allowed,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? allowed,  String? limit)?  $default,) {final _that = this;
switch (_that) {
case _WorkRights() when $default != null:
return $default(_that.allowed,_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkRights implements WorkRights {
  const _WorkRights({this.allowed, this.limit});
  factory _WorkRights.fromJson(Map<String, dynamic> json) => _$WorkRightsFromJson(json);

@override final  bool? allowed;
@override final  String? limit;

/// Create a copy of WorkRights
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkRightsCopyWith<_WorkRights> get copyWith => __$WorkRightsCopyWithImpl<_WorkRights>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkRightsToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkRights&&(identical(other.allowed, allowed) || other.allowed == allowed)&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,allowed,limit);
}

@override
String toString() {
    return 'WorkRights(allowed: $allowed, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$WorkRightsCopyWith<$Res> implements $WorkRightsCopyWith<$Res> {
  factory _$WorkRightsCopyWith(_WorkRights value, $Res Function(_WorkRights) _then) = __$WorkRightsCopyWithImpl;
@override @useResult
$Res call({
 bool? allowed, String? limit
});




}
/// @nodoc
class __$WorkRightsCopyWithImpl<$Res>
    implements _$WorkRightsCopyWith<$Res> {
  __$WorkRightsCopyWithImpl(this._self, this._then);

  final _WorkRights _self;
  final $Res Function(_WorkRights) _then;

/// Create a copy of WorkRights
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowed = freezed,Object? limit = freezed,}) {
  return _then(_WorkRights(
allowed: freezed == allowed ? _self.allowed : allowed // ignore: cast_nullable_to_non_nullable
as bool?,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PermitChecklistItem {

 String? get id; String? get label; String? get docType;
/// Create a copy of PermitChecklistItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermitChecklistItemCopyWith<PermitChecklistItem> get copyWith => _$PermitChecklistItemCopyWithImpl<PermitChecklistItem>(this as PermitChecklistItem, _$identity);

  /// Serializes this PermitChecklistItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PermitChecklistItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermitChecklistItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.docType, _this.docType) || other.docType == _this.docType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PermitChecklistItem;
  return Object.hash(runtimeType,_this.id,_this.label,_this.docType);
}

@override
String toString() {
  final _this = this as PermitChecklistItem;
  return 'PermitChecklistItem(id: ${_this.id}, label: ${_this.label}, docType: ${_this.docType})';
}


}

/// @nodoc
abstract mixin class $PermitChecklistItemCopyWith<$Res>  {
  factory $PermitChecklistItemCopyWith(PermitChecklistItem value, $Res Function(PermitChecklistItem) _then) = _$PermitChecklistItemCopyWithImpl;
@useResult
$Res call({
 String? id, String? label, String? docType
});




}
/// @nodoc
class _$PermitChecklistItemCopyWithImpl<$Res>
    implements $PermitChecklistItemCopyWith<$Res> {
  _$PermitChecklistItemCopyWithImpl(this._self, this._then);

  final PermitChecklistItem _self;
  final $Res Function(PermitChecklistItem) _then;

/// Create a copy of PermitChecklistItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? label = freezed,Object? docType = freezed,}) {
  return _then(PermitChecklistItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,docType: freezed == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PermitChecklistItem].
extension PermitChecklistItemPatterns on PermitChecklistItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PermitChecklistItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PermitChecklistItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PermitChecklistItem value)  $default,){
final _that = this;
switch (_that) {
case _PermitChecklistItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PermitChecklistItem value)?  $default,){
final _that = this;
switch (_that) {
case _PermitChecklistItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? label,  String? docType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PermitChecklistItem() when $default != null:
return $default(_that.id,_that.label,_that.docType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? label,  String? docType)  $default,) {final _that = this;
switch (_that) {
case _PermitChecklistItem():
return $default(_that.id,_that.label,_that.docType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? label,  String? docType)?  $default,) {final _that = this;
switch (_that) {
case _PermitChecklistItem() when $default != null:
return $default(_that.id,_that.label,_that.docType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PermitChecklistItem implements PermitChecklistItem {
  const _PermitChecklistItem({this.id, this.label, this.docType});
  factory _PermitChecklistItem.fromJson(Map<String, dynamic> json) => _$PermitChecklistItemFromJson(json);

@override final  String? id;
@override final  String? label;
@override final  String? docType;

/// Create a copy of PermitChecklistItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PermitChecklistItemCopyWith<_PermitChecklistItem> get copyWith => __$PermitChecklistItemCopyWithImpl<_PermitChecklistItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PermitChecklistItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PermitChecklistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.docType, docType) || other.docType == docType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,label,docType);
}

@override
String toString() {
    return 'PermitChecklistItem(id: $id, label: $label, docType: $docType)';
}


}

/// @nodoc
abstract mixin class _$PermitChecklistItemCopyWith<$Res> implements $PermitChecklistItemCopyWith<$Res> {
  factory _$PermitChecklistItemCopyWith(_PermitChecklistItem value, $Res Function(_PermitChecklistItem) _then) = __$PermitChecklistItemCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? label, String? docType
});




}
/// @nodoc
class __$PermitChecklistItemCopyWithImpl<$Res>
    implements _$PermitChecklistItemCopyWith<$Res> {
  __$PermitChecklistItemCopyWithImpl(this._self, this._then);

  final _PermitChecklistItem _self;
  final $Res Function(_PermitChecklistItem) _then;

/// Create a copy of PermitChecklistItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? label = freezed,Object? docType = freezed,}) {
  return _then(_PermitChecklistItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,docType: freezed == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ResidencePermit {

/// Firestore document id.
 String get id; String get countryId; PermitType get type; Localized get name; String? get legalBasis; Money? get fee; ProcessingWeeks? get processingWeeks; Money? get fundsProof; WorkRights? get workRights; int? get durationMonths; List<String> get requirementIds; List<String> get followOnPermitIds; List<PermitChecklistItem> get checklist; String? get url; Provenance get provenance;
/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResidencePermitCopyWith<ResidencePermit> get copyWith => _$ResidencePermitCopyWithImpl<ResidencePermit>(this as ResidencePermit, _$identity);

  /// Serializes this ResidencePermit to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ResidencePermit;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResidencePermit&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.countryId, _this.countryId) || other.countryId == _this.countryId)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.legalBasis, _this.legalBasis) || other.legalBasis == _this.legalBasis)&&(identical(other.fee, _this.fee) || other.fee == _this.fee)&&(identical(other.processingWeeks, _this.processingWeeks) || other.processingWeeks == _this.processingWeeks)&&(identical(other.fundsProof, _this.fundsProof) || other.fundsProof == _this.fundsProof)&&(identical(other.workRights, _this.workRights) || other.workRights == _this.workRights)&&(identical(other.durationMonths, _this.durationMonths) || other.durationMonths == _this.durationMonths)&&const DeepCollectionEquality().equals(other.requirementIds, _this.requirementIds)&&const DeepCollectionEquality().equals(other.followOnPermitIds, _this.followOnPermitIds)&&const DeepCollectionEquality().equals(other.checklist, _this.checklist)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ResidencePermit;
  return Object.hash(runtimeType,_this.id,_this.countryId,_this.type,_this.name,_this.legalBasis,_this.fee,_this.processingWeeks,_this.fundsProof,_this.workRights,_this.durationMonths,const DeepCollectionEquality().hash(_this.requirementIds),const DeepCollectionEquality().hash(_this.followOnPermitIds),const DeepCollectionEquality().hash(_this.checklist),_this.url,_this.provenance);
}

@override
String toString() {
  final _this = this as ResidencePermit;
  return 'ResidencePermit(id: ${_this.id}, countryId: ${_this.countryId}, type: ${_this.type}, name: ${_this.name}, legalBasis: ${_this.legalBasis}, fee: ${_this.fee}, processingWeeks: ${_this.processingWeeks}, fundsProof: ${_this.fundsProof}, workRights: ${_this.workRights}, durationMonths: ${_this.durationMonths}, requirementIds: ${_this.requirementIds}, followOnPermitIds: ${_this.followOnPermitIds}, checklist: ${_this.checklist}, url: ${_this.url}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $ResidencePermitCopyWith<$Res>  {
  factory $ResidencePermitCopyWith(ResidencePermit value, $Res Function(ResidencePermit) _then) = _$ResidencePermitCopyWithImpl;
@useResult
$Res call({
 String id, String countryId, PermitType type, Localized name, String? legalBasis, Money? fee, ProcessingWeeks? processingWeeks, Money? fundsProof, WorkRights? workRights, int? durationMonths, List<String> requirementIds, List<String> followOnPermitIds, List<PermitChecklistItem> checklist, String? url, Provenance provenance
});


$LocalizedCopyWith<$Res> get name;$MoneyCopyWith<$Res>? get fee;$ProcessingWeeksCopyWith<$Res>? get processingWeeks;$MoneyCopyWith<$Res>? get fundsProof;$WorkRightsCopyWith<$Res>? get workRights;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$ResidencePermitCopyWithImpl<$Res>
    implements $ResidencePermitCopyWith<$Res> {
  _$ResidencePermitCopyWithImpl(this._self, this._then);

  final ResidencePermit _self;
  final $Res Function(ResidencePermit) _then;

/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? countryId = null,Object? type = null,Object? name = null,Object? legalBasis = freezed,Object? fee = freezed,Object? processingWeeks = freezed,Object? fundsProof = freezed,Object? workRights = freezed,Object? durationMonths = freezed,Object? requirementIds = null,Object? followOnPermitIds = null,Object? checklist = null,Object? url = freezed,Object? provenance = null,}) {
  return _then(ResidencePermit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PermitType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,legalBasis: freezed == legalBasis ? _self.legalBasis : legalBasis // ignore: cast_nullable_to_non_nullable
as String?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money?,processingWeeks: freezed == processingWeeks ? _self.processingWeeks : processingWeeks // ignore: cast_nullable_to_non_nullable
as ProcessingWeeks?,fundsProof: freezed == fundsProof ? _self.fundsProof : fundsProof // ignore: cast_nullable_to_non_nullable
as Money?,workRights: freezed == workRights ? _self.workRights : workRights // ignore: cast_nullable_to_non_nullable
as WorkRights?,durationMonths: freezed == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int?,requirementIds: null == requirementIds ? _self.requirementIds : requirementIds // ignore: cast_nullable_to_non_nullable
as List<String>,followOnPermitIds: null == followOnPermitIds ? _self.followOnPermitIds : followOnPermitIds // ignore: cast_nullable_to_non_nullable
as List<String>,checklist: null == checklist ? _self.checklist : checklist // ignore: cast_nullable_to_non_nullable
as List<PermitChecklistItem>,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get fee {
    if (_self.fee == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.fee!, (value) {
    return _then(_self.copyWith(fee: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessingWeeksCopyWith<$Res>? get processingWeeks {
    if (_self.processingWeeks == null) {
    return null;
  }

  return $ProcessingWeeksCopyWith<$Res>(_self.processingWeeks!, (value) {
    return _then(_self.copyWith(processingWeeks: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get fundsProof {
    if (_self.fundsProof == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.fundsProof!, (value) {
    return _then(_self.copyWith(fundsProof: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkRightsCopyWith<$Res>? get workRights {
    if (_self.workRights == null) {
    return null;
  }

  return $WorkRightsCopyWith<$Res>(_self.workRights!, (value) {
    return _then(_self.copyWith(workRights: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResidencePermit].
extension ResidencePermitPatterns on ResidencePermit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResidencePermit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResidencePermit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResidencePermit value)  $default,){
final _that = this;
switch (_that) {
case _ResidencePermit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResidencePermit value)?  $default,){
final _that = this;
switch (_that) {
case _ResidencePermit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String countryId,  PermitType type,  Localized name,  String? legalBasis,  Money? fee,  ProcessingWeeks? processingWeeks,  Money? fundsProof,  WorkRights? workRights,  int? durationMonths,  List<String> requirementIds,  List<String> followOnPermitIds,  List<PermitChecklistItem> checklist,  String? url,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResidencePermit() when $default != null:
return $default(_that.id,_that.countryId,_that.type,_that.name,_that.legalBasis,_that.fee,_that.processingWeeks,_that.fundsProof,_that.workRights,_that.durationMonths,_that.requirementIds,_that.followOnPermitIds,_that.checklist,_that.url,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String countryId,  PermitType type,  Localized name,  String? legalBasis,  Money? fee,  ProcessingWeeks? processingWeeks,  Money? fundsProof,  WorkRights? workRights,  int? durationMonths,  List<String> requirementIds,  List<String> followOnPermitIds,  List<PermitChecklistItem> checklist,  String? url,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _ResidencePermit():
return $default(_that.id,_that.countryId,_that.type,_that.name,_that.legalBasis,_that.fee,_that.processingWeeks,_that.fundsProof,_that.workRights,_that.durationMonths,_that.requirementIds,_that.followOnPermitIds,_that.checklist,_that.url,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String countryId,  PermitType type,  Localized name,  String? legalBasis,  Money? fee,  ProcessingWeeks? processingWeeks,  Money? fundsProof,  WorkRights? workRights,  int? durationMonths,  List<String> requirementIds,  List<String> followOnPermitIds,  List<PermitChecklistItem> checklist,  String? url,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _ResidencePermit() when $default != null:
return $default(_that.id,_that.countryId,_that.type,_that.name,_that.legalBasis,_that.fee,_that.processingWeeks,_that.fundsProof,_that.workRights,_that.durationMonths,_that.requirementIds,_that.followOnPermitIds,_that.checklist,_that.url,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResidencePermit implements ResidencePermit {
  const _ResidencePermit({required this.id, required this.countryId, required this.type, required this.name, this.legalBasis, this.fee, this.processingWeeks, this.fundsProof, this.workRights, this.durationMonths,  List<String> requirementIds = const [],  List<String> followOnPermitIds = const [],  List<PermitChecklistItem> checklist = const [], this.url, required this.provenance}): _requirementIds = requirementIds,_followOnPermitIds = followOnPermitIds,_checklist = checklist;
  factory _ResidencePermit.fromJson(Map<String, dynamic> json) => _$ResidencePermitFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  String countryId;
@override final  PermitType type;
@override final  Localized name;
@override final  String? legalBasis;
@override final  Money? fee;
@override final  ProcessingWeeks? processingWeeks;
@override final  Money? fundsProof;
@override final  WorkRights? workRights;
@override final  int? durationMonths;
 final  List<String> _requirementIds;
@override@JsonKey() List<String> get requirementIds {
  if (_requirementIds is EqualUnmodifiableListView) return _requirementIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirementIds);
}

 final  List<String> _followOnPermitIds;
@override@JsonKey() List<String> get followOnPermitIds {
  if (_followOnPermitIds is EqualUnmodifiableListView) return _followOnPermitIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_followOnPermitIds);
}

 final  List<PermitChecklistItem> _checklist;
@override@JsonKey() List<PermitChecklistItem> get checklist {
  if (_checklist is EqualUnmodifiableListView) return _checklist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checklist);
}

@override final  String? url;
@override final  Provenance provenance;

/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResidencePermitCopyWith<_ResidencePermit> get copyWith => __$ResidencePermitCopyWithImpl<_ResidencePermit>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResidencePermitToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResidencePermit&&(identical(other.id, id) || other.id == id)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.legalBasis, legalBasis) || other.legalBasis == legalBasis)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.processingWeeks, processingWeeks) || other.processingWeeks == processingWeeks)&&(identical(other.fundsProof, fundsProof) || other.fundsProof == fundsProof)&&(identical(other.workRights, workRights) || other.workRights == workRights)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&const DeepCollectionEquality().equals(other.requirementIds, _requirementIds)&&const DeepCollectionEquality().equals(other.followOnPermitIds, _followOnPermitIds)&&const DeepCollectionEquality().equals(other.checklist, _checklist)&&(identical(other.url, url) || other.url == url)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,countryId,type,name,legalBasis,fee,processingWeeks,fundsProof,workRights,durationMonths,const DeepCollectionEquality().hash(_requirementIds),const DeepCollectionEquality().hash(_followOnPermitIds),const DeepCollectionEquality().hash(_checklist),url,provenance);
}

@override
String toString() {
    return 'ResidencePermit(id: $id, countryId: $countryId, type: $type, name: $name, legalBasis: $legalBasis, fee: $fee, processingWeeks: $processingWeeks, fundsProof: $fundsProof, workRights: $workRights, durationMonths: $durationMonths, requirementIds: $requirementIds, followOnPermitIds: $followOnPermitIds, checklist: $checklist, url: $url, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$ResidencePermitCopyWith<$Res> implements $ResidencePermitCopyWith<$Res> {
  factory _$ResidencePermitCopyWith(_ResidencePermit value, $Res Function(_ResidencePermit) _then) = __$ResidencePermitCopyWithImpl;
@override @useResult
$Res call({
 String id, String countryId, PermitType type, Localized name, String? legalBasis, Money? fee, ProcessingWeeks? processingWeeks, Money? fundsProof, WorkRights? workRights, int? durationMonths, List<String> requirementIds, List<String> followOnPermitIds, List<PermitChecklistItem> checklist, String? url, Provenance provenance
});


@override $LocalizedCopyWith<$Res> get name;@override $MoneyCopyWith<$Res>? get fee;@override $ProcessingWeeksCopyWith<$Res>? get processingWeeks;@override $MoneyCopyWith<$Res>? get fundsProof;@override $WorkRightsCopyWith<$Res>? get workRights;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$ResidencePermitCopyWithImpl<$Res>
    implements _$ResidencePermitCopyWith<$Res> {
  __$ResidencePermitCopyWithImpl(this._self, this._then);

  final _ResidencePermit _self;
  final $Res Function(_ResidencePermit) _then;

/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? countryId = null,Object? type = null,Object? name = null,Object? legalBasis = freezed,Object? fee = freezed,Object? processingWeeks = freezed,Object? fundsProof = freezed,Object? workRights = freezed,Object? durationMonths = freezed,Object? requirementIds = null,Object? followOnPermitIds = null,Object? checklist = null,Object? url = freezed,Object? provenance = null,}) {
  return _then(_ResidencePermit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PermitType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as Localized,legalBasis: freezed == legalBasis ? _self.legalBasis : legalBasis // ignore: cast_nullable_to_non_nullable
as String?,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money?,processingWeeks: freezed == processingWeeks ? _self.processingWeeks : processingWeeks // ignore: cast_nullable_to_non_nullable
as ProcessingWeeks?,fundsProof: freezed == fundsProof ? _self.fundsProof : fundsProof // ignore: cast_nullable_to_non_nullable
as Money?,workRights: freezed == workRights ? _self.workRights : workRights // ignore: cast_nullable_to_non_nullable
as WorkRights?,durationMonths: freezed == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int?,requirementIds: null == requirementIds ? _self._requirementIds : requirementIds // ignore: cast_nullable_to_non_nullable
as List<String>,followOnPermitIds: null == followOnPermitIds ? _self._followOnPermitIds : followOnPermitIds // ignore: cast_nullable_to_non_nullable
as List<String>,checklist: null == checklist ? _self._checklist : checklist // ignore: cast_nullable_to_non_nullable
as List<PermitChecklistItem>,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get name {
  
  return $LocalizedCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get fee {
    if (_self.fee == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.fee!, (value) {
    return _then(_self.copyWith(fee: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProcessingWeeksCopyWith<$Res>? get processingWeeks {
    if (_self.processingWeeks == null) {
    return null;
  }

  return $ProcessingWeeksCopyWith<$Res>(_self.processingWeeks!, (value) {
    return _then(_self.copyWith(processingWeeks: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get fundsProof {
    if (_self.fundsProof == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.fundsProof!, (value) {
    return _then(_self.copyWith(fundsProof: value));
  });
}/// Create a copy of ResidencePermit
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WorkRightsCopyWith<$Res>? get workRights {
    if (_self.workRights == null) {
    return null;
  }

  return $WorkRightsCopyWith<$Res>(_self.workRights!, (value) {
    return _then(_self.copyWith(workRights: value));
  });
}/// Create a copy of ResidencePermit
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
