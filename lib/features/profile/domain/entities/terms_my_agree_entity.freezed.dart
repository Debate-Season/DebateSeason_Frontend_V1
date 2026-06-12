// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_my_agree_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TermsMyAgreeEntity {

 String get termsType; String get agreedAt; String get notionUrl;
/// Create a copy of TermsMyAgreeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsMyAgreeEntityCopyWith<TermsMyAgreeEntity> get copyWith => _$TermsMyAgreeEntityCopyWithImpl<TermsMyAgreeEntity>(this as TermsMyAgreeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsMyAgreeEntity&&(identical(other.termsType, termsType) || other.termsType == termsType)&&(identical(other.agreedAt, agreedAt) || other.agreedAt == agreedAt)&&(identical(other.notionUrl, notionUrl) || other.notionUrl == notionUrl));
}


@override
int get hashCode => Object.hash(runtimeType,termsType,agreedAt,notionUrl);

@override
String toString() {
  return 'TermsMyAgreeEntity(termsType: $termsType, agreedAt: $agreedAt, notionUrl: $notionUrl)';
}


}

/// @nodoc
abstract mixin class $TermsMyAgreeEntityCopyWith<$Res>  {
  factory $TermsMyAgreeEntityCopyWith(TermsMyAgreeEntity value, $Res Function(TermsMyAgreeEntity) _then) = _$TermsMyAgreeEntityCopyWithImpl;
@useResult
$Res call({
 String termsType, String agreedAt, String notionUrl
});




}
/// @nodoc
class _$TermsMyAgreeEntityCopyWithImpl<$Res>
    implements $TermsMyAgreeEntityCopyWith<$Res> {
  _$TermsMyAgreeEntityCopyWithImpl(this._self, this._then);

  final TermsMyAgreeEntity _self;
  final $Res Function(TermsMyAgreeEntity) _then;

/// Create a copy of TermsMyAgreeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? termsType = null,Object? agreedAt = null,Object? notionUrl = null,}) {
  return _then(_self.copyWith(
termsType: null == termsType ? _self.termsType : termsType // ignore: cast_nullable_to_non_nullable
as String,agreedAt: null == agreedAt ? _self.agreedAt : agreedAt // ignore: cast_nullable_to_non_nullable
as String,notionUrl: null == notionUrl ? _self.notionUrl : notionUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsMyAgreeEntity].
extension TermsMyAgreeEntityPatterns on TermsMyAgreeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsMyAgreeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsMyAgreeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsMyAgreeEntity value)  $default,){
final _that = this;
switch (_that) {
case _TermsMyAgreeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsMyAgreeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TermsMyAgreeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String termsType,  String agreedAt,  String notionUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsMyAgreeEntity() when $default != null:
return $default(_that.termsType,_that.agreedAt,_that.notionUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String termsType,  String agreedAt,  String notionUrl)  $default,) {final _that = this;
switch (_that) {
case _TermsMyAgreeEntity():
return $default(_that.termsType,_that.agreedAt,_that.notionUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String termsType,  String agreedAt,  String notionUrl)?  $default,) {final _that = this;
switch (_that) {
case _TermsMyAgreeEntity() when $default != null:
return $default(_that.termsType,_that.agreedAt,_that.notionUrl);case _:
  return null;

}
}

}

/// @nodoc


class _TermsMyAgreeEntity implements TermsMyAgreeEntity {
   _TermsMyAgreeEntity({required this.termsType, required this.agreedAt, required this.notionUrl});
  

@override final  String termsType;
@override final  String agreedAt;
@override final  String notionUrl;

/// Create a copy of TermsMyAgreeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsMyAgreeEntityCopyWith<_TermsMyAgreeEntity> get copyWith => __$TermsMyAgreeEntityCopyWithImpl<_TermsMyAgreeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsMyAgreeEntity&&(identical(other.termsType, termsType) || other.termsType == termsType)&&(identical(other.agreedAt, agreedAt) || other.agreedAt == agreedAt)&&(identical(other.notionUrl, notionUrl) || other.notionUrl == notionUrl));
}


@override
int get hashCode => Object.hash(runtimeType,termsType,agreedAt,notionUrl);

@override
String toString() {
  return 'TermsMyAgreeEntity(termsType: $termsType, agreedAt: $agreedAt, notionUrl: $notionUrl)';
}


}

/// @nodoc
abstract mixin class _$TermsMyAgreeEntityCopyWith<$Res> implements $TermsMyAgreeEntityCopyWith<$Res> {
  factory _$TermsMyAgreeEntityCopyWith(_TermsMyAgreeEntity value, $Res Function(_TermsMyAgreeEntity) _then) = __$TermsMyAgreeEntityCopyWithImpl;
@override @useResult
$Res call({
 String termsType, String agreedAt, String notionUrl
});




}
/// @nodoc
class __$TermsMyAgreeEntityCopyWithImpl<$Res>
    implements _$TermsMyAgreeEntityCopyWith<$Res> {
  __$TermsMyAgreeEntityCopyWithImpl(this._self, this._then);

  final _TermsMyAgreeEntity _self;
  final $Res Function(_TermsMyAgreeEntity) _then;

/// Create a copy of TermsMyAgreeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? termsType = null,Object? agreedAt = null,Object? notionUrl = null,}) {
  return _then(_TermsMyAgreeEntity(
termsType: null == termsType ? _self.termsType : termsType // ignore: cast_nullable_to_non_nullable
as String,agreedAt: null == agreedAt ? _self.agreedAt : agreedAt // ignore: cast_nullable_to_non_nullable
as String,notionUrl: null == notionUrl ? _self.notionUrl : notionUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
