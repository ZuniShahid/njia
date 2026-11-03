// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Provenance {

/// sources/{id}
 String get sourceId; String? get sourceUrl;/// Verbatim text from the source that supports the value (max 400 chars).
 String? get quote; ProvenanceTrust get trust; String get fetchedAt;/// Last human approval. null = never approved by a human.
 String? get verifiedAt;/// users/{uid} of the reviewer
 String? get verifiedBy;/// Date after which the value must be re-checked (e.g. end of scholarship round).
 String? get validUntil; String? get changeRequestId;
/// Create a copy of Provenance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<Provenance> get copyWith => _$ProvenanceCopyWithImpl<Provenance>(this as Provenance, _$identity);

  /// Serializes this Provenance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Provenance;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Provenance&&(identical(other.sourceId, _this.sourceId) || other.sourceId == _this.sourceId)&&(identical(other.sourceUrl, _this.sourceUrl) || other.sourceUrl == _this.sourceUrl)&&(identical(other.quote, _this.quote) || other.quote == _this.quote)&&(identical(other.trust, _this.trust) || other.trust == _this.trust)&&(identical(other.fetchedAt, _this.fetchedAt) || other.fetchedAt == _this.fetchedAt)&&(identical(other.verifiedAt, _this.verifiedAt) || other.verifiedAt == _this.verifiedAt)&&(identical(other.verifiedBy, _this.verifiedBy) || other.verifiedBy == _this.verifiedBy)&&(identical(other.validUntil, _this.validUntil) || other.validUntil == _this.validUntil)&&(identical(other.changeRequestId, _this.changeRequestId) || other.changeRequestId == _this.changeRequestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Provenance;
  return Object.hash(runtimeType,_this.sourceId,_this.sourceUrl,_this.quote,_this.trust,_this.fetchedAt,_this.verifiedAt,_this.verifiedBy,_this.validUntil,_this.changeRequestId);
}

@override
String toString() {
  final _this = this as Provenance;
  return 'Provenance(sourceId: ${_this.sourceId}, sourceUrl: ${_this.sourceUrl}, quote: ${_this.quote}, trust: ${_this.trust}, fetchedAt: ${_this.fetchedAt}, verifiedAt: ${_this.verifiedAt}, verifiedBy: ${_this.verifiedBy}, validUntil: ${_this.validUntil}, changeRequestId: ${_this.changeRequestId})';
}


}

