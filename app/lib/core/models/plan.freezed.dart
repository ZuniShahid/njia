// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlanFundingOption {

 String get id; String get name; int? get difficulty; String? get closes;
/// Create a copy of PlanFundingOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanFundingOptionCopyWith<PlanFundingOption> get copyWith => _$PlanFundingOptionCopyWithImpl<PlanFundingOption>(this as PlanFundingOption, _$identity);

  /// Serializes this PlanFundingOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanFundingOption;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanFundingOption&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.closes, _this.closes) || other.closes == _this.closes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanFundingOption;
  return Object.hash(runtimeType,_this.id,_this.name,_this.difficulty,_this.closes);
}

@override
String toString() {
  final _this = this as PlanFundingOption;
  return 'PlanFundingOption(id: ${_this.id}, name: ${_this.name}, difficulty: ${_this.difficulty}, closes: ${_this.closes})';
}


}

/// @nodoc
abstract mixin class $PlanFundingOptionCopyWith<$Res>  {
  factory $PlanFundingOptionCopyWith(PlanFundingOption value, $Res Function(PlanFundingOption) _then) = _$PlanFundingOptionCopyWithImpl;
@useResult
$Res call({
 String id, String name, int? difficulty, String? closes
});




}
/// @nodoc
class _$PlanFundingOptionCopyWithImpl<$Res>
    implements $PlanFundingOptionCopyWith<$Res> {
  _$PlanFundingOptionCopyWithImpl(this._self, this._then);

  final PlanFundingOption _self;
  final $Res Function(PlanFundingOption) _then;

/// Create a copy of PlanFundingOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? difficulty = freezed,Object? closes = freezed,}) {
  return _then(PlanFundingOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int?,closes: freezed == closes ? _self.closes : closes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanFundingOption].
extension PlanFundingOptionPatterns on PlanFundingOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanFundingOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanFundingOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanFundingOption value)  $default,){
final _that = this;
switch (_that) {
case _PlanFundingOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanFundingOption value)?  $default,){
final _that = this;
switch (_that) {
case _PlanFundingOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int? difficulty,  String? closes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanFundingOption() when $default != null:
return $default(_that.id,_that.name,_that.difficulty,_that.closes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int? difficulty,  String? closes)  $default,) {final _that = this;
switch (_that) {
case _PlanFundingOption():
return $default(_that.id,_that.name,_that.difficulty,_that.closes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int? difficulty,  String? closes)?  $default,) {final _that = this;
switch (_that) {
case _PlanFundingOption() when $default != null:
return $default(_that.id,_that.name,_that.difficulty,_that.closes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanFundingOption implements PlanFundingOption {
  const _PlanFundingOption({required this.id, required this.name, this.difficulty, this.closes});
  factory _PlanFundingOption.fromJson(Map<String, dynamic> json) => _$PlanFundingOptionFromJson(json);

@override final  String id;
@override final  String name;
@override final  int? difficulty;
@override final  String? closes;

/// Create a copy of PlanFundingOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanFundingOptionCopyWith<_PlanFundingOption> get copyWith => __$PlanFundingOptionCopyWithImpl<_PlanFundingOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanFundingOptionToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanFundingOption&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.closes, closes) || other.closes == closes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,difficulty,closes);
}

@override
String toString() {
    return 'PlanFundingOption(id: $id, name: $name, difficulty: $difficulty, closes: $closes)';
}


}

/// @nodoc
abstract mixin class _$PlanFundingOptionCopyWith<$Res> implements $PlanFundingOptionCopyWith<$Res> {
  factory _$PlanFundingOptionCopyWith(_PlanFundingOption value, $Res Function(_PlanFundingOption) _then) = __$PlanFundingOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int? difficulty, String? closes
});




}
/// @nodoc
class __$PlanFundingOptionCopyWithImpl<$Res>
    implements _$PlanFundingOptionCopyWith<$Res> {
  __$PlanFundingOptionCopyWithImpl(this._self, this._then);

  final _PlanFundingOption _self;
  final $Res Function(_PlanFundingOption) _then;

/// Create a copy of PlanFundingOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? difficulty = freezed,Object? closes = freezed,}) {
  return _then(_PlanFundingOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,difficulty: freezed == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as int?,closes: freezed == closes ? _self.closes : closes // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PlanStep {

 int get order; int get startMonth; String get kind; String get title; int? get durationMonths; String? get requirementId;/// "gap" or "unknown" for prepare steps.
 String? get status; String? get howToMeet; List<ProviderType> get providerTypes; String? get pathwayId; String? get deadline; List<PlanFundingOption> get funding; String? get institution; String? get city; String? get permitId; VisaApplication? get applyAt; List<PermitChecklistItem> get checklist; Money? get fee; Money? get fundsProof; String? get note;
/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanStepCopyWith<PlanStep> get copyWith => _$PlanStepCopyWithImpl<PlanStep>(this as PlanStep, _$identity);

  /// Serializes this PlanStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanStep&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.startMonth, _this.startMonth) || other.startMonth == _this.startMonth)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.durationMonths, _this.durationMonths) || other.durationMonths == _this.durationMonths)&&(identical(other.requirementId, _this.requirementId) || other.requirementId == _this.requirementId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.howToMeet, _this.howToMeet) || other.howToMeet == _this.howToMeet)&&const DeepCollectionEquality().equals(other.providerTypes, _this.providerTypes)&&(identical(other.pathwayId, _this.pathwayId) || other.pathwayId == _this.pathwayId)&&(identical(other.deadline, _this.deadline) || other.deadline == _this.deadline)&&const DeepCollectionEquality().equals(other.funding, _this.funding)&&(identical(other.institution, _this.institution) || other.institution == _this.institution)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.permitId, _this.permitId) || other.permitId == _this.permitId)&&(identical(other.applyAt, _this.applyAt) || other.applyAt == _this.applyAt)&&const DeepCollectionEquality().equals(other.checklist, _this.checklist)&&(identical(other.fee, _this.fee) || other.fee == _this.fee)&&(identical(other.fundsProof, _this.fundsProof) || other.fundsProof == _this.fundsProof)&&(identical(other.note, _this.note) || other.note == _this.note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanStep;
  return Object.hashAll([runtimeType,_this.order,_this.startMonth,_this.kind,_this.title,_this.durationMonths,_this.requirementId,_this.status,_this.howToMeet,const DeepCollectionEquality().hash(_this.providerTypes),_this.pathwayId,_this.deadline,const DeepCollectionEquality().hash(_this.funding),_this.institution,_this.city,_this.permitId,_this.applyAt,const DeepCollectionEquality().hash(_this.checklist),_this.fee,_this.fundsProof,_this.note]);
}

@override
String toString() {
  final _this = this as PlanStep;
  return 'PlanStep(order: ${_this.order}, startMonth: ${_this.startMonth}, kind: ${_this.kind}, title: ${_this.title}, durationMonths: ${_this.durationMonths}, requirementId: ${_this.requirementId}, status: ${_this.status}, howToMeet: ${_this.howToMeet}, providerTypes: ${_this.providerTypes}, pathwayId: ${_this.pathwayId}, deadline: ${_this.deadline}, funding: ${_this.funding}, institution: ${_this.institution}, city: ${_this.city}, permitId: ${_this.permitId}, applyAt: ${_this.applyAt}, checklist: ${_this.checklist}, fee: ${_this.fee}, fundsProof: ${_this.fundsProof}, note: ${_this.note})';
}


}

/// @nodoc
abstract mixin class $PlanStepCopyWith<$Res>  {
  factory $PlanStepCopyWith(PlanStep value, $Res Function(PlanStep) _then) = _$PlanStepCopyWithImpl;
@useResult
$Res call({
 int order, int startMonth, String kind, String title, int? durationMonths, String? requirementId, String? status, String? howToMeet, List<ProviderType> providerTypes, String? pathwayId, String? deadline, List<PlanFundingOption> funding, String? institution, String? city, String? permitId, VisaApplication? applyAt, List<PermitChecklistItem> checklist, Money? fee, Money? fundsProof, String? note
});


$VisaApplicationCopyWith<$Res>? get applyAt;$MoneyCopyWith<$Res>? get fee;$MoneyCopyWith<$Res>? get fundsProof;

}
/// @nodoc
class _$PlanStepCopyWithImpl<$Res>
    implements $PlanStepCopyWith<$Res> {
  _$PlanStepCopyWithImpl(this._self, this._then);

  final PlanStep _self;
  final $Res Function(PlanStep) _then;

/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? startMonth = null,Object? kind = null,Object? title = null,Object? durationMonths = freezed,Object? requirementId = freezed,Object? status = freezed,Object? howToMeet = freezed,Object? providerTypes = null,Object? pathwayId = freezed,Object? deadline = freezed,Object? funding = null,Object? institution = freezed,Object? city = freezed,Object? permitId = freezed,Object? applyAt = freezed,Object? checklist = null,Object? fee = freezed,Object? fundsProof = freezed,Object? note = freezed,}) {
  return _then(PlanStep(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,startMonth: null == startMonth ? _self.startMonth : startMonth // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,durationMonths: freezed == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int?,requirementId: freezed == requirementId ? _self.requirementId : requirementId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,howToMeet: freezed == howToMeet ? _self.howToMeet : howToMeet // ignore: cast_nullable_to_non_nullable
as String?,providerTypes: null == providerTypes ? _self.providerTypes : providerTypes // ignore: cast_nullable_to_non_nullable
as List<ProviderType>,pathwayId: freezed == pathwayId ? _self.pathwayId : pathwayId // ignore: cast_nullable_to_non_nullable
as String?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,funding: null == funding ? _self.funding : funding // ignore: cast_nullable_to_non_nullable
as List<PlanFundingOption>,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,permitId: freezed == permitId ? _self.permitId : permitId // ignore: cast_nullable_to_non_nullable
as String?,applyAt: freezed == applyAt ? _self.applyAt : applyAt // ignore: cast_nullable_to_non_nullable
as VisaApplication?,checklist: null == checklist ? _self.checklist : checklist // ignore: cast_nullable_to_non_nullable
as List<PermitChecklistItem>,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money?,fundsProof: freezed == fundsProof ? _self.fundsProof : fundsProof // ignore: cast_nullable_to_non_nullable
as Money?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VisaApplicationCopyWith<$Res>? get applyAt {
    if (_self.applyAt == null) {
    return null;
  }

  return $VisaApplicationCopyWith<$Res>(_self.applyAt!, (value) {
    return _then(_self.copyWith(applyAt: value));
  });
}/// Create a copy of PlanStep
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
}/// Create a copy of PlanStep
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
}
}


/// Adds pattern-matching-related methods to [PlanStep].
extension PlanStepPatterns on PlanStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanStep value)  $default,){
final _that = this;
switch (_that) {
case _PlanStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanStep value)?  $default,){
final _that = this;
switch (_that) {
case _PlanStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int order,  int startMonth,  String kind,  String title,  int? durationMonths,  String? requirementId,  String? status,  String? howToMeet,  List<ProviderType> providerTypes,  String? pathwayId,  String? deadline,  List<PlanFundingOption> funding,  String? institution,  String? city,  String? permitId,  VisaApplication? applyAt,  List<PermitChecklistItem> checklist,  Money? fee,  Money? fundsProof,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanStep() when $default != null:
return $default(_that.order,_that.startMonth,_that.kind,_that.title,_that.durationMonths,_that.requirementId,_that.status,_that.howToMeet,_that.providerTypes,_that.pathwayId,_that.deadline,_that.funding,_that.institution,_that.city,_that.permitId,_that.applyAt,_that.checklist,_that.fee,_that.fundsProof,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int order,  int startMonth,  String kind,  String title,  int? durationMonths,  String? requirementId,  String? status,  String? howToMeet,  List<ProviderType> providerTypes,  String? pathwayId,  String? deadline,  List<PlanFundingOption> funding,  String? institution,  String? city,  String? permitId,  VisaApplication? applyAt,  List<PermitChecklistItem> checklist,  Money? fee,  Money? fundsProof,  String? note)  $default,) {final _that = this;
switch (_that) {
case _PlanStep():
return $default(_that.order,_that.startMonth,_that.kind,_that.title,_that.durationMonths,_that.requirementId,_that.status,_that.howToMeet,_that.providerTypes,_that.pathwayId,_that.deadline,_that.funding,_that.institution,_that.city,_that.permitId,_that.applyAt,_that.checklist,_that.fee,_that.fundsProof,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int order,  int startMonth,  String kind,  String title,  int? durationMonths,  String? requirementId,  String? status,  String? howToMeet,  List<ProviderType> providerTypes,  String? pathwayId,  String? deadline,  List<PlanFundingOption> funding,  String? institution,  String? city,  String? permitId,  VisaApplication? applyAt,  List<PermitChecklistItem> checklist,  Money? fee,  Money? fundsProof,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _PlanStep() when $default != null:
return $default(_that.order,_that.startMonth,_that.kind,_that.title,_that.durationMonths,_that.requirementId,_that.status,_that.howToMeet,_that.providerTypes,_that.pathwayId,_that.deadline,_that.funding,_that.institution,_that.city,_that.permitId,_that.applyAt,_that.checklist,_that.fee,_that.fundsProof,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanStep implements PlanStep {
  const _PlanStep({required this.order, required this.startMonth, required this.kind, required this.title, this.durationMonths, this.requirementId, this.status, this.howToMeet,  List<ProviderType> providerTypes = const [], this.pathwayId, this.deadline,  List<PlanFundingOption> funding = const [], this.institution, this.city, this.permitId, this.applyAt,  List<PermitChecklistItem> checklist = const [], this.fee, this.fundsProof, this.note}): _providerTypes = providerTypes,_funding = funding,_checklist = checklist;
  factory _PlanStep.fromJson(Map<String, dynamic> json) => _$PlanStepFromJson(json);

@override final  int order;
@override final  int startMonth;
@override final  String kind;
@override final  String title;
@override final  int? durationMonths;
@override final  String? requirementId;
/// "gap" or "unknown" for prepare steps.
@override final  String? status;
@override final  String? howToMeet;
 final  List<ProviderType> _providerTypes;
@override@JsonKey() List<ProviderType> get providerTypes {
  if (_providerTypes is EqualUnmodifiableListView) return _providerTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providerTypes);
}

@override final  String? pathwayId;
@override final  String? deadline;
 final  List<PlanFundingOption> _funding;
@override@JsonKey() List<PlanFundingOption> get funding {
  if (_funding is EqualUnmodifiableListView) return _funding;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_funding);
}

@override final  String? institution;
@override final  String? city;
@override final  String? permitId;
@override final  VisaApplication? applyAt;
 final  List<PermitChecklistItem> _checklist;
@override@JsonKey() List<PermitChecklistItem> get checklist {
  if (_checklist is EqualUnmodifiableListView) return _checklist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checklist);
}

@override final  Money? fee;
@override final  Money? fundsProof;
@override final  String? note;

/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanStepCopyWith<_PlanStep> get copyWith => __$PlanStepCopyWithImpl<_PlanStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanStepToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanStep&&(identical(other.order, order) || other.order == order)&&(identical(other.startMonth, startMonth) || other.startMonth == startMonth)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.title, title) || other.title == title)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.requirementId, requirementId) || other.requirementId == requirementId)&&(identical(other.status, status) || other.status == status)&&(identical(other.howToMeet, howToMeet) || other.howToMeet == howToMeet)&&const DeepCollectionEquality().equals(other.providerTypes, _providerTypes)&&(identical(other.pathwayId, pathwayId) || other.pathwayId == pathwayId)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&const DeepCollectionEquality().equals(other.funding, _funding)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.city, city) || other.city == city)&&(identical(other.permitId, permitId) || other.permitId == permitId)&&(identical(other.applyAt, applyAt) || other.applyAt == applyAt)&&const DeepCollectionEquality().equals(other.checklist, _checklist)&&(identical(other.fee, fee) || other.fee == fee)&&(identical(other.fundsProof, fundsProof) || other.fundsProof == fundsProof)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,order,startMonth,kind,title,durationMonths,requirementId,status,howToMeet,const DeepCollectionEquality().hash(_providerTypes),pathwayId,deadline,const DeepCollectionEquality().hash(_funding),institution,city,permitId,applyAt,const DeepCollectionEquality().hash(_checklist),fee,fundsProof,note]);
}

