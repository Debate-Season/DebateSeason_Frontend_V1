// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TermsEntity {

 int get termsId; String get termsType; String get version; String get notionUrl;
/// Create a copy of TermsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsEntityCopyWith<TermsEntity> get copyWith => _$TermsEntityCopyWithImpl<TermsEntity>(this as TermsEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsEntity&&(identical(other.termsId, termsId) || other.termsId == termsId)&&(identical(other.termsType, termsType) || other.termsType == termsType)&&(identical(other.version, version) || other.version == version)&&(identical(other.notionUrl, notionUrl) || other.notionUrl == notionUrl));
}


@override
int get hashCode => Object.hash(runtimeType,termsId,termsType,version,notionUrl);

@override
String toString() {
  return 'TermsEntity(termsId: $termsId, termsType: $termsType, version: $version, notionUrl: $notionUrl)';
}


}

/// @nodoc
abstract mixin class $TermsEntityCopyWith<$Res>  {
  factory $TermsEntityCopyWith(TermsEntity value, $Res Function(TermsEntity) _then) = _$TermsEntityCopyWithImpl;
@useResult
$Res call({
 int termsId, String termsType, String version, String notionUrl
});




}
/// @nodoc
class _$TermsEntityCopyWithImpl<$Res>
    implements $TermsEntityCopyWith<$Res> {
  _$TermsEntityCopyWithImpl(this._self, this._then);

  final TermsEntity _self;
  final $Res Function(TermsEntity) _then;

/// Create a copy of TermsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? termsId = null,Object? termsType = null,Object? version = null,Object? notionUrl = null,}) {
  return _then(_self.copyWith(
termsId: null == termsId ? _self.termsId : termsId // ignore: cast_nullable_to_non_nullable
as int,termsType: null == termsType ? _self.termsType : termsType // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,notionUrl: null == notionUrl ? _self.notionUrl : notionUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsEntity].
extension TermsEntityPatterns on TermsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsEntity value)  $default,){
final _that = this;
switch (_that) {
case _TermsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TermsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int termsId,  String termsType,  String version,  String notionUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsEntity() when $default != null:
return $default(_that.termsId,_that.termsType,_that.version,_that.notionUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int termsId,  String termsType,  String version,  String notionUrl)  $default,) {final _that = this;
switch (_that) {
case _TermsEntity():
return $default(_that.termsId,_that.termsType,_that.version,_that.notionUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int termsId,  String termsType,  String version,  String notionUrl)?  $default,) {final _that = this;
switch (_that) {
case _TermsEntity() when $default != null:
return $default(_that.termsId,_that.termsType,_that.version,_that.notionUrl);case _:
  return null;

}
}

}

/// @nodoc


class _TermsEntity implements TermsEntity {
   _TermsEntity({required this.termsId, required this.termsType, required this.version, required this.notionUrl});
  

@override final  int termsId;
@override final  String termsType;
@override final  String version;
@override final  String notionUrl;

/// Create a copy of TermsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsEntityCopyWith<_TermsEntity> get copyWith => __$TermsEntityCopyWithImpl<_TermsEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsEntity&&(identical(other.termsId, termsId) || other.termsId == termsId)&&(identical(other.termsType, termsType) || other.termsType == termsType)&&(identical(other.version, version) || other.version == version)&&(identical(other.notionUrl, notionUrl) || other.notionUrl == notionUrl));
}


@override
int get hashCode => Object.hash(runtimeType,termsId,termsType,version,notionUrl);

@override
String toString() {
  return 'TermsEntity(termsId: $termsId, termsType: $termsType, version: $version, notionUrl: $notionUrl)';
}


}

/// @nodoc
abstract mixin class _$TermsEntityCopyWith<$Res> implements $TermsEntityCopyWith<$Res> {
  factory _$TermsEntityCopyWith(_TermsEntity value, $Res Function(_TermsEntity) _then) = __$TermsEntityCopyWithImpl;
@override @useResult
$Res call({
 int termsId, String termsType, String version, String notionUrl
});




}
/// @nodoc
class __$TermsEntityCopyWithImpl<$Res>
    implements _$TermsEntityCopyWith<$Res> {
  __$TermsEntityCopyWithImpl(this._self, this._then);

  final _TermsEntity _self;
  final $Res Function(_TermsEntity) _then;

/// Create a copy of TermsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? termsId = null,Object? termsType = null,Object? version = null,Object? notionUrl = null,}) {
  return _then(_TermsEntity(
termsId: null == termsId ? _self.termsId : termsId // ignore: cast_nullable_to_non_nullable
as int,termsType: null == termsType ? _self.termsType : termsType // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,notionUrl: null == notionUrl ? _self.notionUrl : notionUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
