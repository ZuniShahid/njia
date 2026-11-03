// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProviderRating {

 double? get avg; int? get count;
/// Create a copy of ProviderRating
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderRatingCopyWith<ProviderRating> get copyWith => _$ProviderRatingCopyWithImpl<ProviderRating>(this as ProviderRating, _$identity);

  /// Serializes this ProviderRating to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProviderRating;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderRating&&(identical(other.avg, _this.avg) || other.avg == _this.avg)&&(identical(other.count, _this.count) || other.count == _this.count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProviderRating;
  return Object.hash(runtimeType,_this.avg,_this.count);
}

@override
String toString() {
  final _this = this as ProviderRating;
  return 'ProviderRating(avg: ${_this.avg}, count: ${_this.count})';
}


}

/// @nodoc
abstract mixin class $ProviderRatingCopyWith<$Res>  {
  factory $ProviderRatingCopyWith(ProviderRating value, $Res Function(ProviderRating) _then) = _$ProviderRatingCopyWithImpl;
@useResult
$Res call({
 double? avg, int? count
});




}
/// @nodoc
class _$ProviderRatingCopyWithImpl<$Res>
    implements $ProviderRatingCopyWith<$Res> {
  _$ProviderRatingCopyWithImpl(this._self, this._then);

  final ProviderRating _self;
  final $Res Function(ProviderRating) _then;

/// Create a copy of ProviderRating
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avg = freezed,Object? count = freezed,}) {
  return _then(ProviderRating(
avg: freezed == avg ? _self.avg : avg // ignore: cast_nullable_to_non_nullable
as double?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderRating].
extension ProviderRatingPatterns on ProviderRating {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderRating value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderRating() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderRating value)  $default,){
final _that = this;
switch (_that) {
case _ProviderRating():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderRating value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderRating() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? avg,  int? count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderRating() when $default != null:
return $default(_that.avg,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? avg,  int? count)  $default,) {final _that = this;
switch (_that) {
case _ProviderRating():
return $default(_that.avg,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? avg,  int? count)?  $default,) {final _that = this;
switch (_that) {
case _ProviderRating() when $default != null:
return $default(_that.avg,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderRating implements ProviderRating {
  const _ProviderRating({this.avg, this.count});
  factory _ProviderRating.fromJson(Map<String, dynamic> json) => _$ProviderRatingFromJson(json);

@override final  double? avg;
@override final  int? count;

/// Create a copy of ProviderRating
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderRatingCopyWith<_ProviderRating> get copyWith => __$ProviderRatingCopyWithImpl<_ProviderRating>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderRatingToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderRating&&(identical(other.avg, avg) || other.avg == avg)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,avg,count);
}

@override
String toString() {
    return 'ProviderRating(avg: $avg, count: $count)';
}


}

/// @nodoc
abstract mixin class _$ProviderRatingCopyWith<$Res> implements $ProviderRatingCopyWith<$Res> {
  factory _$ProviderRatingCopyWith(_ProviderRating value, $Res Function(_ProviderRating) _then) = __$ProviderRatingCopyWithImpl;
@override @useResult
$Res call({
 double? avg, int? count
});




}
/// @nodoc
class __$ProviderRatingCopyWithImpl<$Res>
    implements _$ProviderRatingCopyWith<$Res> {
  __$ProviderRatingCopyWithImpl(this._self, this._then);

  final _ProviderRating _self;
  final $Res Function(_ProviderRating) _then;

/// Create a copy of ProviderRating
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avg = freezed,Object? count = freezed,}) {
  return _then(_ProviderRating(
avg: freezed == avg ? _self.avg : avg // ignore: cast_nullable_to_non_nullable
as double?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ProviderContact {

 String? get email; String? get phone; String? get url;
/// Create a copy of ProviderContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProviderContactCopyWith<ProviderContact> get copyWith => _$ProviderContactCopyWithImpl<ProviderContact>(this as ProviderContact, _$identity);

  /// Serializes this ProviderContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProviderContact;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProviderContact&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.url, _this.url) || other.url == _this.url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProviderContact;
  return Object.hash(runtimeType,_this.email,_this.phone,_this.url);
}

@override
String toString() {
  final _this = this as ProviderContact;
  return 'ProviderContact(email: ${_this.email}, phone: ${_this.phone}, url: ${_this.url})';
}


}

/// @nodoc
abstract mixin class $ProviderContactCopyWith<$Res>  {
  factory $ProviderContactCopyWith(ProviderContact value, $Res Function(ProviderContact) _then) = _$ProviderContactCopyWithImpl;
@useResult
$Res call({
 String? email, String? phone, String? url
});




}
/// @nodoc
class _$ProviderContactCopyWithImpl<$Res>
    implements $ProviderContactCopyWith<$Res> {
  _$ProviderContactCopyWithImpl(this._self, this._then);

  final ProviderContact _self;
  final $Res Function(ProviderContact) _then;

/// Create a copy of ProviderContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = freezed,Object? phone = freezed,Object? url = freezed,}) {
  return _then(ProviderContact(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProviderContact].
extension ProviderContactPatterns on ProviderContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProviderContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProviderContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProviderContact value)  $default,){
final _that = this;
switch (_that) {
case _ProviderContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProviderContact value)?  $default,){
final _that = this;
switch (_that) {
case _ProviderContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? email,  String? phone,  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProviderContact() when $default != null:
return $default(_that.email,_that.phone,_that.url);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? email,  String? phone,  String? url)  $default,) {final _that = this;
switch (_that) {
case _ProviderContact():
return $default(_that.email,_that.phone,_that.url);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? email,  String? phone,  String? url)?  $default,) {final _that = this;
switch (_that) {
case _ProviderContact() when $default != null:
return $default(_that.email,_that.phone,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProviderContact implements ProviderContact {
  const _ProviderContact({this.email, this.phone, this.url});
  factory _ProviderContact.fromJson(Map<String, dynamic> json) => _$ProviderContactFromJson(json);

@override final  String? email;
@override final  String? phone;
@override final  String? url;

/// Create a copy of ProviderContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProviderContactCopyWith<_ProviderContact> get copyWith => __$ProviderContactCopyWithImpl<_ProviderContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProviderContactToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProviderContact&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,email,phone,url);
}

@override
String toString() {
    return 'ProviderContact(email: $email, phone: $phone, url: $url)';
}


}

/// @nodoc
abstract mixin class _$ProviderContactCopyWith<$Res> implements $ProviderContactCopyWith<$Res> {
  factory _$ProviderContactCopyWith(_ProviderContact value, $Res Function(_ProviderContact) _then) = __$ProviderContactCopyWithImpl;
@override @useResult
$Res call({
 String? email, String? phone, String? url
});




}
/// @nodoc
class __$ProviderContactCopyWithImpl<$Res>
    implements _$ProviderContactCopyWith<$Res> {
  __$ProviderContactCopyWithImpl(this._self, this._then);

  final _ProviderContact _self;
  final $Res Function(_ProviderContact) _then;

/// Create a copy of ProviderContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = freezed,Object? phone = freezed,Object? url = freezed,}) {
  return _then(_ProviderContact(
email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ServiceProvider {

/// Firestore document id.
 String get id; ProviderType get type; String get name;/// requirement ids they help with, e.g. ielts-6-5
 List<String> get services; List<String> get countryIds; bool? get online; Money? get priceFrom; ServiceProviderVerification get verification; ProviderRating? get rating; ProviderContact? get contact; Provenance get provenance;
/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceProviderCopyWith<ServiceProvider> get copyWith => _$ServiceProviderCopyWithImpl<ServiceProvider>(this as ServiceProvider, _$identity);

  /// Serializes this ServiceProvider to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ServiceProvider;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceProvider&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.services, _this.services)&&const DeepCollectionEquality().equals(other.countryIds, _this.countryIds)&&(identical(other.online, _this.online) || other.online == _this.online)&&(identical(other.priceFrom, _this.priceFrom) || other.priceFrom == _this.priceFrom)&&(identical(other.verification, _this.verification) || other.verification == _this.verification)&&(identical(other.rating, _this.rating) || other.rating == _this.rating)&&(identical(other.contact, _this.contact) || other.contact == _this.contact)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ServiceProvider;
  return Object.hash(runtimeType,_this.id,_this.type,_this.name,const DeepCollectionEquality().hash(_this.services),const DeepCollectionEquality().hash(_this.countryIds),_this.online,_this.priceFrom,_this.verification,_this.rating,_this.contact,_this.provenance);
}

@override
String toString() {
  final _this = this as ServiceProvider;
  return 'ServiceProvider(id: ${_this.id}, type: ${_this.type}, name: ${_this.name}, services: ${_this.services}, countryIds: ${_this.countryIds}, online: ${_this.online}, priceFrom: ${_this.priceFrom}, verification: ${_this.verification}, rating: ${_this.rating}, contact: ${_this.contact}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $ServiceProviderCopyWith<$Res>  {
  factory $ServiceProviderCopyWith(ServiceProvider value, $Res Function(ServiceProvider) _then) = _$ServiceProviderCopyWithImpl;
@useResult
$Res call({
 String id, ProviderType type, String name, List<String> services, List<String> countryIds, bool? online, Money? priceFrom, ServiceProviderVerification verification, ProviderRating? rating, ProviderContact? contact, Provenance provenance
});


$MoneyCopyWith<$Res>? get priceFrom;$ProviderRatingCopyWith<$Res>? get rating;$ProviderContactCopyWith<$Res>? get contact;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$ServiceProviderCopyWithImpl<$Res>
    implements $ServiceProviderCopyWith<$Res> {
  _$ServiceProviderCopyWithImpl(this._self, this._then);

  final ServiceProvider _self;
  final $Res Function(ServiceProvider) _then;

/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? name = null,Object? services = null,Object? countryIds = null,Object? online = freezed,Object? priceFrom = freezed,Object? verification = null,Object? rating = freezed,Object? contact = freezed,Object? provenance = null,}) {
  return _then(ServiceProvider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProviderType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<String>,countryIds: null == countryIds ? _self.countryIds : countryIds // ignore: cast_nullable_to_non_nullable
as List<String>,online: freezed == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool?,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as Money?,verification: null == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as ServiceProviderVerification,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as ProviderRating?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ProviderContact?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get priceFrom {
    if (_self.priceFrom == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.priceFrom!, (value) {
    return _then(_self.copyWith(priceFrom: value));
  });
}/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderRatingCopyWith<$Res>? get rating {
    if (_self.rating == null) {
    return null;
  }

  return $ProviderRatingCopyWith<$Res>(_self.rating!, (value) {
    return _then(_self.copyWith(rating: value));
  });
}/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderContactCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $ProviderContactCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServiceProvider].
extension ServiceProviderPatterns on ServiceProvider {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceProvider value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceProvider() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceProvider value)  $default,){
final _that = this;
switch (_that) {
case _ServiceProvider():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceProvider value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceProvider() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ProviderType type,  String name,  List<String> services,  List<String> countryIds,  bool? online,  Money? priceFrom,  ServiceProviderVerification verification,  ProviderRating? rating,  ProviderContact? contact,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceProvider() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.services,_that.countryIds,_that.online,_that.priceFrom,_that.verification,_that.rating,_that.contact,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ProviderType type,  String name,  List<String> services,  List<String> countryIds,  bool? online,  Money? priceFrom,  ServiceProviderVerification verification,  ProviderRating? rating,  ProviderContact? contact,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _ServiceProvider():
return $default(_that.id,_that.type,_that.name,_that.services,_that.countryIds,_that.online,_that.priceFrom,_that.verification,_that.rating,_that.contact,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ProviderType type,  String name,  List<String> services,  List<String> countryIds,  bool? online,  Money? priceFrom,  ServiceProviderVerification verification,  ProviderRating? rating,  ProviderContact? contact,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _ServiceProvider() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.services,_that.countryIds,_that.online,_that.priceFrom,_that.verification,_that.rating,_that.contact,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceProvider implements ServiceProvider {
  const _ServiceProvider({required this.id, required this.type, required this.name,  List<String> services = const [],  List<String> countryIds = const [], this.online, this.priceFrom, required this.verification, this.rating, this.contact, required this.provenance}): _services = services,_countryIds = countryIds;
  factory _ServiceProvider.fromJson(Map<String, dynamic> json) => _$ServiceProviderFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  ProviderType type;
@override final  String name;
/// requirement ids they help with, e.g. ielts-6-5
 final  List<String> _services;
/// requirement ids they help with, e.g. ielts-6-5
@override@JsonKey() List<String> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

 final  List<String> _countryIds;
@override@JsonKey() List<String> get countryIds {
  if (_countryIds is EqualUnmodifiableListView) return _countryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_countryIds);
}

@override final  bool? online;
@override final  Money? priceFrom;
@override final  ServiceProviderVerification verification;
@override final  ProviderRating? rating;
@override final  ProviderContact? contact;
@override final  Provenance provenance;

/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceProviderCopyWith<_ServiceProvider> get copyWith => __$ServiceProviderCopyWithImpl<_ServiceProvider>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceProviderToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceProvider&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.services, _services)&&const DeepCollectionEquality().equals(other.countryIds, _countryIds)&&(identical(other.online, online) || other.online == online)&&(identical(other.priceFrom, priceFrom) || other.priceFrom == priceFrom)&&(identical(other.verification, verification) || other.verification == verification)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.contact, contact) || other.contact == contact)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,name,const DeepCollectionEquality().hash(_services),const DeepCollectionEquality().hash(_countryIds),online,priceFrom,verification,rating,contact,provenance);
}

@override
String toString() {
    return 'ServiceProvider(id: $id, type: $type, name: $name, services: $services, countryIds: $countryIds, online: $online, priceFrom: $priceFrom, verification: $verification, rating: $rating, contact: $contact, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$ServiceProviderCopyWith<$Res> implements $ServiceProviderCopyWith<$Res> {
  factory _$ServiceProviderCopyWith(_ServiceProvider value, $Res Function(_ServiceProvider) _then) = __$ServiceProviderCopyWithImpl;
@override @useResult
$Res call({
 String id, ProviderType type, String name, List<String> services, List<String> countryIds, bool? online, Money? priceFrom, ServiceProviderVerification verification, ProviderRating? rating, ProviderContact? contact, Provenance provenance
});


@override $MoneyCopyWith<$Res>? get priceFrom;@override $ProviderRatingCopyWith<$Res>? get rating;@override $ProviderContactCopyWith<$Res>? get contact;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$ServiceProviderCopyWithImpl<$Res>
    implements _$ServiceProviderCopyWith<$Res> {
  __$ServiceProviderCopyWithImpl(this._self, this._then);

  final _ServiceProvider _self;
  final $Res Function(_ServiceProvider) _then;

/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? name = null,Object? services = null,Object? countryIds = null,Object? online = freezed,Object? priceFrom = freezed,Object? verification = null,Object? rating = freezed,Object? contact = freezed,Object? provenance = null,}) {
  return _then(_ServiceProvider(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProviderType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<String>,countryIds: null == countryIds ? _self._countryIds : countryIds // ignore: cast_nullable_to_non_nullable
as List<String>,online: freezed == online ? _self.online : online // ignore: cast_nullable_to_non_nullable
as bool?,priceFrom: freezed == priceFrom ? _self.priceFrom : priceFrom // ignore: cast_nullable_to_non_nullable
as Money?,verification: null == verification ? _self.verification : verification // ignore: cast_nullable_to_non_nullable
as ServiceProviderVerification,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as ProviderRating?,contact: freezed == contact ? _self.contact : contact // ignore: cast_nullable_to_non_nullable
as ProviderContact?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res>? get priceFrom {
    if (_self.priceFrom == null) {
    return null;
  }

  return $MoneyCopyWith<$Res>(_self.priceFrom!, (value) {
    return _then(_self.copyWith(priceFrom: value));
  });
}/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderRatingCopyWith<$Res>? get rating {
    if (_self.rating == null) {
    return null;
  }

  return $ProviderRatingCopyWith<$Res>(_self.rating!, (value) {
    return _then(_self.copyWith(rating: value));
  });
}/// Create a copy of ServiceProvider
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProviderContactCopyWith<$Res>? get contact {
    if (_self.contact == null) {
    return null;
  }

  return $ProviderContactCopyWith<$Res>(_self.contact!, (value) {
    return _then(_self.copyWith(contact: value));
  });
}/// Create a copy of ServiceProvider
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
