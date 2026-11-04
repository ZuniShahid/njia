// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserDocument {

/// Firestore document id (null before the doc is created).
 String? get id; String? get type; String? get name; String? get storagePath; String? get issuedAt; String? get expiresAt;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserDocumentStatus? get status;@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserDocumentCategory? get category; String? get fileName; int? get sizeBytes; String? get uploadedAt;
/// Create a copy of UserDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDocumentCopyWith<UserDocument> get copyWith => _$UserDocumentCopyWithImpl<UserDocument>(this as UserDocument, _$identity);

  /// Serializes this UserDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserDocument;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDocument&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.storagePath, _this.storagePath) || other.storagePath == _this.storagePath)&&(identical(other.issuedAt, _this.issuedAt) || other.issuedAt == _this.issuedAt)&&(identical(other.expiresAt, _this.expiresAt) || other.expiresAt == _this.expiresAt)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.category, _this.category) || other.category == _this.category)&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.sizeBytes, _this.sizeBytes) || other.sizeBytes == _this.sizeBytes)&&(identical(other.uploadedAt, _this.uploadedAt) || other.uploadedAt == _this.uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserDocument;
  return Object.hash(runtimeType,_this.id,_this.type,_this.name,_this.storagePath,_this.issuedAt,_this.expiresAt,_this.status,_this.category,_this.fileName,_this.sizeBytes,_this.uploadedAt);
}

@override
String toString() {
  final _this = this as UserDocument;
  return 'UserDocument(id: ${_this.id}, type: ${_this.type}, name: ${_this.name}, storagePath: ${_this.storagePath}, issuedAt: ${_this.issuedAt}, expiresAt: ${_this.expiresAt}, status: ${_this.status}, category: ${_this.category}, fileName: ${_this.fileName}, sizeBytes: ${_this.sizeBytes}, uploadedAt: ${_this.uploadedAt})';
}


}

/// @nodoc
abstract mixin class $UserDocumentCopyWith<$Res>  {
  factory $UserDocumentCopyWith(UserDocument value, $Res Function(UserDocument) _then) = _$UserDocumentCopyWithImpl;
@useResult
$Res call({
 String? id, String? type, String? name, String? storagePath, String? issuedAt, String? expiresAt,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserDocumentStatus? status,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserDocumentCategory? category, String? fileName, int? sizeBytes, String? uploadedAt
});




}
/// @nodoc
class _$UserDocumentCopyWithImpl<$Res>
    implements $UserDocumentCopyWith<$Res> {
  _$UserDocumentCopyWithImpl(this._self, this._then);

  final UserDocument _self;
  final $Res Function(UserDocument) _then;

/// Create a copy of UserDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = freezed,Object? name = freezed,Object? storagePath = freezed,Object? issuedAt = freezed,Object? expiresAt = freezed,Object? status = freezed,Object? category = freezed,Object? fileName = freezed,Object? sizeBytes = freezed,Object? uploadedAt = freezed,}) {
  return _then(UserDocument(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,storagePath: freezed == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String?,issuedAt: freezed == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserDocumentStatus?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UserDocumentCategory?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,sizeBytes: freezed == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int?,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserDocument].
extension UserDocumentPatterns on UserDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDocument value)  $default,){
final _that = this;
switch (_that) {
case _UserDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDocument value)?  $default,){
final _that = this;
switch (_that) {
case _UserDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? type,  String? name,  String? storagePath,  String? issuedAt,  String? expiresAt, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserDocumentStatus? status, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserDocumentCategory? category,  String? fileName,  int? sizeBytes,  String? uploadedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDocument() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.storagePath,_that.issuedAt,_that.expiresAt,_that.status,_that.category,_that.fileName,_that.sizeBytes,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? type,  String? name,  String? storagePath,  String? issuedAt,  String? expiresAt, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserDocumentStatus? status, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserDocumentCategory? category,  String? fileName,  int? sizeBytes,  String? uploadedAt)  $default,) {final _that = this;
switch (_that) {
case _UserDocument():
return $default(_that.id,_that.type,_that.name,_that.storagePath,_that.issuedAt,_that.expiresAt,_that.status,_that.category,_that.fileName,_that.sizeBytes,_that.uploadedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? type,  String? name,  String? storagePath,  String? issuedAt,  String? expiresAt, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserDocumentStatus? status, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue)  UserDocumentCategory? category,  String? fileName,  int? sizeBytes,  String? uploadedAt)?  $default,) {final _that = this;
switch (_that) {
case _UserDocument() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.storagePath,_that.issuedAt,_that.expiresAt,_that.status,_that.category,_that.fileName,_that.sizeBytes,_that.uploadedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDocument implements UserDocument {
  const _UserDocument({this.id, this.type, this.name, this.storagePath, this.issuedAt, this.expiresAt, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.status, @JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) this.category, this.fileName, this.sizeBytes, this.uploadedAt});
  factory _UserDocument.fromJson(Map<String, dynamic> json) => _$UserDocumentFromJson(json);

/// Firestore document id (null before the doc is created).
@override final  String? id;
@override final  String? type;
@override final  String? name;
@override final  String? storagePath;
@override final  String? issuedAt;
@override final  String? expiresAt;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  UserDocumentStatus? status;
@override@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) final  UserDocumentCategory? category;
@override final  String? fileName;
@override final  int? sizeBytes;
@override final  String? uploadedAt;

/// Create a copy of UserDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDocumentCopyWith<_UserDocument> get copyWith => __$UserDocumentCopyWithImpl<_UserDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.storagePath, storagePath) || other.storagePath == storagePath)&&(identical(other.issuedAt, issuedAt) || other.issuedAt == issuedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.category, category) || other.category == category)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.sizeBytes, sizeBytes) || other.sizeBytes == sizeBytes)&&(identical(other.uploadedAt, uploadedAt) || other.uploadedAt == uploadedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,name,storagePath,issuedAt,expiresAt,status,category,fileName,sizeBytes,uploadedAt);
}

