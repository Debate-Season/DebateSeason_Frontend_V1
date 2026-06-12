// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_login_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersLoginEntity {

 String get idToken; String get socialType; bool get profileStatus; bool get termsStatus;
/// Create a copy of UsersLoginEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersLoginEntityCopyWith<UsersLoginEntity> get copyWith => _$UsersLoginEntityCopyWithImpl<UsersLoginEntity>(this as UsersLoginEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersLoginEntity&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.socialType, socialType) || other.socialType == socialType)&&(identical(other.profileStatus, profileStatus) || other.profileStatus == profileStatus)&&(identical(other.termsStatus, termsStatus) || other.termsStatus == termsStatus));
}


@override
int get hashCode => Object.hash(runtimeType,idToken,socialType,profileStatus,termsStatus);

@override
String toString() {
  return 'UsersLoginEntity(idToken: $idToken, socialType: $socialType, profileStatus: $profileStatus, termsStatus: $termsStatus)';
}


}

/// @nodoc
abstract mixin class $UsersLoginEntityCopyWith<$Res>  {
  factory $UsersLoginEntityCopyWith(UsersLoginEntity value, $Res Function(UsersLoginEntity) _then) = _$UsersLoginEntityCopyWithImpl;
@useResult
$Res call({
 String idToken, String socialType, bool profileStatus, bool termsStatus
});




}
/// @nodoc
class _$UsersLoginEntityCopyWithImpl<$Res>
    implements $UsersLoginEntityCopyWith<$Res> {
  _$UsersLoginEntityCopyWithImpl(this._self, this._then);

  final UsersLoginEntity _self;
  final $Res Function(UsersLoginEntity) _then;

/// Create a copy of UsersLoginEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idToken = null,Object? socialType = null,Object? profileStatus = null,Object? termsStatus = null,}) {
  return _then(_self.copyWith(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,socialType: null == socialType ? _self.socialType : socialType // ignore: cast_nullable_to_non_nullable
as String,profileStatus: null == profileStatus ? _self.profileStatus : profileStatus // ignore: cast_nullable_to_non_nullable
as bool,termsStatus: null == termsStatus ? _self.termsStatus : termsStatus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersLoginEntity].
extension UsersLoginEntityPatterns on UsersLoginEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsersLoginEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsersLoginEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsersLoginEntity value)  $default,){
final _that = this;
switch (_that) {
case _UsersLoginEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsersLoginEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UsersLoginEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String idToken,  String socialType,  bool profileStatus,  bool termsStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsersLoginEntity() when $default != null:
return $default(_that.idToken,_that.socialType,_that.profileStatus,_that.termsStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String idToken,  String socialType,  bool profileStatus,  bool termsStatus)  $default,) {final _that = this;
switch (_that) {
case _UsersLoginEntity():
return $default(_that.idToken,_that.socialType,_that.profileStatus,_that.termsStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String idToken,  String socialType,  bool profileStatus,  bool termsStatus)?  $default,) {final _that = this;
switch (_that) {
case _UsersLoginEntity() when $default != null:
return $default(_that.idToken,_that.socialType,_that.profileStatus,_that.termsStatus);case _:
  return null;

}
}

}

/// @nodoc


class _UsersLoginEntity implements UsersLoginEntity {
   _UsersLoginEntity({this.idToken = '', this.socialType = '', this.profileStatus = false, this.termsStatus = false});
  

@override@JsonKey() final  String idToken;
@override@JsonKey() final  String socialType;
@override@JsonKey() final  bool profileStatus;
@override@JsonKey() final  bool termsStatus;

/// Create a copy of UsersLoginEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsersLoginEntityCopyWith<_UsersLoginEntity> get copyWith => __$UsersLoginEntityCopyWithImpl<_UsersLoginEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsersLoginEntity&&(identical(other.idToken, idToken) || other.idToken == idToken)&&(identical(other.socialType, socialType) || other.socialType == socialType)&&(identical(other.profileStatus, profileStatus) || other.profileStatus == profileStatus)&&(identical(other.termsStatus, termsStatus) || other.termsStatus == termsStatus));
}


@override
int get hashCode => Object.hash(runtimeType,idToken,socialType,profileStatus,termsStatus);

@override
String toString() {
  return 'UsersLoginEntity(idToken: $idToken, socialType: $socialType, profileStatus: $profileStatus, termsStatus: $termsStatus)';
}


}

/// @nodoc
abstract mixin class _$UsersLoginEntityCopyWith<$Res> implements $UsersLoginEntityCopyWith<$Res> {
  factory _$UsersLoginEntityCopyWith(_UsersLoginEntity value, $Res Function(_UsersLoginEntity) _then) = __$UsersLoginEntityCopyWithImpl;
@override @useResult
$Res call({
 String idToken, String socialType, bool profileStatus, bool termsStatus
});




}
/// @nodoc
class __$UsersLoginEntityCopyWithImpl<$Res>
    implements _$UsersLoginEntityCopyWith<$Res> {
  __$UsersLoginEntityCopyWithImpl(this._self, this._then);

  final _UsersLoginEntity _self;
  final $Res Function(_UsersLoginEntity) _then;

/// Create a copy of UsersLoginEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idToken = null,Object? socialType = null,Object? profileStatus = null,Object? termsStatus = null,}) {
  return _then(_UsersLoginEntity(
idToken: null == idToken ? _self.idToken : idToken // ignore: cast_nullable_to_non_nullable
as String,socialType: null == socialType ? _self.socialType : socialType // ignore: cast_nullable_to_non_nullable
as String,profileStatus: null == profileStatus ? _self.profileStatus : profileStatus // ignore: cast_nullable_to_non_nullable
as bool,termsStatus: null == termsStatus ? _self.termsStatus : termsStatus // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