/// @nodoc
abstract mixin class $ProvenanceCopyWith<$Res>  {
  factory $ProvenanceCopyWith(Provenance value, $Res Function(Provenance) _then) = _$ProvenanceCopyWithImpl;
@useResult
$Res call({
 String sourceId, String? sourceUrl, String? quote, ProvenanceTrust trust, String fetchedAt, String? verifiedAt, String? verifiedBy, String? validUntil, String? changeRequestId
});




}
/// @nodoc
class _$ProvenanceCopyWithImpl<$Res>
    implements $ProvenanceCopyWith<$Res> {
  _$ProvenanceCopyWithImpl(this._self, this._then);

  final Provenance _self;
  final $Res Function(Provenance) _then;

/// Create a copy of Provenance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sourceId = null,Object? sourceUrl = freezed,Object? quote = freezed,Object? trust = null,Object? fetchedAt = null,Object? verifiedAt = freezed,Object? verifiedBy = freezed,Object? validUntil = freezed,Object? changeRequestId = freezed,}) {
  return _then(Provenance(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,trust: null == trust ? _self.trust : trust // ignore: cast_nullable_to_non_nullable
as ProvenanceTrust,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,changeRequestId: freezed == changeRequestId ? _self.changeRequestId : changeRequestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Provenance].
extension ProvenancePatterns on Provenance {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Provenance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Provenance() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Provenance value)  $default,){
final _that = this;
switch (_that) {
case _Provenance():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Provenance value)?  $default,){
final _that = this;
switch (_that) {
case _Provenance() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sourceId,  String? sourceUrl,  String? quote,  ProvenanceTrust trust,  String fetchedAt,  String? verifiedAt,  String? verifiedBy,  String? validUntil,  String? changeRequestId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Provenance() when $default != null:
return $default(_that.sourceId,_that.sourceUrl,_that.quote,_that.trust,_that.fetchedAt,_that.verifiedAt,_that.verifiedBy,_that.validUntil,_that.changeRequestId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sourceId,  String? sourceUrl,  String? quote,  ProvenanceTrust trust,  String fetchedAt,  String? verifiedAt,  String? verifiedBy,  String? validUntil,  String? changeRequestId)  $default,) {final _that = this;
switch (_that) {
case _Provenance():
return $default(_that.sourceId,_that.sourceUrl,_that.quote,_that.trust,_that.fetchedAt,_that.verifiedAt,_that.verifiedBy,_that.validUntil,_that.changeRequestId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sourceId,  String? sourceUrl,  String? quote,  ProvenanceTrust trust,  String fetchedAt,  String? verifiedAt,  String? verifiedBy,  String? validUntil,  String? changeRequestId)?  $default,) {final _that = this;
switch (_that) {
case _Provenance() when $default != null:
return $default(_that.sourceId,_that.sourceUrl,_that.quote,_that.trust,_that.fetchedAt,_that.verifiedAt,_that.verifiedBy,_that.validUntil,_that.changeRequestId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Provenance implements Provenance {
  const _Provenance({required this.sourceId, this.sourceUrl, this.quote, required this.trust, required this.fetchedAt, this.verifiedAt, this.verifiedBy, this.validUntil, this.changeRequestId});
  factory _Provenance.fromJson(Map<String, dynamic> json) => _$ProvenanceFromJson(json);

/// sources/{id}
@override final  String sourceId;
@override final  String? sourceUrl;
/// Verbatim text from the source that supports the value (max 400 chars).
@override final  String? quote;
@override final  ProvenanceTrust trust;
@override final  String fetchedAt;
/// Last human approval. null = never approved by a human.
@override final  String? verifiedAt;
/// users/{uid} of the reviewer
@override final  String? verifiedBy;
/// Date after which the value must be re-checked (e.g. end of scholarship round).
@override final  String? validUntil;
@override final  String? changeRequestId;

/// Create a copy of Provenance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProvenanceCopyWith<_Provenance> get copyWith => __$ProvenanceCopyWithImpl<_Provenance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProvenanceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Provenance&&(identical(other.sourceId, sourceId) || other.sourceId == sourceId)&&(identical(other.sourceUrl, sourceUrl) || other.sourceUrl == sourceUrl)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.trust, trust) || other.trust == trust)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt)&&(identical(other.verifiedBy, verifiedBy) || other.verifiedBy == verifiedBy)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.changeRequestId, changeRequestId) || other.changeRequestId == changeRequestId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,sourceId,sourceUrl,quote,trust,fetchedAt,verifiedAt,verifiedBy,validUntil,changeRequestId);
}

@override
String toString() {
    return 'Provenance(sourceId: $sourceId, sourceUrl: $sourceUrl, quote: $quote, trust: $trust, fetchedAt: $fetchedAt, verifiedAt: $verifiedAt, verifiedBy: $verifiedBy, validUntil: $validUntil, changeRequestId: $changeRequestId)';
}


}

/// @nodoc
abstract mixin class _$ProvenanceCopyWith<$Res> implements $ProvenanceCopyWith<$Res> {
  factory _$ProvenanceCopyWith(_Provenance value, $Res Function(_Provenance) _then) = __$ProvenanceCopyWithImpl;
@override @useResult
$Res call({
 String sourceId, String? sourceUrl, String? quote, ProvenanceTrust trust, String fetchedAt, String? verifiedAt, String? verifiedBy, String? validUntil, String? changeRequestId
});




}
/// @nodoc
class __$ProvenanceCopyWithImpl<$Res>
    implements _$ProvenanceCopyWith<$Res> {
  __$ProvenanceCopyWithImpl(this._self, this._then);

  final _Provenance _self;
  final $Res Function(_Provenance) _then;

/// Create a copy of Provenance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sourceId = null,Object? sourceUrl = freezed,Object? quote = freezed,Object? trust = null,Object? fetchedAt = null,Object? verifiedAt = freezed,Object? verifiedBy = freezed,Object? validUntil = freezed,Object? changeRequestId = freezed,}) {
  return _then(_Provenance(
sourceId: null == sourceId ? _self.sourceId : sourceId // ignore: cast_nullable_to_non_nullable
as String,sourceUrl: freezed == sourceUrl ? _self.sourceUrl : sourceUrl // ignore: cast_nullable_to_non_nullable
as String?,quote: freezed == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String?,trust: null == trust ? _self.trust : trust // ignore: cast_nullable_to_non_nullable
as ProvenanceTrust,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedBy: freezed == verifiedBy ? _self.verifiedBy : verifiedBy // ignore: cast_nullable_to_non_nullable
as String?,validUntil: freezed == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String?,changeRequestId: freezed == changeRequestId ? _self.changeRequestId : changeRequestId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Money {

 double get amount;/// ISO 4217
 String get currency;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? get period;
/// Create a copy of Money
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyCopyWith<Money> get copyWith => _$MoneyCopyWithImpl<Money>(this as Money, _$identity);

  /// Serializes this Money to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Money;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Money&&(identical(other.amount, _this.amount) || other.amount == _this.amount)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.period, _this.period) || other.period == _this.period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Money;
  return Object.hash(runtimeType,_this.amount,_this.currency,_this.period);
}

@override
String toString() {
  final _this = this as Money;
  return 'Money(amount: ${_this.amount}, currency: ${_this.currency}, period: ${_this.period})';
}


}

/// @nodoc
abstract mixin class $MoneyCopyWith<$Res>  {
  factory $MoneyCopyWith(Money value, $Res Function(Money) _then) = _$MoneyCopyWithImpl;
@useResult
$Res call({
 double amount, String currency,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? period
});




}
/// @nodoc
class _$MoneyCopyWithImpl<$Res>
    implements $MoneyCopyWith<$Res> {
  _$MoneyCopyWithImpl(this._self, this._then);

  final Money _self;
  final $Res Function(Money) _then;

/// Create a copy of Money
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? amount = null,Object? currency = null,Object? period = freezed,}) {
  return _then(Money(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as MoneyPeriod?,
  ));
}

}


/// Adds pattern-matching-related methods to [Money].
extension MoneyPatterns on Money {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Money value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Money() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Money value)  $default,){
final _that = this;
switch (_that) {
case _Money():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Money value)?  $default,){
final _that = this;
switch (_that) {
case _Money() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double amount,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Money() when $default != null:
return $default(_that.amount,_that.currency,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double amount,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)  $default,) {final _that = this;
switch (_that) {
case _Money():
return $default(_that.amount,_that.currency,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double amount,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)?  $default,) {final _that = this;
switch (_that) {
case _Money() when $default != null:
return $default(_that.amount,_that.currency,_that.period);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Money implements Money {
  const _Money({required this.amount, required this.currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.period});
  factory _Money.fromJson(Map<String, dynamic> json) => _$MoneyFromJson(json);

@override final  double amount;
/// ISO 4217
@override final  String currency;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  MoneyPeriod? period;

/// Create a copy of Money
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoneyCopyWith<_Money> get copyWith => __$MoneyCopyWithImpl<_Money>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoneyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Money&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,amount,currency,period);
}

@override
String toString() {
    return 'Money(amount: $amount, currency: $currency, period: $period)';
}


}

/// @nodoc
abstract mixin class _$MoneyCopyWith<$Res> implements $MoneyCopyWith<$Res> {
  factory _$MoneyCopyWith(_Money value, $Res Function(_Money) _then) = __$MoneyCopyWithImpl;
@override @useResult
$Res call({
 double amount, String currency,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? period
});




}
/// @nodoc
class __$MoneyCopyWithImpl<$Res>
    implements _$MoneyCopyWith<$Res> {
  __$MoneyCopyWithImpl(this._self, this._then);

  final _Money _self;
  final $Res Function(_Money) _then;

/// Create a copy of Money
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? amount = null,Object? currency = null,Object? period = freezed,}) {
  return _then(_Money(
amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as MoneyPeriod?,
  ));
}


}


/// @nodoc
mixin _$MoneyRange {

 double get min; double get max; String get currency;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? get period;
/// Create a copy of MoneyRange
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoneyRangeCopyWith<MoneyRange> get copyWith => _$MoneyRangeCopyWithImpl<MoneyRange>(this as MoneyRange, _$identity);

  /// Serializes this MoneyRange to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MoneyRange;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoneyRange&&(identical(other.min, _this.min) || other.min == _this.min)&&(identical(other.max, _this.max) || other.max == _this.max)&&(identical(other.currency, _this.currency) || other.currency == _this.currency)&&(identical(other.period, _this.period) || other.period == _this.period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MoneyRange;
  return Object.hash(runtimeType,_this.min,_this.max,_this.currency,_this.period);
}

@override
String toString() {
  final _this = this as MoneyRange;
  return 'MoneyRange(min: ${_this.min}, max: ${_this.max}, currency: ${_this.currency}, period: ${_this.period})';
}


}

/// @nodoc
abstract mixin class $MoneyRangeCopyWith<$Res>  {
  factory $MoneyRangeCopyWith(MoneyRange value, $Res Function(MoneyRange) _then) = _$MoneyRangeCopyWithImpl;
@useResult
$Res call({
 double min, double max, String currency,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? period
});




}
/// @nodoc
class _$MoneyRangeCopyWithImpl<$Res>
    implements $MoneyRangeCopyWith<$Res> {
  _$MoneyRangeCopyWithImpl(this._self, this._then);

  final MoneyRange _self;
  final $Res Function(MoneyRange) _then;

/// Create a copy of MoneyRange
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,Object? currency = null,Object? period = freezed,}) {
  return _then(MoneyRange(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as MoneyPeriod?,
  ));
}

}


/// Adds pattern-matching-related methods to [MoneyRange].
extension MoneyRangePatterns on MoneyRange {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoneyRange value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoneyRange() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoneyRange value)  $default,){
final _that = this;
switch (_that) {
case _MoneyRange():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoneyRange value)?  $default,){
final _that = this;
switch (_that) {
case _MoneyRange() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double min,  double max,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoneyRange() when $default != null:
return $default(_that.min,_that.max,_that.currency,_that.period);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double min,  double max,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)  $default,) {final _that = this;
switch (_that) {
case _MoneyRange():
return $default(_that.min,_that.max,_that.currency,_that.period);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double min,  double max,  String currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  MoneyPeriod? period)?  $default,) {final _that = this;
switch (_that) {
case _MoneyRange() when $default != null:
return $default(_that.min,_that.max,_that.currency,_that.period);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoneyRange implements MoneyRange {
  const _MoneyRange({required this.min, required this.max, required this.currency, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.period});
  factory _MoneyRange.fromJson(Map<String, dynamic> json) => _$MoneyRangeFromJson(json);

@override final  double min;
@override final  double max;
@override final  String currency;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  MoneyPeriod? period;

/// Create a copy of MoneyRange
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoneyRangeCopyWith<_MoneyRange> get copyWith => __$MoneyRangeCopyWithImpl<_MoneyRange>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoneyRangeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoneyRange&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.period, period) || other.period == period));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,min,max,currency,period);
}

