// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pathway.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Pathway {

/// Firestore document id.
 String get id; PathwayType get type; String get title; String? get institution; String? get institutionId; String get countryId; String? get city;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Isced? get isced;/// ISCED-F 2013 broad field code, e.g. 041 business
 String? get field; String? get languageOfInstruction; int? get durationMonths;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PathwayMode? get mode; MoneyRange? get tuition; List<String> get intakes; String? get applicationDeadline; List<String> get requirementIds; List<String> get fundingIds; List<String> get leadsToOccupationIds; List<String> get unlocksPermitIds; String? get url;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PathwayStatus? get status; Provenance get provenance;
/// Create a copy of Pathway
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PathwayCopyWith<Pathway> get copyWith => _$PathwayCopyWithImpl<Pathway>(this as Pathway, _$identity);

  /// Serializes this Pathway to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Pathway;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Pathway&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.institution, _this.institution) || other.institution == _this.institution)&&(identical(other.institutionId, _this.institutionId) || other.institutionId == _this.institutionId)&&(identical(other.countryId, _this.countryId) || other.countryId == _this.countryId)&&(identical(other.city, _this.city) || other.city == _this.city)&&(identical(other.isced, _this.isced) || other.isced == _this.isced)&&(identical(other.field, _this.field) || other.field == _this.field)&&(identical(other.languageOfInstruction, _this.languageOfInstruction) || other.languageOfInstruction == _this.languageOfInstruction)&&(identical(other.durationMonths, _this.durationMonths) || other.durationMonths == _this.durationMonths)&&(identical(other.mode, _this.mode) || other.mode == _this.mode)&&(identical(other.tuition, _this.tuition) || other.tuition == _this.tuition)&&const DeepCollectionEquality().equals(other.intakes, _this.intakes)&&(identical(other.applicationDeadline, _this.applicationDeadline) || other.applicationDeadline == _this.applicationDeadline)&&const DeepCollectionEquality().equals(other.requirementIds, _this.requirementIds)&&const DeepCollectionEquality().equals(other.fundingIds, _this.fundingIds)&&const DeepCollectionEquality().equals(other.leadsToOccupationIds, _this.leadsToOccupationIds)&&const DeepCollectionEquality().equals(other.unlocksPermitIds, _this.unlocksPermitIds)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Pathway;
  return Object.hashAll([runtimeType,_this.id,_this.type,_this.title,_this.institution,_this.institutionId,_this.countryId,_this.city,_this.isced,_this.field,_this.languageOfInstruction,_this.durationMonths,_this.mode,_this.tuition,const DeepCollectionEquality().hash(_this.intakes),_this.applicationDeadline,const DeepCollectionEquality().hash(_this.requirementIds),const DeepCollectionEquality().hash(_this.fundingIds),const DeepCollectionEquality().hash(_this.leadsToOccupationIds),const DeepCollectionEquality().hash(_this.unlocksPermitIds),_this.url,_this.status,_this.provenance]);
}

