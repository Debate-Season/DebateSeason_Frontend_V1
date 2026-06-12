// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FcmTokenEntity {

 String get fcmToken; String get deviceId; String get deviceType;
/// Create a copy of FcmTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FcmTokenEntityCopyWith<FcmTokenEntity> get copyWith => _$FcmTokenEntityCopyWithImpl<FcmTokenEntity>(this as FcmTokenEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FcmTokenEntity&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType));
}


@override
int get hashCode => Object.hash(runtimeType,fcmToken,deviceId,deviceType);

@override
String toString() {
  return 'FcmTokenEntity(fcmToken: $fcmToken, deviceId: $deviceId, deviceType: $deviceType)';
}


}

/// @nodoc
abstract mixin class $FcmTokenEntityCopyWith<$Res>  {
  factory $FcmTokenEntityCopyWith(FcmTokenEntity value, $Res Function(FcmTokenEntity) _then) = _$FcmTokenEntityCopyWithImpl;
@useResult
$Res call({
 String fcmToken, String deviceId, String deviceType
});




}
/// @nodoc
class _$FcmTokenEntityCopyWithImpl<$Res>
    implements $FcmTokenEntityCopyWith<$Res> {
  _$FcmTokenEntityCopyWithImpl(this._self, this._then);

  final FcmTokenEntity _self;
  final $Res Function(FcmTokenEntity) _then;

/// Create a copy of FcmTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fcmToken = null,Object? deviceId = null,Object? deviceType = null,}) {
  return _then(_self.copyWith(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FcmTokenEntity].
extension FcmTokenEntityPatterns on FcmTokenEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FcmTokenEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FcmTokenEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FcmTokenEntity value)  $default,){
final _that = this;
switch (_that) {
case _FcmTokenEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FcmTokenEntity value)?  $default,){
final _that = this;
switch (_that) {
case _FcmTokenEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fcmToken,  String deviceId,  String deviceType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FcmTokenEntity() when $default != null:
return $default(_that.fcmToken,_that.deviceId,_that.deviceType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fcmToken,  String deviceId,  String deviceType)  $default,) {final _that = this;
switch (_that) {
case _FcmTokenEntity():
return $default(_that.fcmToken,_that.deviceId,_that.deviceType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fcmToken,  String deviceId,  String deviceType)?  $default,) {final _that = this;
switch (_that) {
case _FcmTokenEntity() when $default != null:
return $default(_that.fcmToken,_that.deviceId,_that.deviceType);case _:
  return null;

}
}

}

/// @nodoc


class _FcmTokenEntity implements FcmTokenEntity {
   _FcmTokenEntity({required this.fcmToken, required this.deviceId, required this.deviceType});
  

@override final  String fcmToken;
@override final  String deviceId;
@override final  String deviceType;

/// Create a copy of FcmTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FcmTokenEntityCopyWith<_FcmTokenEntity> get copyWith => __$FcmTokenEntityCopyWithImpl<_FcmTokenEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FcmTokenEntity&&(identical(other.fcmToken, fcmToken) || other.fcmToken == fcmToken)&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId)&&(identical(other.deviceType, deviceType) || other.deviceType == deviceType));
}


@override
int get hashCode => Object.hash(runtimeType,fcmToken,deviceId,deviceType);

@override
String toString() {
  return 'FcmTokenEntity(fcmToken: $fcmToken, deviceId: $deviceId, deviceType: $deviceType)';
}


}

/// @nodoc
abstract mixin class _$FcmTokenEntityCopyWith<$Res> implements $FcmTokenEntityCopyWith<$Res> {
  factory _$FcmTokenEntityCopyWith(_FcmTokenEntity value, $Res Function(_FcmTokenEntity) _then) = __$FcmTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String fcmToken, String deviceId, String deviceType
});




}
/// @nodoc
class __$FcmTokenEntityCopyWithImpl<$Res>
    implements _$FcmTokenEntityCopyWith<$Res> {
  __$FcmTokenEntityCopyWithImpl(this._self, this._then);

  final _FcmTokenEntity _self;
  final $Res Function(_FcmTokenEntity) _then;

/// Create a copy of FcmTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fcmToken = null,Object? deviceId = null,Object? deviceType = null,}) {
  return _then(_FcmTokenEntity(
fcmToken: null == fcmToken ? _self.fcmToken : fcmToken // ignore: cast_nullable_to_non_nullable
as String,deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,deviceType: null == deviceType ? _self.deviceType : deviceType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
