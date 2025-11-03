// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fcm_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FcmTokenEntity {
  String get fcmToken => throw _privateConstructorUsedError;
  String get deviceId => throw _privateConstructorUsedError;
  String get deviceType => throw _privateConstructorUsedError;

  /// Create a copy of FcmTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FcmTokenEntityCopyWith<FcmTokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FcmTokenEntityCopyWith<$Res> {
  factory $FcmTokenEntityCopyWith(
          FcmTokenEntity value, $Res Function(FcmTokenEntity) then) =
      _$FcmTokenEntityCopyWithImpl<$Res, FcmTokenEntity>;
  @useResult
  $Res call({String fcmToken, String deviceId, String deviceType});
}

/// @nodoc
class _$FcmTokenEntityCopyWithImpl<$Res, $Val extends FcmTokenEntity>
    implements $FcmTokenEntityCopyWith<$Res> {
  _$FcmTokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FcmTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceType = null,
  }) {
    return _then(_value.copyWith(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FcmTokenEntityImplCopyWith<$Res>
    implements $FcmTokenEntityCopyWith<$Res> {
  factory _$$FcmTokenEntityImplCopyWith(_$FcmTokenEntityImpl value,
          $Res Function(_$FcmTokenEntityImpl) then) =
      __$$FcmTokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fcmToken, String deviceId, String deviceType});
}

/// @nodoc
class __$$FcmTokenEntityImplCopyWithImpl<$Res>
    extends _$FcmTokenEntityCopyWithImpl<$Res, _$FcmTokenEntityImpl>
    implements _$$FcmTokenEntityImplCopyWith<$Res> {
  __$$FcmTokenEntityImplCopyWithImpl(
      _$FcmTokenEntityImpl _value, $Res Function(_$FcmTokenEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of FcmTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = null,
    Object? deviceId = null,
    Object? deviceType = null,
  }) {
    return _then(_$FcmTokenEntityImpl(
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      deviceId: null == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
      deviceType: null == deviceType
          ? _value.deviceType
          : deviceType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FcmTokenEntityImpl implements _FcmTokenEntity {
  _$FcmTokenEntityImpl(
      {required this.fcmToken,
      required this.deviceId,
      required this.deviceType});

  @override
  final String fcmToken;
  @override
  final String deviceId;
  @override
  final String deviceType;

  @override
  String toString() {
    return 'FcmTokenEntity(fcmToken: $fcmToken, deviceId: $deviceId, deviceType: $deviceType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FcmTokenEntityImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.deviceType, deviceType) ||
                other.deviceType == deviceType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fcmToken, deviceId, deviceType);

  /// Create a copy of FcmTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FcmTokenEntityImplCopyWith<_$FcmTokenEntityImpl> get copyWith =>
      __$$FcmTokenEntityImplCopyWithImpl<_$FcmTokenEntityImpl>(
          this, _$identity);
}

abstract class _FcmTokenEntity implements FcmTokenEntity {
  factory _FcmTokenEntity(
      {required final String fcmToken,
      required final String deviceId,
      required final String deviceType}) = _$FcmTokenEntityImpl;

  @override
  String get fcmToken;
  @override
  String get deviceId;
  @override
  String get deviceType;

  /// Create a copy of FcmTokenEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FcmTokenEntityImplCopyWith<_$FcmTokenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
