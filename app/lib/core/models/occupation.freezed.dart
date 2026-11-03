// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'occupation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalaryBand {

 String get countryId; String? get region;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) SalaryBandLevel? get level; double? get p25; double? get median; double? get p75; String get currency;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) SalaryBandPeriod? get period; Provenance? get provenance;
/// Create a copy of SalaryBand
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalaryBandCopyWith<SalaryBand> get copyWith => _$SalaryBandCopyWithImpl<SalaryBand>(this as SalaryBand, _$identity);

  /// Serializes this SalaryBand to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SalaryBand;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalaryBand&&(identical(other.countryId, _this.countryId) || other.countryId == _this.countryId)&&(identical(other.region, _this.region) || other.region == _this.region)&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.p25, _this.p25) || other.p25 == _this.p25)&&(identical(other.median, _this.median) || other.median == _this.median)&&(identical(other.p75, _this.p75) || other.p75 == _this.p75)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SalaryBand;
  return Object.hash(runtimeType,_this.countryId,_this.region,_this.level,_this.p25,_this.median,_this.p75,_this.currency,_this.period,_this.provenance);
}

@override
String toString() {
  final _this = this as SalaryBand;
  return 'SalaryBand(countryId: ${_this.countryId}, region: ${_this.region}, level: ${_this.level}, p25: ${_this.p25}, median: ${_this.median}, p75: ${_this.p75}, currency: ${_this.currency}, period: ${_this.period}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $SalaryBandCopyWith<$Res>  {
  factory $SalaryBandCopyWith(SalaryBand value, $Res Function(SalaryBand) _then) = _$SalaryBandCopyWithImpl;
@useResult
$Res call({
 String countryId, String? region,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) SalaryBandLevel? level, double? p25, double? median, double? p75, String currency,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) SalaryBandPeriod? period, Provenance? provenance
});


$ProvenanceCopyWith<$Res>? get provenance;

}
/// @nodoc
class _$SalaryBandCopyWithImpl<$Res>
    implements $SalaryBandCopyWith<$Res> {
  _$SalaryBandCopyWithImpl(this._self, this._then);

  final SalaryBand _self;
  final $Res Function(SalaryBand) _then;

/// Create a copy of SalaryBand
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countryId = null,Object? region = freezed,Object? level = freezed,Object? p25 = freezed,Object? median = freezed,Object? p75 = freezed,Object? currency = null,Object? period = freezed,Object? provenance = freezed,}) {
  return _then(SalaryBand(
countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as SalaryBandLevel?,p25: freezed == p25 ? _self.p25 : p25 // ignore: cast_nullable_to_non_nullable
as double?,median: freezed == median ? _self.median : median // ignore: cast_nullable_to_non_nullable
as double?,p75: freezed == p75 ? _self.p75 : p75 // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as SalaryBandPeriod?,provenance: freezed == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance?,
  ));
}
/// Create a copy of SalaryBand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res>? get provenance {
    if (_self.provenance == null) {
    return null;
  }

  return $ProvenanceCopyWith<$Res>(_self.provenance!, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [SalaryBand].
extension SalaryBandPatterns on SalaryBand {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalaryBand value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalaryBand() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalaryBand value)  $default,){
final _that = this;
switch (_that) {
case _SalaryBand():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalaryBand value)?  $default,){
final _that = this;
switch (_that) {
case _SalaryBand() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String countryId,  String? region, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  SalaryBandLevel? level,  double? p25,  double? median,  double? p75,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  SalaryBandPeriod? period,  Provenance? provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalaryBand() when $default != null:
return $default(_that.countryId,_that.region,_that.level,_that.p25,_that.median,_that.p75,_that.currency,_that.period,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String countryId,  String? region, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  SalaryBandLevel? level,  double? p25,  double? median,  double? p75,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  SalaryBandPeriod? period,  Provenance? provenance)  $default,) {final _that = this;
switch (_that) {
case _SalaryBand():
return $default(_that.countryId,_that.region,_that.level,_that.p25,_that.median,_that.p75,_that.currency,_that.period,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String countryId,  String? region, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  SalaryBandLevel? level,  double? p25,  double? median,  double? p75,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  SalaryBandPeriod? period,  Provenance? provenance)?  $default,) {final _that = this;
switch (_that) {
case _SalaryBand() when $default != null:
return $default(_that.countryId,_that.region,_that.level,_that.p25,_that.median,_that.p75,_that.currency,_that.period,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalaryBand implements SalaryBand {
  const _SalaryBand({required this.countryId, this.region, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.level, this.p25, this.median, this.p75, required this.currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.period, this.provenance});
  factory _SalaryBand.fromJson(Map<String, dynamic> json) => _$SalaryBandFromJson(json);

@override final  String countryId;
@override final  String? region;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  SalaryBandLevel? level;
@override final  double? p25;
@override final  double? median;
@override final  double? p75;
@override final  String currency;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  SalaryBandPeriod? period;
@override final  Provenance? provenance;

/// Create a copy of SalaryBand
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalaryBandCopyWith<_SalaryBand> get copyWith => __$SalaryBandCopyWithImpl<_SalaryBand>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalaryBandToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalaryBand&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.region, region) || other.region == region)&&(identical(other.level, level) || other.level == level)&&(identical(other.p25, p25) || other.p25 == p25)&&(identical(other.median, median) || other.median == median)&&(identical(other.p75, p75) || other.p75 == p75)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.period, period) || other.period == period)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,countryId,region,level,p25,median,p75,currency,period,provenance);
}

