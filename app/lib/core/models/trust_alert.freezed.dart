// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trust_alert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrustAlert {

/// Firestore document id.
 String get id; Localized get title;/// How the scam looks
 Localized get pattern; Localized? get advice; List<String> get countryIds; TrustAlertSeverity get severity; String? get url; Provenance get provenance;
/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrustAlertCopyWith<TrustAlert> get copyWith => _$TrustAlertCopyWithImpl<TrustAlert>(this as TrustAlert, _$identity);

  /// Serializes this TrustAlert to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrustAlert;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrustAlert&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.pattern, _this.pattern) || other.pattern == _this.pattern)&&(identical(other.advice, _this.advice) || other.advice == _this.advice)&&const DeepCollectionEquality().equals(other.countryIds, _this.countryIds)&&(identical(other.severity, _this.severity) || other.severity == _this.severity)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.provenance, _this.provenance) || other.provenance == _this.provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrustAlert;
  return Object.hash(runtimeType,_this.id,_this.title,_this.pattern,_this.advice,const DeepCollectionEquality().hash(_this.countryIds),_this.severity,_this.url,_this.provenance);
}

@override
String toString() {
  final _this = this as TrustAlert;
  return 'TrustAlert(id: ${_this.id}, title: ${_this.title}, pattern: ${_this.pattern}, advice: ${_this.advice}, countryIds: ${_this.countryIds}, severity: ${_this.severity}, url: ${_this.url}, provenance: ${_this.provenance})';
}


}

