// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_source.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SourceTarget {

 String? get collection; String? get docId; List<String> get fields;
/// Create a copy of SourceTarget
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SourceTargetCopyWith<SourceTarget> get copyWith => _$SourceTargetCopyWithImpl<SourceTarget>(this as SourceTarget, _$identity);

  /// Serializes this SourceTarget to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SourceTarget;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SourceTarget&&(identical(other.collection, _this.collection) || other.collection == _this.collection)&&(identical(other.docId, _this.docId) || other.docId == _this.docId)&&const DeepCollectionEquality().equals(other.fields, _this.fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SourceTarget;
  return Object.hash(runtimeType,_this.collection,_this.docId,const DeepCollectionEquality().hash(_this.fields));
}

@override
String toString() {
  final _this = this as SourceTarget;
  return 'SourceTarget(collection: ${_this.collection}, docId: ${_this.docId}, fields: ${_this.fields})';
}


}

/// @nodoc
abstract mixin class $SourceTargetCopyWith<$Res>  {
  factory $SourceTargetCopyWith(SourceTarget value, $Res Function(SourceTarget) _then) = _$SourceTargetCopyWithImpl;
@useResult
$Res call({
 String? collection, String? docId, List<String> fields
});




}
/// @nodoc
class _$SourceTargetCopyWithImpl<$Res>
    implements $SourceTargetCopyWith<$Res> {
  _$SourceTargetCopyWithImpl(this._self, this._then);

  final SourceTarget _self;
  final $Res Function(SourceTarget) _then;

/// Create a copy of SourceTarget
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? collection = freezed,Object? docId = freezed,Object? fields = null,}) {
  return _then(SourceTarget(
collection: freezed == collection ? _self.collection : collection // ignore: cast_nullable_to_non_nullable
as String?,docId: freezed == docId ? _self.docId : docId // ignore: cast_nullable_to_non_nullable
as String?,fields: null == fields ? _self.fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SourceTarget].
extension SourceTargetPatterns on SourceTarget {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SourceTarget value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SourceTarget() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SourceTarget value)  $default,){
final _that = this;
switch (_that) {
case _SourceTarget():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SourceTarget value)?  $default,){
final _that = this;
switch (_that) {
case _SourceTarget() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? collection,  String? docId,  List<String> fields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SourceTarget() when $default != null:
return $default(_that.collection,_that.docId,_that.fields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? collection,  String? docId,  List<String> fields)  $default,) {final _that = this;
switch (_that) {
case _SourceTarget():
return $default(_that.collection,_that.docId,_that.fields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? collection,  String? docId,  List<String> fields)?  $default,) {final _that = this;
switch (_that) {
case _SourceTarget() when $default != null:
return $default(_that.collection,_that.docId,_that.fields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SourceTarget implements SourceTarget {
  const _SourceTarget({this.collection, this.docId,  List<String> fields = const []}): _fields = fields;
  factory _SourceTarget.fromJson(Map<String, dynamic> json) => _$SourceTargetFromJson(json);

@override final  String? collection;
@override final  String? docId;
 final  List<String> _fields;
@override@JsonKey() List<String> get fields {
  if (_fields is EqualUnmodifiableListView) return _fields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_fields);
}


/// Create a copy of SourceTarget
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SourceTargetCopyWith<_SourceTarget> get copyWith => __$SourceTargetCopyWithImpl<_SourceTarget>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SourceTargetToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SourceTarget&&(identical(other.collection, collection) || other.collection == collection)&&(identical(other.docId, docId) || other.docId == docId)&&const DeepCollectionEquality().equals(other.fields, _fields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,collection,docId,const DeepCollectionEquality().hash(_fields));
}

@override
String toString() {
    return 'SourceTarget(collection: $collection, docId: $docId, fields: $fields)';
}


}

/// @nodoc
abstract mixin class _$SourceTargetCopyWith<$Res> implements $SourceTargetCopyWith<$Res> {
  factory _$SourceTargetCopyWith(_SourceTarget value, $Res Function(_SourceTarget) _then) = __$SourceTargetCopyWithImpl;
@override @useResult
$Res call({
 String? collection, String? docId, List<String> fields
});




}
/// @nodoc
class __$SourceTargetCopyWithImpl<$Res>
    implements _$SourceTargetCopyWith<$Res> {
  __$SourceTargetCopyWithImpl(this._self, this._then);

  final _SourceTarget _self;
  final $Res Function(_SourceTarget) _then;

/// Create a copy of SourceTarget
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? collection = freezed,Object? docId = freezed,Object? fields = null,}) {
  return _then(_SourceTarget(
collection: freezed == collection ? _self.collection : collection // ignore: cast_nullable_to_non_nullable
as String?,docId: freezed == docId ? _self.docId : docId // ignore: cast_nullable_to_non_nullable
as String?,fields: null == fields ? _self._fields : fields // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$ContentSource {

/// Firestore document id.
 String get id; String get name; String get url; SourceType get type; String? get license; int get cadenceDays;/// Which documents/fields this source feeds; the extractor only proposes changes to these.
 List<SourceTarget> get targets;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ContentSourceExtractor? get extractor;/// CSS selector to limit the fetched region
 String? get selector; String? get ownerUid; String? get lastFetchedAt; String? get lastCheckedAt; String? get lastHash;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ContentSourceLastStatus? get lastStatus; bool? get active;
/// Create a copy of ContentSource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContentSourceCopyWith<ContentSource> get copyWith => _$ContentSourceCopyWithImpl<ContentSource>(this as ContentSource, _$identity);

  /// Serializes this ContentSource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ContentSource;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContentSource&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.url, _this.url) || other.url == _this.url)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.license, _this.license) || other.license == _this.license)&&(identical(other.cadenceDays, _this.cadenceDays) || other.cadenceDays == _this.cadenceDays)&&const DeepCollectionEquality().equals(other.targets, _this.targets)&&(identical(other.extractor, _this.extractor) || other.extractor == _this.extractor)&&(identical(other.selector, _this.selector) || other.selector == _this.selector)&&(identical(other.ownerUid, _this.ownerUid) || other.ownerUid == _this.ownerUid)&&(identical(other.lastFetchedAt, _this.lastFetchedAt) || other.lastFetchedAt == _this.lastFetchedAt)&&(identical(other.lastCheckedAt, _this.lastCheckedAt) || other.lastCheckedAt == _this.lastCheckedAt)&&(identical(other.lastHash, _this.lastHash) || other.lastHash == _this.lastHash)&&(identical(other.lastStatus, _this.lastStatus) || other.lastStatus == _this.lastStatus)&&(identical(other.active, _this.active) || other.active == _this.active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ContentSource;
  return Object.hash(runtimeType,_this.id,_this.name,_this.url,_this.type,_this.license,_this.cadenceDays,const DeepCollectionEquality().hash(_this.targets),_this.extractor,_this.selector,_this.ownerUid,_this.lastFetchedAt,_this.lastCheckedAt,_this.lastHash,_this.lastStatus,_this.active);
}

@override
String toString() {
  final _this = this as ContentSource;
  return 'ContentSource(id: ${_this.id}, name: ${_this.name}, url: ${_this.url}, type: ${_this.type}, license: ${_this.license}, cadenceDays: ${_this.cadenceDays}, targets: ${_this.targets}, extractor: ${_this.extractor}, selector: ${_this.selector}, ownerUid: ${_this.ownerUid}, lastFetchedAt: ${_this.lastFetchedAt}, lastCheckedAt: ${_this.lastCheckedAt}, lastHash: ${_this.lastHash}, lastStatus: ${_this.lastStatus}, active: ${_this.active})';
}


}

/// @nodoc
abstract mixin class $ContentSourceCopyWith<$Res>  {
  factory $ContentSourceCopyWith(ContentSource value, $Res Function(ContentSource) _then) = _$ContentSourceCopyWithImpl;
@useResult
$Res call({
 String id, String name, String url, SourceType type, String? license, int cadenceDays, List<SourceTarget> targets,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ContentSourceExtractor? extractor, String? selector, String? ownerUid, String? lastFetchedAt, String? lastCheckedAt, String? lastHash,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ContentSourceLastStatus? lastStatus, bool? active
});




}
/// @nodoc
class _$ContentSourceCopyWithImpl<$Res>
    implements $ContentSourceCopyWith<$Res> {
  _$ContentSourceCopyWithImpl(this._self, this._then);

  final ContentSource _self;
  final $Res Function(ContentSource) _then;

/// Create a copy of ContentSource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? url = null,Object? type = null,Object? license = freezed,Object? cadenceDays = null,Object? targets = null,Object? extractor = freezed,Object? selector = freezed,Object? ownerUid = freezed,Object? lastFetchedAt = freezed,Object? lastCheckedAt = freezed,Object? lastHash = freezed,Object? lastStatus = freezed,Object? active = freezed,}) {
  return _then(ContentSource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceType,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,cadenceDays: null == cadenceDays ? _self.cadenceDays : cadenceDays // ignore: cast_nullable_to_non_nullable
as int,targets: null == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as List<SourceTarget>,extractor: freezed == extractor ? _self.extractor : extractor // ignore: cast_nullable_to_non_nullable
as ContentSourceExtractor?,selector: freezed == selector ? _self.selector : selector // ignore: cast_nullable_to_non_nullable
as String?,ownerUid: freezed == ownerUid ? _self.ownerUid : ownerUid // ignore: cast_nullable_to_non_nullable
as String?,lastFetchedAt: freezed == lastFetchedAt ? _self.lastFetchedAt : lastFetchedAt // ignore: cast_nullable_to_non_nullable
as String?,lastCheckedAt: freezed == lastCheckedAt ? _self.lastCheckedAt : lastCheckedAt // ignore: cast_nullable_to_non_nullable
as String?,lastHash: freezed == lastHash ? _self.lastHash : lastHash // ignore: cast_nullable_to_non_nullable
as String?,lastStatus: freezed == lastStatus ? _self.lastStatus : lastStatus // ignore: cast_nullable_to_non_nullable
as ContentSourceLastStatus?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [ContentSource].
extension ContentSourcePatterns on ContentSource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContentSource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContentSource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContentSource value)  $default,){
final _that = this;
switch (_that) {
case _ContentSource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContentSource value)?  $default,){
final _that = this;
switch (_that) {
case _ContentSource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String url,  SourceType type,  String? license,  int cadenceDays,  List<SourceTarget> targets, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ContentSourceExtractor? extractor,  String? selector,  String? ownerUid,  String? lastFetchedAt,  String? lastCheckedAt,  String? lastHash, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ContentSourceLastStatus? lastStatus,  bool? active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContentSource() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.type,_that.license,_that.cadenceDays,_that.targets,_that.extractor,_that.selector,_that.ownerUid,_that.lastFetchedAt,_that.lastCheckedAt,_that.lastHash,_that.lastStatus,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String url,  SourceType type,  String? license,  int cadenceDays,  List<SourceTarget> targets, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ContentSourceExtractor? extractor,  String? selector,  String? ownerUid,  String? lastFetchedAt,  String? lastCheckedAt,  String? lastHash, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ContentSourceLastStatus? lastStatus,  bool? active)  $default,) {final _that = this;
switch (_that) {
case _ContentSource():
return $default(_that.id,_that.name,_that.url,_that.type,_that.license,_that.cadenceDays,_that.targets,_that.extractor,_that.selector,_that.ownerUid,_that.lastFetchedAt,_that.lastCheckedAt,_that.lastHash,_that.lastStatus,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String url,  SourceType type,  String? license,  int cadenceDays,  List<SourceTarget> targets, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ContentSourceExtractor? extractor,  String? selector,  String? ownerUid,  String? lastFetchedAt,  String? lastCheckedAt,  String? lastHash, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  ContentSourceLastStatus? lastStatus,  bool? active)?  $default,) {final _that = this;
switch (_that) {
case _ContentSource() when $default != null:
return $default(_that.id,_that.name,_that.url,_that.type,_that.license,_that.cadenceDays,_that.targets,_that.extractor,_that.selector,_that.ownerUid,_that.lastFetchedAt,_that.lastCheckedAt,_that.lastHash,_that.lastStatus,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContentSource implements ContentSource {
  const _ContentSource({required this.id, required this.name, required this.url, required this.type, this.license, required this.cadenceDays,  List<SourceTarget> targets = const [], @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.extractor, this.selector, this.ownerUid, this.lastFetchedAt, this.lastCheckedAt, this.lastHash, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.lastStatus, this.active}): _targets = targets;
  factory _ContentSource.fromJson(Map<String, dynamic> json) => _$ContentSourceFromJson(json);

/// Firestore document id.
@override final  String id;
@override final  String name;
@override final  String url;
@override final  SourceType type;
@override final  String? license;
@override final  int cadenceDays;
/// Which documents/fields this source feeds; the extractor only proposes changes to these.
 final  List<SourceTarget> _targets;
/// Which documents/fields this source feeds; the extractor only proposes changes to these.
@override@JsonKey() List<SourceTarget> get targets {
  if (_targets is EqualUnmodifiableListView) return _targets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targets);
}

@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ContentSourceExtractor? extractor;
/// CSS selector to limit the fetched region
@override final  String? selector;
@override final  String? ownerUid;
@override final  String? lastFetchedAt;
@override final  String? lastCheckedAt;
@override final  String? lastHash;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  ContentSourceLastStatus? lastStatus;
@override final  bool? active;

/// Create a copy of ContentSource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContentSourceCopyWith<_ContentSource> get copyWith => __$ContentSourceCopyWithImpl<_ContentSource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContentSourceToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContentSource&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.type, type) || other.type == type)&&(identical(other.license, license) || other.license == license)&&(identical(other.cadenceDays, cadenceDays) || other.cadenceDays == cadenceDays)&&const DeepCollectionEquality().equals(other.targets, _targets)&&(identical(other.extractor, extractor) || other.extractor == extractor)&&(identical(other.selector, selector) || other.selector == selector)&&(identical(other.ownerUid, ownerUid) || other.ownerUid == ownerUid)&&(identical(other.lastFetchedAt, lastFetchedAt) || other.lastFetchedAt == lastFetchedAt)&&(identical(other.lastCheckedAt, lastCheckedAt) || other.lastCheckedAt == lastCheckedAt)&&(identical(other.lastHash, lastHash) || other.lastHash == lastHash)&&(identical(other.lastStatus, lastStatus) || other.lastStatus == lastStatus)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,url,type,license,cadenceDays,const DeepCollectionEquality().hash(_targets),extractor,selector,ownerUid,lastFetchedAt,lastCheckedAt,lastHash,lastStatus,active);
}

@override
String toString() {
    return 'ContentSource(id: $id, name: $name, url: $url, type: $type, license: $license, cadenceDays: $cadenceDays, targets: $targets, extractor: $extractor, selector: $selector, ownerUid: $ownerUid, lastFetchedAt: $lastFetchedAt, lastCheckedAt: $lastCheckedAt, lastHash: $lastHash, lastStatus: $lastStatus, active: $active)';
}


}

/// @nodoc
abstract mixin class _$ContentSourceCopyWith<$Res> implements $ContentSourceCopyWith<$Res> {
  factory _$ContentSourceCopyWith(_ContentSource value, $Res Function(_ContentSource) _then) = __$ContentSourceCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String url, SourceType type, String? license, int cadenceDays, List<SourceTarget> targets,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ContentSourceExtractor? extractor, String? selector, String? ownerUid, String? lastFetchedAt, String? lastCheckedAt, String? lastHash,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) ContentSourceLastStatus? lastStatus, bool? active
});




}
/// @nodoc
class __$ContentSourceCopyWithImpl<$Res>
    implements _$ContentSourceCopyWith<$Res> {
  __$ContentSourceCopyWithImpl(this._self, this._then);

  final _ContentSource _self;
  final $Res Function(_ContentSource) _then;

/// Create a copy of ContentSource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? url = null,Object? type = null,Object? license = freezed,Object? cadenceDays = null,Object? targets = null,Object? extractor = freezed,Object? selector = freezed,Object? ownerUid = freezed,Object? lastFetchedAt = freezed,Object? lastCheckedAt = freezed,Object? lastHash = freezed,Object? lastStatus = freezed,Object? active = freezed,}) {
  return _then(_ContentSource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as SourceType,license: freezed == license ? _self.license : license // ignore: cast_nullable_to_non_nullable
as String?,cadenceDays: null == cadenceDays ? _self.cadenceDays : cadenceDays // ignore: cast_nullable_to_non_nullable
as int,targets: null == targets ? _self._targets : targets // ignore: cast_nullable_to_non_nullable
as List<SourceTarget>,extractor: freezed == extractor ? _self.extractor : extractor // ignore: cast_nullable_to_non_nullable
as ContentSourceExtractor?,selector: freezed == selector ? _self.selector : selector // ignore: cast_nullable_to_non_nullable
as String?,ownerUid: freezed == ownerUid ? _self.ownerUid : ownerUid // ignore: cast_nullable_to_non_nullable
as String?,lastFetchedAt: freezed == lastFetchedAt ? _self.lastFetchedAt : lastFetchedAt // ignore: cast_nullable_to_non_nullable
as String?,lastCheckedAt: freezed == lastCheckedAt ? _self.lastCheckedAt : lastCheckedAt // ignore: cast_nullable_to_non_nullable
as String?,lastHash: freezed == lastHash ? _self.lastHash : lastHash // ignore: cast_nullable_to_non_nullable
as String?,lastStatus: freezed == lastStatus ? _self.lastStatus : lastStatus // ignore: cast_nullable_to_non_nullable
as ContentSourceLastStatus?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