@override
String toString() {
    return 'UserDocument(id: $id, type: $type, name: $name, storagePath: $storagePath, issuedAt: $issuedAt, expiresAt: $expiresAt, status: $status, category: $category, fileName: $fileName, sizeBytes: $sizeBytes, uploadedAt: $uploadedAt)';
}


}

/// @nodoc
abstract mixin class _$UserDocumentCopyWith<$Res> implements $UserDocumentCopyWith<$Res> {
  factory _$UserDocumentCopyWith(_UserDocument value, $Res Function(_UserDocument) _then) = __$UserDocumentCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? type, String? name, String? storagePath, String? issuedAt, String? expiresAt,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserDocumentStatus? status,@JsonKey(unknownEnumValue: JsonKey.nullForUndefinedEnumValue) UserDocumentCategory? category, String? fileName, int? sizeBytes, String? uploadedAt
});




}
/// @nodoc
class __$UserDocumentCopyWithImpl<$Res>
    implements _$UserDocumentCopyWith<$Res> {
  __$UserDocumentCopyWithImpl(this._self, this._then);

  final _UserDocument _self;
  final $Res Function(_UserDocument) _then;

/// Create a copy of UserDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = freezed,Object? name = freezed,Object? storagePath = freezed,Object? issuedAt = freezed,Object? expiresAt = freezed,Object? status = freezed,Object? category = freezed,Object? fileName = freezed,Object? sizeBytes = freezed,Object? uploadedAt = freezed,}) {
  return _then(_UserDocument(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,storagePath: freezed == storagePath ? _self.storagePath : storagePath // ignore: cast_nullable_to_non_nullable
as String?,issuedAt: freezed == issuedAt ? _self.issuedAt : issuedAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UserDocumentStatus?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UserDocumentCategory?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,sizeBytes: freezed == sizeBytes ? _self.sizeBytes : sizeBytes // ignore: cast_nullable_to_non_nullable
as int?,uploadedAt: freezed == uploadedAt ? _self.uploadedAt : uploadedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
