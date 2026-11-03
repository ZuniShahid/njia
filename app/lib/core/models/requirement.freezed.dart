// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requirement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Requirement {

/// Firestore document id.
 String get id; RequirementType get type; Localized get label;/// Machine key matched against profile facts, e.g. language.en.ielts
 String? get key;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) RequirementOperator? get operator; Object? get value;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Cefr? get cefr; Money? get money;/// documents/{type} that proves it, e.g. ielts_certificate
 String? get evidenceDocType; int? get validityMonths; Localized? get howToMeet;/// Which provider types can help meet it
 List<ProviderType> get providerTypes; Provenance get provenance;
/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequirementCopyWith<Requirement> get copyWith => _$RequirementCopyWithImpl<Requirement>(this as Requirement, _$identity);

  /// Serializes this Requirement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Requirement;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Requirement&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.label, _this.label) || other.label == _this.label)&&(identical(other.key, _this.key) || other.key == _this.key)&&(identical(other.operator, _this.operator) || other.operator == _this.operator)&&const DeepCollectionEquality().equals(other.value, _this.value)&&(identical(other.cefr, _this.cefr) || other.cefr == _this.cefr)&&(identical(other.money, _this.money) || other.money == _this.money)&&(identical(other.evidenceDocType, _this.evidenceDocType) || other.evidenceDocType == _this.evidenceDocType)&&(identical(other.validityMonths, _this.validityMonths) || other.validityMonths == _this.validityMonths)&&(identical(other.howToMeet, _this.howToMeet) || other.howToMeet == _this.howToMeet)&&const DeepCollectionEquality().equals(other.providerTypes, _this.providerTypes)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Requirement;
  return Object.hash(runtimeType,_this.id,_this.type,_this.label,_this.key,_this.operator,const DeepCollectionEquality().hash(_this.value),_this.cefr,_this.money,_this.evidenceDocType,_this.validityMonths,_this.howToMeet,const DeepCollectionEquality().hash(_this.providerTypes),_this.provenance);
}

@override
String toString() {
  final _this = this as Requirement;
  return 'Requirement(id: ${_this.id}, type: ${_this.type}, label: ${_this.label}, key: ${_this.key}, operator: ${_this.operator}, value: ${_this.value}, cefr: ${_this.cefr}, money: ${_this.money}, evidenceDocType: ${_this.evidenceDocType}, validityMonths: ${_this.validityMonths}, howToMeet: ${_this.howToMeet}, providerTypes: ${_this.providerTypes}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $RequirementCopyWith<$Res>  {
  factory $RequirementCopyWith(Requirement value, $Res Function(Requirement) _then) = _$RequirementCopyWithImpl;
@useResult
$Res call({
 String id, RequirementType type, Localized label, String? key,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) RequirementOperator? operator, Object? value,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Cefr? cefr, Money? money, String? evidenceDocType, int? validityMonths, Localized? howToMeet, List<ProviderType> providerTypes, Provenance provenance
});