@override
String toString() {
    return 'MoneyRange(min: $min, max: $max, currency: $currency, period: $period)';
}


}

/// @nodoc
abstract mixin class _$MoneyRangeCopyWith<$Res> implements $MoneyRangeCopyWith<$Res> {
  factory _$MoneyRangeCopyWith(_MoneyRange value, $Res Function(_MoneyRange) _then) = __$MoneyRangeCopyWithImpl;
@override @useResult
$Res call({
 double min, double max, String currency,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) MoneyPeriod? period
});




}
/// @nodoc
class __$MoneyRangeCopyWithImpl<$Res>
    implements _$MoneyRangeCopyWith<$Res> {
  __$MoneyRangeCopyWithImpl(this._self, this._then);

  final _MoneyRange _self;
  final $Res Function(_MoneyRange) _then;

/// Create a copy of MoneyRange
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,Object? currency = null,Object? period = freezed,}) {
  return _then(_MoneyRange(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,period: freezed == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as MoneyPeriod?,
  ));
}


}


/// @nodoc
mixin _$Localized {

 String get en;
/// Create a copy of Localized
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizedCopyWith<Localized> get copyWith => _$LocalizedCopyWithImpl<Localized>(this as Localized, _$identity);

  /// Serializes this Localized to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Localized;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Localized&&(identical(other.en, _this.en) || other.en == _this.en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Localized;
  return Object.hash(runtimeType,_this.en);
}