/// @nodoc
abstract mixin class $TrustAlertCopyWith<$Res>  {
  factory $TrustAlertCopyWith(TrustAlert value, $Res Function(TrustAlert) _then) = _$TrustAlertCopyWithImpl;
@useResult
$Res call({
 String id, Localized title, Localized pattern, Localized? advice, List<String> countryIds, TrustAlertSeverity severity, String? url, Provenance provenance
});


$LocalizedCopyWith<$Res> get title;$LocalizedCopyWith<$Res> get pattern;$LocalizedCopyWith<$Res>? get advice;$ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class _$TrustAlertCopyWithImpl<$Res>
    implements $TrustAlertCopyWith<$Res> {
  _$TrustAlertCopyWithImpl(this._self, this._then);

  final TrustAlert _self;
  final $Res Function(TrustAlert) _then;

/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? pattern = null,Object? advice = freezed,Object? countryIds = null,Object? severity = null,Object? url = freezed,Object? provenance = null,}) {
  return _then(TrustAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Localized,pattern: null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as Localized,advice: freezed == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as Localized?,countryIds: null == countryIds ? _self.countryIds : countryIds // ignore: cast_nullable_to_non_nullable
as List<String>,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as TrustAlertSeverity,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}
/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get title {
  
  return $LocalizedCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get pattern {
  
  return $LocalizedCopyWith<$Res>(_self.pattern, (value) {
    return _then(_self.copyWith(pattern: value));
  });
}/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get advice {
    if (_self.advice == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.advice!, (value) {
    return _then(_self.copyWith(advice: value));
  });
}/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProvenanceCopyWith<$Res> get provenance {
  
  return $ProvenanceCopyWith<$Res>(_self.provenance, (value) {
    return _then(_self.copyWith(provenance: value));
  });
}
}


/// Adds pattern-matching-related methods to [TrustAlert].
extension TrustAlertPatterns on TrustAlert {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrustAlert value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrustAlert() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrustAlert value)  $default,){
final _that = this;
switch (_that) {
case _TrustAlert():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrustAlert value)?  $default,){
final _that = this;
switch (_that) {
case _TrustAlert() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  Localized title,  Localized pattern,  Localized? advice,  List<String> countryIds,  TrustAlertSeverity severity,  String? url,  Provenance provenance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrustAlert() when $default != null:
return $default(_that.id,_that.title,_that.pattern,_that.advice,_that.countryIds,_that.severity,_that.url,_that.provenance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  Localized title,  Localized pattern,  Localized? advice,  List<String> countryIds,  TrustAlertSeverity severity,  String? url,  Provenance provenance)  $default,) {final _that = this;
switch (_that) {
case _TrustAlert():
return $default(_that.id,_that.title,_that.pattern,_that.advice,_that.countryIds,_that.severity,_that.url,_that.provenance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  Localized title,  Localized pattern,  Localized? advice,  List<String> countryIds,  TrustAlertSeverity severity,  String? url,  Provenance provenance)?  $default,) {final _that = this;
switch (_that) {
case _TrustAlert() when $default != null:
return $default(_that.id,_that.title,_that.pattern,_that.advice,_that.countryIds,_that.severity,_that.url,_that.provenance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrustAlert implements TrustAlert {
  const _TrustAlert({required this.id, required this.title, required this.pattern, this.advice,  List<String> countryIds = const [], required this.severity, this.url, required this.provenance}): _countryIds = countryIds;
  factory _TrustAlert.fromJson(Map<String, dynamic> json) => _$TrustAlertFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  Localized title;
/// How the scam looks
@override final  Localized pattern;
@override final  Localized? advice;
 final  List<String> _countryIds;
@override@JsonKey() List<String> get countryIds {
  if (_countryIds is EqualUnmodifiableListView) return _countryIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_countryIds);
}

@override final  TrustAlertSeverity severity;
@override final  String? url;
@override final  Provenance provenance;

/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrustAlertCopyWith<_TrustAlert> get copyWith => __$TrustAlertCopyWithImpl<_TrustAlert>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrustAlertToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrustAlert&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.pattern, pattern) || other.pattern == pattern)&&(identical(other.advice, advice) || other.advice == advice)&&const DeepCollectionEquality().equals(other.countryIds, _countryIds)&&(identical(other.severity, severity) || other.severity == severity)&&(identical(other.url, url) || other.url == url)&&(identical(other.provenance, provenance) || other.provenance == provenance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,pattern,advice,const DeepCollectionEquality().hash(_countryIds),severity,url,provenance);
}

@override
String toString() {
    return 'TrustAlert(id: $id, title: $title, pattern: $pattern, advice: $advice, countryIds: $countryIds, severity: $severity, url: $url, provenance: $provenance)';
}


}

/// @nodoc
abstract mixin class _$TrustAlertCopyWith<$Res> implements $TrustAlertCopyWith<$Res> {
  factory _$TrustAlertCopyWith(_TrustAlert value, $Res Function(_TrustAlert) _then) = __$TrustAlertCopyWithImpl;
@override @useResult
$Res call({
 String id, Localized title, Localized pattern, Localized? advice, List<String> countryIds, TrustAlertSeverity severity, String? url, Provenance provenance
});


@override $LocalizedCopyWith<$Res> get title;@override $LocalizedCopyWith<$Res> get pattern;@override $LocalizedCopyWith<$Res>? get advice;@override $ProvenanceCopyWith<$Res> get provenance;

}
/// @nodoc
class __$TrustAlertCopyWithImpl<$Res>
    implements _$TrustAlertCopyWith<$Res> {
  __$TrustAlertCopyWithImpl(this._self, this._then);

  final _TrustAlert _self;
  final $Res Function(_TrustAlert) _then;

/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? pattern = null,Object? advice = freezed,Object? countryIds = null,Object? severity = null,Object? url = freezed,Object? provenance = null,}) {
  return _then(_TrustAlert(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as Localized,pattern: null == pattern ? _self.pattern : pattern // ignore: cast_nullable_to_non_nullable
as Localized,advice: freezed == advice ? _self.advice : advice // ignore: cast_nullable_to_non_nullable
as Localized?,countryIds: null == countryIds ? _self._countryIds : countryIds // ignore: cast_nullable_to_non_nullable
as List<String>,severity: null == severity ? _self.severity : severity // ignore: cast_nullable_to_non_nullable
as TrustAlertSeverity,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,provenance: null == provenance ? _self.provenance : provenance // ignore: cast_nullable_to_non_nullable
as Provenance,
  ));
}

/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get title {
  
  return $LocalizedCopyWith<$Res>(_self.title, (value) {
    return _then(_self.copyWith(title: value));
  });
}/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res> get pattern {
  
  return $LocalizedCopyWith<$Res>(_self.pattern, (value) {
    return _then(_self.copyWith(pattern: value));
  });
}/// Create a copy of TrustAlert
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedCopyWith<$Res>? get advice {
    if (_self.advice == null) {
    return null;
  }

  return $LocalizedCopyWith<$Res>(_self.advice!, (value) {
    return _then(_self.copyWith(advice: value));
  });
}/// Create a copy of TrustAlert
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