@override
String toString() {
  final _this = this as Pathway;
  return 'Pathway(id: ${_this.id}, type: ${_this.type}, title: ${_this.title}, institution: ${_this.institution}, institutionId: ${_this.institutionId}, countryId: ${_this.countryId}, city: ${_this.city}, isced: ${_this.isced}, field: ${_this.field}, languageOfInstruction: ${_this.languageOfInstruction}, durationMonths: ${_this.durationMonths}, mode: ${_this.mode}, tuition: ${_this.tuition}, intakes: ${_this.intakes}, applicationDeadline: ${_this.applicationDeadline}, requirementIds: ${_this.requirementIds}, fundingIds: ${_this.fundingIds}, leadsToOccupationIds: ${_this.leadsToOccupationIds}, unlocksPermitIds: ${_this.unlocksPermitIds}, url: ${_this.url}, status: ${_this.status}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $PathwayCopyWith<$Res>  {
  factory $PathwayCopyWith(Pathway value, $Res Function(Pathway) _then) = _$PathwayCopyWithImpl;
@useResult
$Res call({
 String id, PathwayType type, String title, String? institution, String? institutionId, String countryId, String? city,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Isced? isced, String? field, String? languageOfInstruction, int? durationMonths,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PathwayMode? mode, MoneyRange? tuition, List<String> intakes, String? applicationDeadline, List<String> requirementIds, List<String> fundingIds, List<String> leadsToOccupationIds, List<String> unlocksPermitIds, String? url,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PathwayStatus? status, Provenance provenance
});


$MoneyRangeCopyWith<$Res>? get tuition;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$PathwayCopyWithImpl<$Res>
    implements $PathwayCopyWith<$Res> {
  _$PathwayCopyWithImpl(this._self, this._then);

  final Pathway _self;
  final $Res Function(Pathway) _then;

/// Create a copy of Pathway
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? title = null,Object? institution = freezed,Object? institutionId = freezed,Object? countryId = null,Object? city = freezed,Object? isced = freezed,Object? field = freezed,Object? languageOfInstruction = freezed,Object? durationMonths = freezed,Object? mode = freezed,Object? tuition = freezed,Object? intakes = null,Object? applicationDeadline = freezed,Object? requirementIds = null,Object? fundingIds = null,Object? leadsToOccupationIds = null,Object? unlocksPermitIds = null,Object? url = freezed,Object? status = freezed,Object? provenance = null,}) {
  return _then(Pathway(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PathwayType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,institutionId: freezed == institutionId ? _self.institutionId : institutionId // ignore: cast_nullable_to_non_nullable
as String?,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,isced: freezed == isced ? _self.isced : isced // ignore: cast_nullable_to_non_nullable
as Isced?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,languageOfInstruction: freezed == languageOfInstruction ? _self.languageOfInstruction : languageOfInstruction // ignore: cast_nullable_to_non_nullable
as String?,durationMonths: freezed == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PathwayMode?,tuition: freezed == tuition ? _self.tuition : tuition // ignore: cast_nullable_to_non_nullable
as MoneyRange?,intakes: null == intakes ? _self.intakes : intakes // ignore: cast_nullable_to_non_nullable
as List<String>,applicationDeadline: freezed == applicationDeadline ? _self.applicationDeadline : applicationDeadline // ignore: cast_nullable_to_non_nullable
as String?,requirementIds: null == requirementIds ? _self.requirementIds : requirementIds // ignore: cast_nullable_to_non_nullable
as List<String>,fundingIds: null == fundingIds ? _self.fundingIds : fundingIds // ignore: cast_nullable_to_non_nullable
as List<String>,leadsToOccupationIds: null == leadsToOccupationIds ? _self.leadsToOccupationIds : leadsToOccupationIds // ignore: cast_nullable_to_non_nullable
as List<String>,unlocksPermitIds: null == unlocksPermitIds ? _self.unlocksPermitIds : unlocksPermitIds // ignore: cast_nullable_to_non_nullable
as List<String>,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PathwayStatus?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of Pathway
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get tuition {
    if (_self.tuition == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.tuition!, (value) {
    return _then(_self.copyWith(tuition: value));
  });
}/// Create a copy of Pathway
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [Pathway].
extension PathwayPatterns on Pathway {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Pathway value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Pathway() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Pathway value)  $default,){
final _that = this;
switch (_that) {
case _Pathway():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Pathway value)?  $default,){
final _that = this;
switch (_that) {
case _Pathway() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  PathwayType type,  String title,  String? institution,  String? institutionId,  String countryId,  String? city, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Isced? isced,  String? field,  String? languageOfInstruction,  int? durationMonths, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PathwayMode? mode,  MoneyRange? tuition,  List<String> intakes,  String? applicationDeadline,  List<String> requirementIds,  List<String> fundingIds,  List<String> leadsToOccupationIds,  List<String> unlocksPermitIds,  String? url, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PathwayStatus? status,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Pathway() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.institution,_that.institutionId,_that.countryId,_that.city,_that.isced,_that.field,_that.languageOfInstruction,_that.durationMonths,_that.mode,_that.tuition,_that.intakes,_that.applicationDeadline,_that.requirementIds,_that.fundingIds,_that.leadsToOccupationIds,_that.unlocksPermitIds,_that.url,_that.status,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  PathwayType type,  String title,  String? institution,  String? institutionId,  String countryId,  String? city, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Isced? isced,  String? field,  String? languageOfInstruction,  int? durationMonths, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PathwayMode? mode,  MoneyRange? tuition,  List<String> intakes,  String? applicationDeadline,  List<String> requirementIds,  List<String> fundingIds,  List<String> leadsToOccupationIds,  List<String> unlocksPermitIds,  String? url, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PathwayStatus? status,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _Pathway():
return $default(_that.id,_that.type,_that.title,_that.institution,_that.institutionId,_that.countryId,_that.city,_that.isced,_that.field,_that.languageOfInstruction,_that.durationMonths,_that.mode,_that.tuition,_that.intakes,_that.applicationDeadline,_that.requirementIds,_that.fundingIds,_that.leadsToOccupationIds,_that.unlocksPermitIds,_that.url,_that.status,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  PathwayType type,  String title,  String? institution,  String? institutionId,  String countryId,  String? city, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  Isced? isced,  String? field,  String? languageOfInstruction,  int? durationMonths, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PathwayMode? mode,  MoneyRange? tuition,  List<String> intakes,  String? applicationDeadline,  List<String> requirementIds,  List<String> fundingIds,  List<String> leadsToOccupationIds,  List<String> unlocksPermitIds,  String? url, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  PathwayStatus? status,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _Pathway() when $default != null:
return $default(_that.id,_that.type,_that.title,_that.institution,_that.institutionId,_that.countryId,_that.city,_that.isced,_that.field,_that.languageOfInstruction,_that.durationMonths,_that.mode,_that.tuition,_that.intakes,_that.applicationDeadline,_that.requirementIds,_that.fundingIds,_that.leadsToOccupationIds,_that.unlocksPermitIds,_that.url,_that.status,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Pathway implements Pathway {
  const _Pathway({required this.id, required this.type, required this.title, this.institution, this.institutionId, required this.countryId, this.city, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.isced, this.field, this.languageOfInstruction, this.durationMonths, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.mode, this.tuition,  List<String> intakes = const [], this.applicationDeadline,  List<String> requirementIds = const [],  List<String> fundingIds = const [],  List<String> leadsToOccupationIds = const [],  List<String> unlocksPermitIds = const [], this.url, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status, required this.provenance}): _intakes = intakes,_requirementIds = requirementIds,_fundingIds = fundingIds,_leadsToOccupationIds = leadsToOccupationIds,_unlocksPermitIds = unlocksPermitIds;
  factory _Pathway.fromJson(Map<String, dynamic> json) => _$PathwayFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  PathwayType type;
@override final  String title;
@override final  String? institution;
@override final  String? institutionId;
@override final  String countryId;
@override final  String? city;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  Isced? isced;
/// ISCED-F 2013 broad field code, e.g. 041 business
@override final  String? field;
@override final  String? languageOfInstruction;
@override final  int? durationMonths;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  PathwayMode? mode;
@override final  MoneyRange? tuition;
 final  List<String> _intakes;
@override@JsonKey() List<String> get intakes {
  if (_intakes is EqualUnmodifiableListView) return _intakes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_intakes);
}

@override final  String? applicationDeadline;
 final  List<String> _requirementIds;
@override@JsonKey() List<String> get requirementIds {
  if (_requirementIds is EqualUnmodifiableListView) return _requirementIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirementIds);
}

 final  List<String> _fundingIds;
@override@JsonKey() List<String> get fundingIds {
  if (_fundingIds is EqualUnmodifiableListView) return _fundingIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fundingIds);
}

 final  List<String> _leadsToOccupationIds;
@override@JsonKey() List<String> get leadsToOccupationIds {
  if (_leadsToOccupationIds is EqualUnmodifiableListView) return _leadsToOccupationIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_leadsToOccupationIds);
}

 final  List<String> _unlocksPermitIds;
@override@JsonKey() List<String> get unlocksPermitIds {
  if (_unlocksPermitIds is EqualUnmodifiableListView) return _unlocksPermitIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unlocksPermitIds);
}

@override final  String? url;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  PathwayStatus? status;
@override final  Provenance provenance;

/// Create a copy of Pathway
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PathwayCopyWith<_Pathway> get copyWith => __$PathwayCopyWithImpl<_Pathway>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PathwayToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Pathway&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.institution, institution) || other.institution == institution)&&(identical(other.institutionId, institutionId) || other.institutionId == institutionId)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.city, city) || other.city == city)&&(identical(other.isced, isced) || other.isced == isced)&&(identical(other.field, field) || other.field == field)&&(identical(other.languageOfInstruction, languageOfInstruction) || other.languageOfInstruction == languageOfInstruction)&&(identical(other.durationMonths, durationMonths) || other.durationMonths == durationMonths)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.tuition, tuition) || other.tuition == tuition)&&const DeepCollectionEquality().equals(other.intakes, _intakes)&&(identical(other.applicationDeadline, applicationDeadline) || other.applicationDeadline == applicationDeadline)&&const DeepCollectionEquality().equals(other.requirementIds, _requirementIds)&&const DeepCollectionEquality().equals(other.fundingIds, _fundingIds)&&const DeepCollectionEquality().equals(other.leadsToOccupationIds, _leadsToOccupationIds)&&const DeepCollectionEquality().equals(other.unlocksPermitIds, _unlocksPermitIds)&&(identical(other.url, url) || other.url == url)&&(identical(other.status, status) || other.status == status)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,type,title,institution,institutionId,countryId,city,isced,field,languageOfInstruction,durationMonths,mode,tuition,const DeepCollectionEquality().hash(_intakes),applicationDeadline,const DeepCollectionEquality().hash(_requirementIds),const DeepCollectionEquality().hash(_fundingIds),const DeepCollectionEquality().hash(_leadsToOccupationIds),const DeepCollectionEquality().hash(_unlocksPermitIds),url,status,provenance]);
}