@override
String toString() {
    return 'PlanStep(order: $order, startMonth: $startMonth, kind: $kind, title: $title, durationMonths: $durationMonths, requirementId: $requirementId, status: $status, howToMeet: $howToMeet, providerTypes: $providerTypes, pathwayId: $pathwayId, deadline: $deadline, funding: $funding, institution: $institution, city: $city, permitId: $permitId, applyAt: $applyAt, checklist: $checklist, fee: $fee, fundsProof: $fundsProof, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PlanStepCopyWith<$Res> implements $PlanStepCopyWith<$Res> {
  factory _$PlanStepCopyWith(_PlanStep value, $Res Function(_PlanStep) _then) = __$PlanStepCopyWithImpl;
@override @useResult
$Res call({
 int order, int startMonth, String kind, String title, int? durationMonths, String? requirementId, String? status, String? howToMeet, List<ProviderType> providerTypes, String? pathwayId, String? deadline, List<PlanFundingOption> funding, String? institution, String? city, String? permitId, VisaApplication? applyAt, List<PermitChecklistItem> checklist, Money? fee, Money? fundsProof, String? note
});


@override $VisaApplicationCopyWith<$Res>? get applyAt;@override $MoneyCopyWith<$Res>? get fee;@override $MoneyCopyWith<$Res>? get fundsProof;

}
/// @nodoc
class __$PlanStepCopyWithImpl<$Res>
    implements _$PlanStepCopyWith<$Res> {
  __$PlanStepCopyWithImpl(this._self, this._then);

  final _PlanStep _self;
  final $Res Function(_PlanStep) _then;

/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? startMonth = null,Object? kind = null,Object? title = null,Object? durationMonths = freezed,Object? requirementId = freezed,Object? status = freezed,Object? howToMeet = freezed,Object? providerTypes = null,Object? pathwayId = freezed,Object? deadline = freezed,Object? funding = null,Object? institution = freezed,Object? city = freezed,Object? permitId = freezed,Object? applyAt = freezed,Object? checklist = null,Object? fee = freezed,Object? fundsProof = freezed,Object? note = freezed,}) {
  return _then(_PlanStep(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,startMonth: null == startMonth ? _self.startMonth : startMonth // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,durationMonths: freezed == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int?,requirementId: freezed == requirementId ? _self.requirementId : requirementId // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,howToMeet: freezed == howToMeet ? _self.howToMeet : howToMeet // ignore: cast_nullable_to_non_nullable
as String?,providerTypes: null == providerTypes ? _self._providerTypes : providerTypes // ignore: cast_nullable_to_non_nullable
as List<ProviderType>,pathwayId: freezed == pathwayId ? _self.pathwayId : pathwayId // ignore: cast_nullable_to_non_nullable
as String?,deadline: freezed == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as String?,funding: null == funding ? _self._funding : funding // ignore: cast_nullable_to_non_nullable
as List<PlanFundingOption>,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,permitId: freezed == permitId ? _self.permitId : permitId // ignore: cast_nullable_to_non_nullable
as String?,applyAt: freezed == applyAt ? _self.applyAt : applyAt // ignore: cast_nullable_to_non_nullable
as VisaApplication?,checklist: null == checklist ? _self._checklist : checklist // ignore: cast_nullable_to_non_nullable
as List<PermitChecklistItem>,fee: freezed == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as Money?,fundsProof: freezed == fundsProof ? _self.fundsProof : fundsProof // ignore: cast_nullable_to_non_nullable
as Money?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PlanStep
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VisaApplicationCopyWith<$Res>? get applyAt {
    if (_self.applyAt == null) {
    return null;
  }

  return $VisaApplicationCopyWith<$Res>(_self.applyAt!, (value) {
    return _then(_self.copyWith(applyAt: value));
  });
}/// Create a copy of PlanStep
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
}/// Create a copy of PlanStep
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
}
}