@override
String toString() {
    return 'SalaryBand(countryId: $countryId, region: $region, level: $level, p25: $p25, median: $median, p75: $p75, currency: $currency, period: $period, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$SalaryBandCopyWith<$Res> implements $SalaryBandCopyWith<$Res> {
  factory _$SalaryBandCopyWith(_SalaryBand value, $Res Function(_SalaryBand) _then) = __$SalaryBandCopyWithImpl;
@override @useResult
$Res call({
 String countryId, String? region,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) SalaryBandLevel? level, double? p25, double? median, double? p75, String currency,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) SalaryBandPeriod? period, Provenance? provenance
});


@override $ProvenanceCopyWith<$Res>? get provenance;

}
/// @nodoc
class __$SalaryBandCopyWithImpl<$Res>
    implements _$SalaryBandCopyWith<$Res> {
  __$SalaryBandCopyWithImpl(this._self, this._then);

  final _SalaryBand _self;
  final $Res Function(_SalaryBand) _then;

/// Create a copy of SalaryBand
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countryId = null,Object? region = freezed,Object? level = freezed,Object? p25 = freezed,Object? median = freezed,Object? p75 = freezed,Object? currency = null,Object? period = freezed,Object? provenance = freezed,}) {
  return _then(_SalaryBand(
countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as SalaryBandLevel?,p25: freezed == p25 ? _self.p25 : p25 // ignore: cast_nullable_to_non_nullable
as double?,median: freezed == median ? _self.median : median // ignore: cast_nullable_to_non_nullable
as double?,p75: freezed == p75 ? _self.p75 : p75 // ignore: cast_nullable_to_non_nullable
as double?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as SalaryBandPeriod?,provenance: freezed == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance?,
  ));
}