@override
String toString() {
    return 'Pathway(id: $id, type: $type, title: $title, institution: $institution, institutionId: $institutionId, countryId: $countryId, city: $city, isced: $isced, field: $field, languageOfInstruction: $languageOfInstruction, durationMonths: $durationMonths, mode: $mode, tuition: $tuition, intakes: $intakes, applicationDeadline: $applicationDeadline, requirementIds: $requirementIds, fundingIds: $fundingIds, leadsToOccupationIds: $leadsToOccupationIds, unlocksPermitIds: $unlocksPermitIds, url: $url, status: $status, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$PathwayCopyWith<$Res> implements $PathwayCopyWith<$Res> {
  factory _$PathwayCopyWith(_Pathway value, $Res Function(_Pathway) _then) = __$PathwayCopyWithImpl;
@override @useResult
$Res call({
 String id, PathwayType type, String title, String? institution, String? institutionId, String countryId, String? city,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) Isced? isced, String? field, String? languageOfInstruction, int? durationMonths,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PathwayMode? mode, MoneyRange? tuition, List<String> intakes, String? applicationDeadline, List<String> requirementIds, List<String> fundingIds, List<String> leadsToOccupationIds, List<String> unlocksPermitIds, String? url,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) PathwayStatus? status, Provenance provenance
});