@override
String toString() {
  final _this = this as Localized;
  return 'Localized(en: ${_this.en})';
}


}

/// @nodoc
abstract mixin class $LocalizedCopyWith<$Res>  {
  factory $LocalizedCopyWith(Localized value, $Res Function(Localized) _then) = _$LocalizedCopyWithImpl;
@useResult
$Res call({
 String en
});




}
/// @nodoc
class _$LocalizedCopyWithImpl<$Res>
    implements $LocalizedCopyWith<$Res> {
  _$LocalizedCopyWithImpl(this._self, this._then);

  final Localized _self;
  final $Res Function(Localized) _then;

/// Create a copy of Localized
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? en = null,}) {
  return _then(Localized(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Localized].
extension LocalizedPatterns on Localized {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Localized value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Localized() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Localized value)  $default,){
final _that = this;
switch (_that) {
case _Localized():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Localized value)?  $default,){
final _that = this;
switch (_that) {
case _Localized() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String en)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Localized() when $default != null:
return $default(_that.en);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String en)  $default,) {final _that = this;
switch (_that) {
case _Localized():
return $default(_that.en);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String en)?  $default,) {final _that = this;
switch (_that) {
case _Localized() when $default != null:
return $default(_that.en);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Localized implements Localized {
  const _Localized({required this.en});
  factory _Localized.fromJson(Map<String, dynamic> json) => _$LocalizedFromJson(json);

@override final  String en;

/// Create a copy of Localized
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizedCopyWith<_Localized> get copyWith => __$LocalizedCopyWithImpl<_Localized>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizedToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Localized&&(identical(other.en, en) || other.en == en));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,en);
}

@override
String toString() {
    return 'Localized(en: $en)';
}


}

/// @nodoc
abstract mixin class _$LocalizedCopyWith<$Res> implements $LocalizedCopyWith<$Res> {
  factory _$LocalizedCopyWith(_Localized value, $Res Function(_Localized) _then) = __$LocalizedCopyWithImpl;
@override @useResult
$Res call({
 String en
});




}
/// @nodoc
class __$LocalizedCopyWithImpl<$Res>
    implements _$LocalizedCopyWith<$Res> {
  __$LocalizedCopyWithImpl(this._self, this._then);

  final _Localized _self;
  final $Res Function(_Localized) _then;

/// Create a copy of Localized
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? en = null,}) {
  return _then(_Localized(
en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