/// Create a copy of SalaryBand
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res>? get provenance {
    if (_self.provenance == null) {
    return null;
  }

  return $ProvenanceCopyWith<$Res>(_self.provenance!, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// @nodoc
mixin _$ShortageEntry {

 String? get countryId; bool? get listed; String? get listName;
/// Create a copy of ShortageEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShortageEntryCopyWith<ShortageEntry> get copyWith => _$ShortageEntryCopyWithImpl<ShortageEntry>(this as ShortageEntry, _$identity);

  /// Serializes this ShortageEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ShortageEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShortageEntry&&(identical(other.countryId, _this.countryId) || other.countryId == _this.countryId)&&(identical(other.listed, _this.listed) || other.listed == _this.listed)&&(identical(other.listName, _this.listName) || other.listName == _this.listName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ShortageEntry;
  return Object.hash(runtimeType,_this.countryId,_this.listed,_this.listName);
}

@override
String toString() {
  final _this = this as ShortageEntry;
  return 'ShortageEntry(countryId: ${_this.countryId}, listed: ${_this.listed}, listName: ${_this.listName})';
}


}

/// @nodoc
abstract mixin class $ShortageEntryCopyWith<$Res>  {
  factory $ShortageEntryCopyWith(ShortageEntry value, $Res Function(ShortageEntry) _then) = _$ShortageEntryCopyWithImpl;
@useResult
$Res call({
 String? countryId, bool? listed, String? listName
});




}
/// @nodoc
class _$ShortageEntryCopyWithImpl<$Res>
    implements $ShortageEntryCopyWith<$Res> {
  _$ShortageEntryCopyWithImpl(this._self, this._then);

  final ShortageEntry _self;
  final $Res Function(ShortageEntry) _then;

/// Create a copy of ShortageEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countryId = freezed,Object? listed = freezed,Object? listName = freezed,}) {
  return _then(ShortageEntry(
countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,listed: freezed == listed ? _self.listed : listed // ignore: cast_nullable_to_non_nullable
as bool?,listName: freezed == listName ? _self.listName : listName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShortageEntry].
extension ShortageEntryPatterns on ShortageEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShortageEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShortageEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShortageEntry value)  $default,){
final _that = this;
switch (_that) {
case _ShortageEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShortageEntry value)?  $default,){
final _that = this;
switch (_that) {
case _ShortageEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? countryId,  bool? listed,  String? listName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShortageEntry() when $default != null:
return $default(_that.countryId,_that.listed,_that.listName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? countryId,  bool? listed,  String? listName)  $default,) {final _that = this;
switch (_that) {
case _ShortageEntry():
return $default(_that.countryId,_that.listed,_that.listName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? countryId,  bool? listed,  String? listName)?  $default,) {final _that = this;
switch (_that) {
case _ShortageEntry() when $default != null:
return $default(_that.countryId,_that.listed,_that.listName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShortageEntry implements ShortageEntry {
  const _ShortageEntry({this.countryId, this.listed, this.listName});
  factory _ShortageEntry.fromJson(Map<String, dynamic> json) => _$ShortageEntryFromJson(json);

@override final  String? countryId;
@override final  bool? listed;
@override final  String? listName;

/// Create a copy of ShortageEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShortageEntryCopyWith<_ShortageEntry> get copyWith => __$ShortageEntryCopyWithImpl<_ShortageEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShortageEntryToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShortageEntry&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.listed, listed) || other.listed == listed)&&(identical(other.listName, listName) || other.listName == listName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,countryId,listed,listName);
}

@override
String toString() {
    return 'ShortageEntry(countryId: $countryId, listed: $listed, listName: $listName)';
}


}

/// @nodoc
abstract mixin class _$ShortageEntryCopyWith<$Res> implements $ShortageEntryCopyWith<$Res> {
  factory _$ShortageEntryCopyWith(_ShortageEntry value, $Res Function(_ShortageEntry) _then) = __$ShortageEntryCopyWithImpl;
@override @useResult
$Res call({
 String? countryId, bool? listed, String? listName
});




}
/// @nodoc
class __$ShortageEntryCopyWithImpl<$Res>
    implements _$ShortageEntryCopyWith<$Res> {
  __$ShortageEntryCopyWithImpl(this._self, this._then);

  final _ShortageEntry _self;
  final $Res Function(_ShortageEntry) _then;

/// Create a copy of ShortageEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countryId = freezed,Object? listed = freezed,Object? listName = freezed,}) {
  return _then(_ShortageEntry(
countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as String?,listed: freezed == listed ? _self.listed : listed // ignore: cast_nullable_to_non_nullable
as bool?,listName: freezed == listName ? _self.listName : listName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Occupation {

/// Firestore document id.
 String get id; Localized get title; String? get iscoCode; String? get escoUri; List<SalaryBand> get salaryBands; List<ShortageEntry> get shortage; Provenance get provenance;
/// Create a copy of Occupation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OccupationCopyWith<Occupation> get copyWith => _$OccupationCopyWithImpl<Occupation>(this as Occupation, _$identity);

  /// Serializes this Occupation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Occupation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Occupation&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.iscoCode, _this.iscoCode) || other.iscoCode == _this.iscoCode)&&(identical(other.escoUri, _this.escoUri) || other.escoUri == _this.escoUri)&&const DeepCollectionEquality().equals(other.salaryBands, _this.salaryBands)&&const DeepCollectionEquality().equals(other.shortage, _this.shortage)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Occupation;
  return Object.hash(runtimeType,_this.id,_this.title,_this.iscoCode,_this.escoUri,const DeepCollectionEquality().hash(_this.salaryBands),const DeepCollectionEquality().hash(_this.shortage),_this.provenance);
}

@override
String toString() {
  final _this = this as Occupation;
  return 'Occupation(id: ${_this.id}, title: ${_this.title}, iscoCode: ${_this.iscoCode}, escoUri: ${_this.escoUri}, salaryBands: ${_this.salaryBands}, shortage: ${_this.shortage}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $OccupationCopyWith<$Res>  {
  factory $OccupationCopyWith(Occupation value, $Res Function(Occupation) _then) = _$OccupationCopyWithImpl;
@useResult
$Res call({
 String id, Localized title, String? iscoCode, String? escoUri, List<SalaryBand> salaryBands, List<ShortageEntry> shortage, Provenance provenance
});


$LocalizedCopyWith<$Res> get title;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$OccupationCopyWithImpl<$Res>
    implements $OccupationCopyWith<$Res> {
  _$OccupationCopyWithImpl(this._self, this._then);

  final Occupation _self;
  final $Res Function(Occupation) _then;

/// Create a copy of Occupation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? iscoCode = freezed,Object? escoUri = freezed,Object? salaryBands = null,Object? shortage = null,Object? provenance = null,}) {
  return _then(Occupation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Localized,iscoCode: freezed == iscoCode ? _self.iscoCode : iscoCode // ignore: cast_nullable_to_non_nullable
as String?,escoUri: freezed == escoUri ? _self.escoUri : escoUri // ignore: cast_nullable_to_non_nullable
as String?,salaryBands: null == salaryBands ? _self.salaryBands : salaryBands // ignore: cast_nullable_to_non_nullable
as List<SalaryBand>,shortage: null == shortage ? _self.shortage : shortage // ignore: cast_nullable_to_non_nullable
as List<ShortageEntry>,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of Occupation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get title {
  
  return $LocalizedCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Occupation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [Occupation].
extension OccupationPatterns on Occupation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Occupation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Occupation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Occupation value)  $default,){
final _that = this;
switch (_that) {
case _Occupation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Occupation value)?  $default,){
final _that = this;
switch (_that) {
case _Occupation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Localized title,  String? iscoCode,  String? escoUri,  List<SalaryBand> salaryBands,  List<ShortageEntry> shortage,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Occupation() when $default != null:
return $default(_that.id,_that.title,_that.iscoCode,_that.escoUri,_that.salaryBands,_that.shortage,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Localized title,  String? iscoCode,  String? escoUri,  List<SalaryBand> salaryBands,  List<ShortageEntry> shortage,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _Occupation():
return $default(_that.id,_that.title,_that.iscoCode,_that.escoUri,_that.salaryBands,_that.shortage,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Localized title,  String? iscoCode,  String? escoUri,  List<SalaryBand> salaryBands,  List<ShortageEntry> shortage,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _Occupation() when $default != null:
return $default(_that.id,_that.title,_that.iscoCode,_that.escoUri,_that.salaryBands,_that.shortage,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Occupation implements Occupation {
  const _Occupation({required this.id, required this.title, this.iscoCode, this.escoUri,  List<SalaryBand> salaryBands = const [],  List<ShortageEntry> shortage = const [], required this.provenance}): _salaryBands = salaryBands,_shortage = shortage;
  factory _Occupation.fromJson(Map<String, dynamic> json) => _$OccupationFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  Localized title;
@override final  String? iscoCode;
@override final  String? escoUri;
 final  List<SalaryBand> _salaryBands;
@override@JsonKey() List<SalaryBand> get salaryBands {
  if (_salaryBands is EqualUnmodifiableListView) return _salaryBands;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_salaryBands);
}

 final  List<ShortageEntry> _shortage;
@override@JsonKey() List<ShortageEntry> get shortage {
  if (_shortage is EqualUnmodifiableListView) return _shortage;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shortage);
}

@override final  Provenance provenance;

/// Create a copy of Occupation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OccupationCopyWith<_Occupation> get copyWith => __$OccupationCopyWithImpl<_Occupation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OccupationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Occupation&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.iscoCode, iscoCode) || other.iscoCode == iscoCode)&&(identical(other.escoUri, escoUri) || other.escoUri == escoUri)&&const DeepCollectionEquality().equals(other.salaryBands, _salaryBands)&&const DeepCollectionEquality().equals(other.shortage, _shortage)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,iscoCode,escoUri,const DeepCollectionEquality().hash(_salaryBands),const DeepCollectionEquality().hash(_shortage),provenance);
}

@override
String toString() {
    return 'Occupation(id: $id, title: $title, iscoCode: $iscoCode, escoUri: $escoUri, salaryBands: $salaryBands, shortage: $shortage, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$OccupationCopyWith<$Res> implements $OccupationCopyWith<$Res> {
  factory _$OccupationCopyWith(_Occupation value, $Res Function(_Occupation) _then) = __$OccupationCopyWithImpl;
@override @useResult
$Res call({
 String id, Localized title, String? iscoCode, String? escoUri, List<SalaryBand> salaryBands, List<ShortageEntry> shortage, Provenance provenance
});


@override $LocalizedCopyWith<$Res> get title;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$OccupationCopyWithImpl<$Res>
    implements _$OccupationCopyWith<$Res> {
  __$OccupationCopyWithImpl(this._self, this._then);

  final _Occupation _self;
  final $Res Function(_Occupation) _then;

/// Create a copy of Occupation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? iscoCode = freezed,Object? escoUri = freezed,Object? salaryBands = null,Object? shortage = null,Object? provenance = null,}) {
  return _then(_Occupation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Localized,iscoCode: freezed == iscoCode ? _self.iscoCode : iscoCode // ignore: cast_nullable_to_non_nullable
as String?,escoUri: freezed == escoUri ? _self.escoUri : escoUri // ignore: cast_nullable_to_non_nullable
as String?,salaryBands: null == salaryBands ? _self._salaryBands : salaryBands // ignore: cast_nullable_to_non_nullable
as List<SalaryBand>,shortage: null == shortage ? _self._shortage : shortage // ignore: cast_nullable_to_non_nullable
as List<ShortageEntry>,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of Occupation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get title {
  
  return $LocalizedCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of Occupation
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