@override $MoneyRangeCopyWith<$Res>? get tuition;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$PathwayCopyWithImpl<$Res>
    implements _$PathwayCopyWith<$Res> {
  __$PathwayCopyWithImpl(this._self, this._then);

  final _Pathway _self;
  final $Res Function(_Pathway) _then;

/// Create a copy of Pathway
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? title = null,Object? institution = freezed,Object? institutionId = freezed,Object? countryId = null,Object? city = freezed,Object? isced = freezed,Object? field = freezed,Object? languageOfInstruction = freezed,Object? durationMonths = freezed,Object? mode = freezed,Object? tuition = freezed,Object? intakes = null,Object? applicationDeadline = freezed,Object? requirementIds = null,Object? fundingIds = null,Object? leadsToOccupationIds = null,Object? unlocksPermitIds = null,Object? url = freezed,Object? status = freezed,Object? provenance = null,}) {
  return _then(_Pathway(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PathwayType,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,institution: freezed == institution ? _self.institution : institution // ignore: cast_nullable_to_non_nullable
as String?,institutionId: freezed == institutionId ? _self.institutionId : institutionId // ignore: cast_nullable_to_non_nullable
as String?,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,isced: freezed == isced ? _self.isced : isced // ignore: cast_nullable_to_non_nullable
as Isced?,field: freezed == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String?,languageOfInstruction: freezed == languageOfInstruction ? _self.languageOfInstruction : languageOfInstruction // ignore: cast_nullable_to_non_nullable
as String?,durationMonths: freezed == durationMonths ? _self.durationMonths : durationMonths // ignore: cast_nullable_to_non_nullable
as int?,mode: freezed == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as PathwayMode?,tuition: freezed == tuition ? _self.tuition : tuition // ignore: cast_nullable_to_non_nullable
as MoneyRange?,intakes: null == intakes ? _self._intakes : intakes // ignore: cast_nullable_to_non_nullable
as List<String>,applicationDeadline: freezed == applicationDeadline ? _self.applicationDeadline : applicationDeadline // ignore: cast_nullable_to_non_nullable
as String?,requirementIds: null == requirementIds ? _self._requirementIds : requirementIds // ignore: cast_nullable_to_non_nullable
as List<String>,fundingIds: null == fundingIds ? _self._fundingIds : fundingIds // ignore: cast_nullable_to_non_nullable
as List<String>,leadsToOccupationIds: null == leadsToOccupationIds ? _self._leadsToOccupationIds : leadsToOccupationIds // ignore: cast_nullable_to_non_nullable
as List<String>,unlocksPermitIds: null == unlocksPermitIds ? _self._unlocksPermitIds : unlocksPermitIds // ignore: cast_nullable_to_non_nullable
as List<String>,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PathwayStatus?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of Pathway
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<$Res>? get tuition {
    if (_self.tuition == null) {
    return null;
  }

  return $MoneyRangeCopyWith<$Res>(_self.tuition!, (value) {
    return _then(_self.copyWith(tuition: value));
  });
}/// Create a copy of Pathway
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