/// @nodoc
mixin _$PlanCost {

 String get label; String get kind; int get month; String get currency; double? get min; double? get max; double? get amount;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? get period;
/// Create a copy of PlanCost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanCostCopyWith<PlanCost> get copyWith => _$PlanCostCopyWithImpl<PlanCost>(this as PlanCost, _$identity);

  /// Serializes this PlanCost to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanCost;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanCost&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.month, _this.month) || other.month == _this.month)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.min, _this.min) || other.min == _this.min)&&(identical(other.max, _this.max) || other.max == _this.max)&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.period, _this.period) || other.period == _this.period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanCost;
  return Object.hash(runtimeType,_this.label,_this.kind,_this.month,_this.currency,_this.min,_this.max,_this.amount,_this.period);
}

@override
String toString() {
  final _this = this as PlanCost;
  return 'PlanCost(label: ${_this.label}, kind: ${_this.kind}, month: ${_this.month}, currency: ${_this.currency}, min: ${_this.min}, max: ${_this.max}, amount: ${_this.amount}, period: ${_this.period})';
}


}

/// @nodoc
abstract mixin class $PlanCostCopyWith<$Res>  {
  factory $PlanCostCopyWith(PlanCost value, $Res Function(PlanCost) _then) = _$PlanCostCopyWithImpl;
@useResult
$Res call({
 String label, String kind, int month, String currency, double? min, double? max, double? amount,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? period
});




}
/// @nodoc
class _$PlanCostCopyWithImpl<$Res>
    implements $PlanCostCopyWith<$Res> {
  _$PlanCostCopyWithImpl(this._self, this._then);

  final PlanCost _self;
  final $Res Function(PlanCost) _then;

/// Create a copy of PlanCost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? kind = null,Object? month = null,Object? currency = null,Object? min = freezed,Object? max = freezed,Object? amount = freezed,Object? period = freezed,}) {
  return _then(PlanCost(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as MoneyPeriod?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanCost].
extension PlanCostPatterns on PlanCost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanCost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanCost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanCost value)  $default,){
final _that = this;
switch (_that) {
case _PlanCost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanCost value)?  $default,){
final _that = this;
switch (_that) {
case _PlanCost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  String kind,  int month,  String currency,  double? min,  double? max,  double? amount, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanCost() when $default != null:
return $default(_that.label,_that.kind,_that.month,_that.currency,_that.min,_that.max,_that.amount,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  String kind,  int month,  String currency,  double? min,  double? max,  double? amount, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)  $default,) {final _that = this;
switch (_that) {
case _PlanCost():
return $default(_that.label,_that.kind,_that.month,_that.currency,_that.min,_that.max,_that.amount,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  String kind,  int month,  String currency,  double? min,  double? max,  double? amount, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)?  $default,) {final _that = this;
switch (_that) {
case _PlanCost() when $default != null:
return $default(_that.label,_that.kind,_that.month,_that.currency,_that.min,_that.max,_that.amount,_that.period);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanCost implements PlanCost {
  const _PlanCost({required this.label, required this.kind, required this.month, required this.currency, this.min, this.max, this.amount, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.period});
  factory _PlanCost.fromJson(Map<String, dynamic> json) => _$PlanCostFromJson(json);

@override final  String label;
@override final  String kind;
@override final  int month;
@override final  String currency;
@override final  double? min;
@override final  double? max;
@override final  double? amount;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  MoneyPeriod? period;

/// Create a copy of PlanCost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanCostCopyWith<_PlanCost> get copyWith => __$PlanCostCopyWithImpl<_PlanCost>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanCostToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanCost&&(identical(other.label, label) || other.label == label)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.month, month) || other.month == month)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,label,kind,month,currency,min,max,amount,period);
}

@override
String toString() {
    return 'PlanCost(label: $label, kind: $kind, month: $month, currency: $currency, min: $min, max: $max, amount: $amount, period: $period)';
}


}

/// @nodoc
abstract mixin class _$PlanCostCopyWith<$Res> implements $PlanCostCopyWith<$Res> {
  factory _$PlanCostCopyWith(_PlanCost value, $Res Function(_PlanCost) _then) = __$PlanCostCopyWithImpl;
@override @useResult
$Res call({
 String label, String kind, int month, String currency, double? min, double? max, double? amount,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? period
});




}
/// @nodoc
class __$PlanCostCopyWithImpl<$Res>
    implements _$PlanCostCopyWith<$Res> {
  __$PlanCostCopyWithImpl(this._self, this._then);

  final _PlanCost _self;
  final $Res Function(_PlanCost) _then;

/// Create a copy of PlanCost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? kind = null,Object? month = null,Object? currency = null,Object? min = freezed,Object? max = freezed,Object? amount = freezed,Object? period = freezed,}) {
  return _then(_PlanCost(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as MoneyPeriod?,
  ));
}


}


/// @nodoc
mixin _$PlanGap {

 String get requirementId;/// "gap" or "unknown".
 String get status; String? get label;
/// Create a copy of PlanGap
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanGapCopyWith<PlanGap> get copyWith => _$PlanGapCopyWithImpl<PlanGap>(this as PlanGap, _$identity);

  /// Serializes this PlanGap to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanGap;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanGap&&(identical(other.requirementId, _this.requirementId) || other.requirementId == _this.requirementId)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.label, _this.label) || other.label == _this.label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanGap;
  return Object.hash(runtimeType,_this.requirementId,_this.status,_this.label);
}

@override
String toString() {
  final _this = this as PlanGap;
  return 'PlanGap(requirementId: ${_this.requirementId}, status: ${_this.status}, label: ${_this.label})';
}


}

/// @nodoc
abstract mixin class $PlanGapCopyWith<$Res>  {
  factory $PlanGapCopyWith(PlanGap value, $Res Function(PlanGap) _then) = _$PlanGapCopyWithImpl;
@useResult
$Res call({
 String requirementId, String status, String? label
});




}
/// @nodoc
class _$PlanGapCopyWithImpl<$Res>
    implements $PlanGapCopyWith<$Res> {
  _$PlanGapCopyWithImpl(this._self, this._then);

  final PlanGap _self;
  final $Res Function(PlanGap) _then;

/// Create a copy of PlanGap
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requirementId = null,Object? status = null,Object? label = freezed,}) {
  return _then(PlanGap(
requirementId: null == requirementId ? _self.requirementId : requirementId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanGap].
extension PlanGapPatterns on PlanGap {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanGap value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanGap() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanGap value)  $default,){
final _that = this;
switch (_that) {
case _PlanGap():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanGap value)?  $default,){
final _that = this;
switch (_that) {
case _PlanGap() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String requirementId,  String status,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanGap() when $default != null:
return $default(_that.requirementId,_that.status,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String requirementId,  String status,  String? label)  $default,) {final _that = this;
switch (_that) {
case _PlanGap():
return $default(_that.requirementId,_that.status,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String requirementId,  String status,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _PlanGap() when $default != null:
return $default(_that.requirementId,_that.status,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanGap implements PlanGap {
  const _PlanGap({required this.requirementId, required this.status, this.label});
  factory _PlanGap.fromJson(Map<String, dynamic> json) => _$PlanGapFromJson(json);

@override final  String requirementId;
/// "gap" or "unknown".
@override final  String status;
@override final  String? label;

/// Create a copy of PlanGap
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanGapCopyWith<_PlanGap> get copyWith => __$PlanGapCopyWithImpl<_PlanGap>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanGapToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanGap&&(identical(other.requirementId, requirementId) || other.requirementId == requirementId)&&(identical(other.status, status) || other.status == status)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,requirementId,status,label);
}

@override
String toString() {
    return 'PlanGap(requirementId: $requirementId, status: $status, label: $label)';
}


}

/// @nodoc
abstract mixin class _$PlanGapCopyWith<$Res> implements $PlanGapCopyWith<$Res> {
  factory _$PlanGapCopyWith(_PlanGap value, $Res Function(_PlanGap) _then) = __$PlanGapCopyWithImpl;
@override @useResult
$Res call({
 String requirementId, String status, String? label
});




}
/// @nodoc
class __$PlanGapCopyWithImpl<$Res>
    implements _$PlanGapCopyWith<$Res> {
  __$PlanGapCopyWithImpl(this._self, this._then);

  final _PlanGap _self;
  final $Res Function(_PlanGap) _then;

/// Create a copy of PlanGap
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requirementId = null,Object? status = null,Object? label = freezed,}) {
  return _then(_PlanGap(
requirementId: null == requirementId ? _self.requirementId : requirementId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PlanScores {

 int get readiness; double get difficulty; int get realism; int? get financeCoverage;
/// Create a copy of PlanScores
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanScoresCopyWith<PlanScores> get copyWith => _$PlanScoresCopyWithImpl<PlanScores>(this as PlanScores, _$identity);

  /// Serializes this PlanScores to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlanScores;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlanScores&&(identical(other.readiness, _this.readiness) || other.readiness == _this.readiness)&&(identical(other.difficulty, _this.difficulty) || other.difficulty == _this.difficulty)&&(identical(other.realism, _this.realism) || other.realism == _this.realism)&&(identical(other.financeCoverage, _this.financeCoverage) || other.financeCoverage == _this.financeCoverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlanScores;
  return Object.hash(runtimeType,_this.readiness,_this.difficulty,_this.realism,_this.financeCoverage);
}

@override
String toString() {
  final _this = this as PlanScores;
  return 'PlanScores(readiness: ${_this.readiness}, difficulty: ${_this.difficulty}, realism: ${_this.realism}, financeCoverage: ${_this.financeCoverage})';
}


}

/// @nodoc
abstract mixin class $PlanScoresCopyWith<$Res>  {
  factory $PlanScoresCopyWith(PlanScores value, $Res Function(PlanScores) _then) = _$PlanScoresCopyWithImpl;
@useResult
$Res call({
 int readiness, double difficulty, int realism, int? financeCoverage
});




}
/// @nodoc
class _$PlanScoresCopyWithImpl<$Res>
    implements $PlanScoresCopyWith<$Res> {
  _$PlanScoresCopyWithImpl(this._self, this._then);

  final PlanScores _self;
  final $Res Function(PlanScores) _then;

/// Create a copy of PlanScores
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? readiness = null,Object? difficulty = null,Object? realism = null,Object? financeCoverage = freezed,}) {
  return _then(PlanScores(
readiness: null == readiness ? _self.readiness : readiness // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as double,realism: null == realism ? _self.realism : realism // ignore: cast_nullable_to_non_nullable
as int,financeCoverage: freezed == financeCoverage ? _self.financeCoverage : financeCoverage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlanScores].
extension PlanScoresPatterns on PlanScores {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlanScores value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlanScores() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlanScores value)  $default,){
final _that = this;
switch (_that) {
case _PlanScores():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlanScores value)?  $default,){
final _that = this;
switch (_that) {
case _PlanScores() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int readiness,  double difficulty,  int realism,  int? financeCoverage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlanScores() when $default != null:
return $default(_that.readiness,_that.difficulty,_that.realism,_that.financeCoverage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int readiness,  double difficulty,  int realism,  int? financeCoverage)  $default,) {final _that = this;
switch (_that) {
case _PlanScores():
return $default(_that.readiness,_that.difficulty,_that.realism,_that.financeCoverage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int readiness,  double difficulty,  int realism,  int? financeCoverage)?  $default,) {final _that = this;
switch (_that) {
case _PlanScores() when $default != null:
return $default(_that.readiness,_that.difficulty,_that.realism,_that.financeCoverage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlanScores implements PlanScores {
  const _PlanScores({required this.readiness, required this.difficulty, required this.realism, this.financeCoverage});
  factory _PlanScores.fromJson(Map<String, dynamic> json) => _$PlanScoresFromJson(json);

@override final  int readiness;
@override final  double difficulty;
@override final  int realism;
@override final  int? financeCoverage;

/// Create a copy of PlanScores
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanScoresCopyWith<_PlanScores> get copyWith => __$PlanScoresCopyWithImpl<_PlanScores>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanScoresToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlanScores&&(identical(other.readiness, readiness) || other.readiness == readiness)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.realism, realism) || other.realism == realism)&&(identical(other.financeCoverage, financeCoverage) || other.financeCoverage == financeCoverage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,readiness,difficulty,realism,financeCoverage);
}

@override
String toString() {
    return 'PlanScores(readiness: $readiness, difficulty: $difficulty, realism: $realism, financeCoverage: $financeCoverage)';
}


}

/// @nodoc
abstract mixin class _$PlanScoresCopyWith<$Res> implements $PlanScoresCopyWith<$Res> {
  factory _$PlanScoresCopyWith(_PlanScores value, $Res Function(_PlanScores) _then) = __$PlanScoresCopyWithImpl;
@override @useResult
$Res call({
 int readiness, double difficulty, int realism, int? financeCoverage
});




}
/// @nodoc
class __$PlanScoresCopyWithImpl<$Res>
    implements _$PlanScoresCopyWith<$Res> {
  __$PlanScoresCopyWithImpl(this._self, this._then);

  final _PlanScores _self;
  final $Res Function(_PlanScores) _then;

/// Create a copy of PlanScores
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? readiness = null,Object? difficulty = null,Object? realism = null,Object? financeCoverage = freezed,}) {
  return _then(_PlanScores(
readiness: null == readiness ? _self.readiness : readiness // ignore: cast_nullable_to_non_nullable
as int,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as double,realism: null == realism ? _self.realism : realism // ignore: cast_nullable_to_non_nullable
as int,financeCoverage: freezed == financeCoverage ? _self.financeCoverage : financeCoverage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$WatchItem {

 String get kind; String get text; String? get fundingId;
/// Create a copy of WatchItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchItemCopyWith<WatchItem> get copyWith => _$WatchItemCopyWithImpl<WatchItem>(this as WatchItem, _$identity);

  /// Serializes this WatchItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WatchItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchItem&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.fundingId, _this.fundingId) || other.fundingId == _this.fundingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WatchItem;
  return Object.hash(runtimeType,_this.kind,_this.text,_this.fundingId);
}

@override
String toString() {
  final _this = this as WatchItem;
  return 'WatchItem(kind: ${_this.kind}, text: ${_this.text}, fundingId: ${_this.fundingId})';
}


}

/// @nodoc
abstract mixin class $WatchItemCopyWith<$Res>  {
  factory $WatchItemCopyWith(WatchItem value, $Res Function(WatchItem) _then) = _$WatchItemCopyWithImpl;
@useResult
$Res call({
 String kind, String text, String? fundingId
});




}
/// @nodoc
class _$WatchItemCopyWithImpl<$Res>
    implements $WatchItemCopyWith<$Res> {
  _$WatchItemCopyWithImpl(this._self, this._then);

  final WatchItem _self;
  final $Res Function(WatchItem) _then;

/// Create a copy of WatchItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? text = null,Object? fundingId = freezed,}) {
  return _then(WatchItem(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,fundingId: freezed == fundingId ? _self.fundingId : fundingId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WatchItem].
extension WatchItemPatterns on WatchItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchItem value)  $default,){
final _that = this;
switch (_that) {
case _WatchItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchItem value)?  $default,){
final _that = this;
switch (_that) {
case _WatchItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String kind,  String text,  String? fundingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchItem() when $default != null:
return $default(_that.kind,_that.text,_that.fundingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String kind,  String text,  String? fundingId)  $default,) {final _that = this;
switch (_that) {
case _WatchItem():
return $default(_that.kind,_that.text,_that.fundingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String kind,  String text,  String? fundingId)?  $default,) {final _that = this;
switch (_that) {
case _WatchItem() when $default != null:
return $default(_that.kind,_that.text,_that.fundingId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchItem implements WatchItem {
  const _WatchItem({required this.kind, required this.text, this.fundingId});
  factory _WatchItem.fromJson(Map<String, dynamic> json) => _$WatchItemFromJson(json);

@override final  String kind;
@override final  String text;
@override final  String? fundingId;

/// Create a copy of WatchItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchItemCopyWith<_WatchItem> get copyWith => __$WatchItemCopyWithImpl<_WatchItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchItem&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.text, text) || other.text == text)&&(identical(other.fundingId, fundingId) || other.fundingId == fundingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kind,text,fundingId);
}

@override
String toString() {
    return 'WatchItem(kind: $kind, text: $text, fundingId: $fundingId)';
}


}

/// @nodoc
abstract mixin class _$WatchItemCopyWith<$Res> implements $WatchItemCopyWith<$Res> {
  factory _$WatchItemCopyWith(_WatchItem value, $Res Function(_WatchItem) _then) = __$WatchItemCopyWithImpl;
@override @useResult
$Res call({
 String kind, String text, String? fundingId
});




}
/// @nodoc
class __$WatchItemCopyWithImpl<$Res>
    implements _$WatchItemCopyWith<$Res> {
  __$WatchItemCopyWithImpl(this._self, this._then);

  final _WatchItem _self;
  final $Res Function(_WatchItem) _then;

/// Create a copy of WatchItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? text = null,Object? fundingId = freezed,}) {
  return _then(_WatchItem(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,fundingId: freezed == fundingId ? _self.fundingId : fundingId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Plan {

/// Firestore document id (= goalId).
 String? get id; String? get goalId; String? get corridorId; List<String> get pathwayIds; List<Map<String, dynamic>> get phases; List<PlanStep> get steps; int get totalMonths; List<PlanCost> get costs; List<PlanGap> get gaps; PlanScores get scores; List<WatchItem> get watch;/// meta/content.version the plan was computed against (server only).
 String? get contentVersion; String? get computedAt;
/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlanCopyWith<Plan> get copyWith => _$PlanCopyWithImpl<Plan>(this as Plan, _$identity);

  /// Serializes this Plan to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Plan;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Plan&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.goalId, _this.goalId) || other.goalId == _this.goalId)&&(identical(other.corridorId, _this.corridorId) || other.corridorId == _this.corridorId)&&const DeepCollectionEquality().equals(other.pathwayIds, _this.pathwayIds)&&const DeepCollectionEquality().equals(other.phases, _this.phases)&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&(identical(other.totalMonths, _this.totalMonths) || other.totalMonths == _this.totalMonths)&&const DeepCollectionEquality().equals(other.costs, _this.costs)&&const DeepCollectionEquality().equals(other.gaps, _this.gaps)&&(identical(other.scores, _this.scores) || other.scores == _this.scores)&&const DeepCollectionEquality().equals(other.watch, _this.watch)&&(identical(other.contentVersion, _this.contentVersion) || other.contentVersion == _this.contentVersion)&&(identical(other.computedAt, _this.computedAt) || other.computedAt == _this.computedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Plan;
  return Object.hash(runtimeType,_this.id,_this.goalId,_this.corridorId,const DeepCollectionEquality().hash(_this.pathwayIds),const DeepCollectionEquality().hash(_this.phases),const DeepCollectionEquality().hash(_this.steps),_this.totalMonths,const DeepCollectionEquality().hash(_this.costs),const DeepCollectionEquality().hash(_this.gaps),_this.scores,const DeepCollectionEquality().hash(_this.watch),_this.contentVersion,_this.computedAt);
}

@override
String toString() {
  final _this = this as Plan;
  return 'Plan(id: ${_this.id}, goalId: ${_this.goalId}, corridorId: ${_this.corridorId}, pathwayIds: ${_this.pathwayIds}, phases: ${_this.phases}, steps: ${_this.steps}, totalMonths: ${_this.totalMonths}, costs: ${_this.costs}, gaps: ${_this.gaps}, scores: ${_this.scores}, watch: ${_this.watch}, contentVersion: ${_this.contentVersion}, computedAt: ${_this.computedAt})';
}


}

/// @nodoc
abstract mixin class $PlanCopyWith<$Res>  {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) _then) = _$PlanCopyWithImpl;
@useResult
$Res call({
 String? id, String? goalId, String? corridorId, List<String> pathwayIds, List<Map<String, dynamic>> phases, List<PlanStep> steps, int totalMonths, List<PlanCost> costs, List<PlanGap> gaps, PlanScores scores, List<WatchItem> watch, String? contentVersion, String? computedAt
});


$PlanScoresCopyWith<$Res> get scores;

}
/// @nodoc
class _$PlanCopyWithImpl<$Res>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._self, this._then);

  final Plan _self;
  final $Res Function(Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? goalId = freezed,Object? corridorId = freezed,Object? pathwayIds = null,Object? phases = null,Object? steps = null,Object? totalMonths = null,Object? costs = null,Object? gaps = null,Object? scores = null,Object? watch = null,Object? contentVersion = freezed,Object? computedAt = freezed,}) {
  return _then(Plan(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,corridorId: freezed == corridorId ? _self.corridorId : corridorId // ignore: cast_nullable_to_non_nullable
as String?,pathwayIds: null == pathwayIds ? _self.pathwayIds : pathwayIds // ignore: cast_nullable_to_non_nullable
as List<String>,phases: null == phases ? _self.phases : phases // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<PlanStep>,totalMonths: null == totalMonths ? _self.totalMonths : totalMonths // ignore: cast_nullable_to_non_nullable
as int,costs: null == costs ? _self.costs : costs // ignore: cast_nullable_to_non_nullable
as List<PlanCost>,gaps: null == gaps ? _self.gaps : gaps // ignore: cast_nullable_to_non_nullable
as List<PlanGap>,scores: null == scores ? _self.scores : scores // ignore: cast_nullable_to_non_nullable
as PlanScores,watch: null == watch ? _self.watch : watch // ignore: cast_nullable_to_non_nullable
as List<WatchItem>,contentVersion: freezed == contentVersion ? _self.contentVersion : contentVersion // ignore: cast_nullable_to_non_nullable
as String?,computedAt: freezed == computedAt ? _self.computedAt : computedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanScoresCopyWith<$Res> get scores {
  
  return $PlanScoresCopyWith<$Res>(_self.scores, (value) {
    return _then(_self.copyWith(scores: value));
  });
}
}


/// Adds pattern-matching-related methods to [Plan].
extension PlanPatterns on Plan {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Plan value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Plan() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Plan value)  $default,){
final _that = this;
switch (_that) {
case _Plan():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Plan value)?  $default,){
final _that = this;
switch (_that) {
case _Plan() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? goalId,  String? corridorId,  List<String> pathwayIds,  List<Map<String, dynamic>> phases,  List<PlanStep> steps,  int totalMonths,  List<PlanCost> costs,  List<PlanGap> gaps,  PlanScores scores,  List<WatchItem> watch,  String? contentVersion,  String? computedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.id,_that.goalId,_that.corridorId,_that.pathwayIds,_that.phases,_that.steps,_that.totalMonths,_that.costs,_that.gaps,_that.scores,_that.watch,_that.contentVersion,_that.computedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? goalId,  String? corridorId,  List<String> pathwayIds,  List<Map<String, dynamic>> phases,  List<PlanStep> steps,  int totalMonths,  List<PlanCost> costs,  List<PlanGap> gaps,  PlanScores scores,  List<WatchItem> watch,  String? contentVersion,  String? computedAt)  $default,) {final _that = this;
switch (_that) {
case _Plan():
return $default(_that.id,_that.goalId,_that.corridorId,_that.pathwayIds,_that.phases,_that.steps,_that.totalMonths,_that.costs,_that.gaps,_that.scores,_that.watch,_that.contentVersion,_that.computedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? goalId,  String? corridorId,  List<String> pathwayIds,  List<Map<String, dynamic>> phases,  List<PlanStep> steps,  int totalMonths,  List<PlanCost> costs,  List<PlanGap> gaps,  PlanScores scores,  List<WatchItem> watch,  String? contentVersion,  String? computedAt)?  $default,) {final _that = this;
switch (_that) {
case _Plan() when $default != null:
return $default(_that.id,_that.goalId,_that.corridorId,_that.pathwayIds,_that.phases,_that.steps,_that.totalMonths,_that.costs,_that.gaps,_that.scores,_that.watch,_that.contentVersion,_that.computedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Plan implements Plan {
  const _Plan({this.id, this.goalId, this.corridorId,  List<String> pathwayIds = const [],  List<Map<String, dynamic>> phases = const [],  List<PlanStep> steps = const [], this.totalMonths = 0,  List<PlanCost> costs = const [],  List<PlanGap> gaps = const [], required this.scores,  List<WatchItem> watch = const [], this.contentVersion, this.computedAt}): _pathwayIds = pathwayIds,_phases = phases,_steps = steps,_costs = costs,_gaps = gaps,_watch = watch;
  factory _Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

/// Firestore document id (= goalId).
@override final  String? id;
@override final  String? goalId;
@override final  String? corridorId;
 final  List<String> _pathwayIds;
@override@JsonKey() List<String> get pathwayIds {
  if (_pathwayIds is EqualUnmodifiableListView) return _pathwayIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pathwayIds);
}

 final  List<Map<String, dynamic>> _phases;
@override@JsonKey() List<Map<String, dynamic>> get phases {
  if (_phases is EqualUnmodifiableListView) return _phases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phases);
}

 final  List<PlanStep> _steps;
@override@JsonKey() List<PlanStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override@JsonKey() final  int totalMonths;
 final  List<PlanCost> _costs;
@override@JsonKey() List<PlanCost> get costs {
  if (_costs is EqualUnmodifiableListView) return _costs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_costs);
}

 final  List<PlanGap> _gaps;
@override@JsonKey() List<PlanGap> get gaps {
  if (_gaps is EqualUnmodifiableListView) return _gaps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gaps);
}

@override final  PlanScores scores;
 final  List<WatchItem> _watch;
@override@JsonKey() List<WatchItem> get watch {
  if (_watch is EqualUnmodifiableListView) return _watch;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_watch);
}

/// meta/content.version the plan was computed against (server only).
@override final  String? contentVersion;
@override final  String? computedAt;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlanCopyWith<_Plan> get copyWith => __$PlanCopyWithImpl<_Plan>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlanToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Plan&&(identical(other.id, id) || other.id == id)&&(identical(other.goalId, goalId) || other.goalId == goalId)&&(identical(other.corridorId, corridorId) || other.corridorId == corridorId)&&const DeepCollectionEquality().equals(other.pathwayIds, _pathwayIds)&&const DeepCollectionEquality().equals(other.phases, _phases)&&const DeepCollectionEquality().equals(other.steps, _steps)&&(identical(other.totalMonths, totalMonths) || other.totalMonths == totalMonths)&&const DeepCollectionEquality().equals(other.costs, _costs)&&const DeepCollectionEquality().equals(other.gaps, _gaps)&&(identical(other.scores, scores) || other.scores == scores)&&const DeepCollectionEquality().equals(other.watch, _watch)&&(identical(other.contentVersion, contentVersion) || other.contentVersion == contentVersion)&&(identical(other.computedAt, computedAt) || other.computedAt == computedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,goalId,corridorId,const DeepCollectionEquality().hash(_pathwayIds),const DeepCollectionEquality().hash(_phases),const DeepCollectionEquality().hash(_steps),totalMonths,const DeepCollectionEquality().hash(_costs),const DeepCollectionEquality().hash(_gaps),scores,const DeepCollectionEquality().hash(_watch),contentVersion,computedAt);
}

@override
String toString() {
    return 'Plan(id: $id, goalId: $goalId, corridorId: $corridorId, pathwayIds: $pathwayIds, phases: $phases, steps: $steps, totalMonths: $totalMonths, costs: $costs, gaps: $gaps, scores: $scores, watch: $watch, contentVersion: $contentVersion, computedAt: $computedAt)';
}


}

/// @nodoc
abstract mixin class _$PlanCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$PlanCopyWith(_Plan value, $Res Function(_Plan) _then) = __$PlanCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? goalId, String? corridorId, List<String> pathwayIds, List<Map<String, dynamic>> phases, List<PlanStep> steps, int totalMonths, List<PlanCost> costs, List<PlanGap> gaps, PlanScores scores, List<WatchItem> watch, String? contentVersion, String? computedAt
});


@override $PlanScoresCopyWith<$Res> get scores;

}
/// @nodoc
class __$PlanCopyWithImpl<$Res>
    implements _$PlanCopyWith<$Res> {
  __$PlanCopyWithImpl(this._self, this._then);

  final _Plan _self;
  final $Res Function(_Plan) _then;

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? goalId = freezed,Object? corridorId = freezed,Object? pathwayIds = null,Object? phases = null,Object? steps = null,Object? totalMonths = null,Object? costs = null,Object? gaps = null,Object? scores = null,Object? watch = null,Object? contentVersion = freezed,Object? computedAt = freezed,}) {
  return _then(_Plan(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,goalId: freezed == goalId ? _self.goalId : goalId // ignore: cast_nullable_to_non_nullable
as String?,corridorId: freezed == corridorId ? _self.corridorId : corridorId // ignore: cast_nullable_to_non_nullable
as String?,pathwayIds: null == pathwayIds ? _self._pathwayIds : pathwayIds // ignore: cast_nullable_to_non_nullable
as List<String>,phases: null == phases ? _self._phases : phases // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<PlanStep>,totalMonths: null == totalMonths ? _self.totalMonths : totalMonths // ignore: cast_nullable_to_non_nullable
as int,costs: null == costs ? _self._costs : costs // ignore: cast_nullable_to_non_nullable
as List<PlanCost>,gaps: null == gaps ? _self._gaps : gaps // ignore: cast_nullable_to_non_nullable
as List<PlanGap>,scores: null == scores ? _self.scores : scores // ignore: cast_nullable_to_non_nullable
as PlanScores,watch: null == watch ? _self._watch : watch // ignore: cast_nullable_to_non_nullable
as List<WatchItem>,contentVersion: freezed == contentVersion ? _self.contentVersion : contentVersion // ignore: cast_nullable_to_non_nullable
as String?,computedAt: freezed == computedAt ? _self.computedAt : computedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Plan
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlanScoresCopyWith<$Res> get scores {
  
  return $PlanScoresCopyWith<$Res>(_self.scores, (value) {
    return _then(_self.copyWith(scores: value));
  });
}
}

// dart format on