$LocalizedCopyWith<$Res> get label;$MoneyCopyWith<$Res>? get money;$LocalizedCopyWith<$Res>? get howToMeet;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$RequirementCopyWithImpl<$Res>
    implements $RequirementCopyWith<$Res> {
  _$RequirementCopyWithImpl(this._self, this._then);

  final Requirement _self;
  final $Res Function(Requirement) _then;

/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? label = null,Object? key = freezed,Object? operator = freezed,Object? value = freezed,Object? cefr = freezed,Object? money = freezed,Object? evidenceDocType = freezed,Object? validityMonths = freezed,Object? howToMeet = freezed,Object? providerTypes = null,Object? provenance = null,}) {
  return _then(Requirement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RequirementType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,operator: freezed == operator ? _self.operator : operator // ignore: cast_nullable_to_non_nullable
as RequirementOperator?,value: freezed == value ? _self.value : value ,cefr: freezed == cefr ? _self.cefr : cefr // ignore: cast_nullable_to_non_nullable
as Cefr?,money: freezed == money ? _self.money : money // ignore: cast_nullable_to_non_nullable
as Money?,evidenceDocType: freezed == evidenceDocType ? _self.evidenceDocType : evidenceDocType // ignore: cast_nullable_to_non_nullable
as String?,validityMonths: freezed == validityMonths ? _self.validityMonths : validityMonths // ignore: cast_nullable_to_non_nullable
as int?,howToMeet: freezed == howToMeet ? _self.howToMeet : howToMeet // ignore: cast_nullable_to_non_nullable
as Localized?,providerTypes: null == providerTypes ? _self.providerTypes : providerTypes // ignore: cast_nullable_to_non_nullable
as List<ProviderType>,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get money {
    if (_self.money == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.money!, (value) {
    return _then(_self.copyWith(money: value));
  });
}/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get howToMeet {
    if (_self.howToMeet == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.howToMeet!, (value) {
    return _then(_self.copyWith(howToMeet: value));
  });
}/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [Requirement].
extension RequirementPatterns on Requirement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Requirement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Requirement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Requirement value)  $default,){
final _that = this;
switch (_that) {
case _Requirement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Requirement value)?  $default,){
final _that = this;
switch (_that) {
case _Requirement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  RequirementType type,  Localized label,  String? key, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  RequirementOperator? operator,  Object? value, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Cefr? cefr,  Money? money,  String? evidenceDocType,  int? validityMonths,  Localized? howToMeet,  List<ProviderType> providerTypes,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Requirement() when $default != null:
return $default(_that.id,_that.type,_that.label,_that.key,_that.operator,_that.value,_that.cefr,_that.money,_that.evidenceDocType,_that.validityMonths,_that.howToMeet,_that.providerTypes,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  RequirementType type,  Localized label,  String? key, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  RequirementOperator? operator,  Object? value, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Cefr? cefr,  Money? money,  String? evidenceDocType,  int? validityMonths,  Localized? howToMeet,  List<ProviderType> providerTypes,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _Requirement():
return $default(_that.id,_that.type,_that.label,_that.key,_that.operator,_that.value,_that.cefr,_that.money,_that.evidenceDocType,_that.validityMonths,_that.howToMeet,_that.providerTypes,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  RequirementType type,  Localized label,  String? key, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  RequirementOperator? operator,  Object? value, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Cefr? cefr,  Money? money,  String? evidenceDocType,  int? validityMonths,  Localized? howToMeet,  List<ProviderType> providerTypes,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _Requirement() when $default != null:
return $default(_that.id,_that.type,_that.label,_that.key,_that.operator,_that.value,_that.cefr,_that.money,_that.evidenceDocType,_that.validityMonths,_that.howToMeet,_that.providerTypes,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Requirement implements Requirement {
  const _Requirement({required this.id, required this.type, required this.label, this.key, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.operator, this.value, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.cefr, this.money, this.evidenceDocType, this.validityMonths, this.howToMeet,  List<ProviderType> providerTypes = const [], required this.provenance}): _providerTypes = providerTypes;
  factory _Requirement.fromJson(Map<String, dynamic> json) => _$RequirementFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  RequirementType type;
@override final  Localized label;
/// Machine key matched against profile facts, e.g. language.en.ielts
@override final  String? key;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  RequirementOperator? operator;
@override final  Object? value;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  Cefr? cefr;
@override final  Money? money;
/// documents/{type} that proves it, e.g. ielts_certificate
@override final  String? evidenceDocType;
@override final  int? validityMonths;
@override final  Localized? howToMeet;
/// Which provider types can help meet it
 final  List<ProviderType> _providerTypes;
/// Which provider types can help meet it
@override@JsonKey() List<ProviderType> get providerTypes {
  if (_providerTypes is EqualUnmodifiableListView) return _providerTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_providerTypes);
}

@override final  Provenance provenance;

/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RequirementCopyWith<_Requirement> get copyWith => __$RequirementCopyWithImpl<_Requirement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RequirementToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Requirement&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.label, label) || other.label == label)&&(identical(other.key, key) || other.key == key)&&(identical(other.operator, operator) || other.operator == operator)&&const DeepCollectionEquality().equals(other.value, value)&&(identical(other.cefr, cefr) || other.cefr == cefr)&&(identical(other.money, money) || other.money == money)&&(identical(other.evidenceDocType, evidenceDocType) || other.evidenceDocType == evidenceDocType)&&(identical(other.validityMonths, validityMonths) || other.validityMonths == validityMonths)&&(identical(other.howToMeet, howToMeet) || other.howToMeet == howToMeet)&&const DeepCollectionEquality().equals(other.providerTypes, _providerTypes)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,label,key,operator,const DeepCollectionEquality().hash(value),cefr,money,evidenceDocType,validityMonths,howToMeet,const DeepCollectionEquality().hash(_providerTypes),provenance);
}

@override
String toString() {
    return 'Requirement(id: $id, type: $type, label: $label, key: $key, operator: $operator, value: $value, cefr: $cefr, money: $money, evidenceDocType: $evidenceDocType, validityMonths: $validityMonths, howToMeet: $howToMeet, providerTypes: $providerTypes, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$RequirementCopyWith<$Res> implements $RequirementCopyWith<$Res> {
  factory _$RequirementCopyWith(_Requirement value, $Res Function(_Requirement) _then) = __$RequirementCopyWithImpl;
@override @useResult
$Res call({
 String id, RequirementType type, Localized label, String? key,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) RequirementOperator? operator, Object? value,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Cefr? cefr, Money? money, String? evidenceDocType, int? validityMonths, Localized? howToMeet, List<ProviderType> providerTypes, Provenance provenance
});


@override $LocalizedCopyWith<$Res> get label;@override $MoneyCopyWith<$Res>? get money;@override $LocalizedCopyWith<$Res>? get howToMeet;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$RequirementCopyWithImpl<$Res>
    implements _$RequirementCopyWith<$Res> {
  __$RequirementCopyWithImpl(this._self, this._then);

  final _Requirement _self;
  final $Res Function(_Requirement) _then;

/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? label = null,Object? key = freezed,Object? operator = freezed,Object? value = freezed,Object? cefr = freezed,Object? money = freezed,Object? evidenceDocType = freezed,Object? validityMonths = freezed,Object? howToMeet = freezed,Object? providerTypes = null,Object? provenance = null,}) {
  return _then(_Requirement(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as RequirementType,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as Localized,key: freezed == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String?,operator: freezed == operator ? _self.operator : operator // ignore: cast_nullable_to_non_nullable
as RequirementOperator?,value: freezed == value ? _self.value : value ,cefr: freezed == cefr ? _self.cefr : cefr // ignore: cast_nullable_to_non_nullable
as Cefr?,money: freezed == money ? _self.money : money // ignore: cast_nullable_to_non_nullable
as Money?,evidenceDocType: freezed == evidenceDocType ? _self.evidenceDocType : evidenceDocType // ignore: cast_nullable_to_non_nullable
as String?,validityMonths: freezed == validityMonths ? _self.validityMonths : validityMonths // ignore: cast_nullable_to_non_nullable
as int?,howToMeet: freezed == howToMeet ? _self.howToMeet : howToMeet // ignore: cast_nullable_to_non_nullable
as Localized?,providerTypes: null == providerTypes ? _self._providerTypes : providerTypes // ignore: cast_nullable_to_non_nullable
as List<ProviderType>,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get label {
  
  return $LocalizedCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get money {
    if (_self.money == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.money!, (value) {
    return _then(_self.copyWith(money: value));
  });
}/// Create a copy of Requirement
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get howToMeet {
    if (_self.howToMeet == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.howToMeet!, (value) {
    return _then(_self.copyWith(howToMeet: value));
  });
}/// Create a copy of Requirement
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
