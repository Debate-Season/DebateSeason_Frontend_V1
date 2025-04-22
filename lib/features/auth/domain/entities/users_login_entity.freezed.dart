// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_login_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsersLoginEntity {
  String get idToken => throw _privateConstructorUsedError;
  String get socialType => throw _privateConstructorUsedError;
  bool get profileStatus => throw _privateConstructorUsedError;
  bool get termsStatus => throw _privateConstructorUsedError;

  /// Create a copy of UsersLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UsersLoginEntityCopyWith<UsersLoginEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersLoginEntityCopyWith<$Res> {
  factory $UsersLoginEntityCopyWith(
          UsersLoginEntity value, $Res Function(UsersLoginEntity) then) =
      _$UsersLoginEntityCopyWithImpl<$Res, UsersLoginEntity>;
  @useResult
  $Res call(
      {String idToken,
      String socialType,
      bool profileStatus,
      bool termsStatus});
}

/// @nodoc
class _$UsersLoginEntityCopyWithImpl<$Res, $Val extends UsersLoginEntity>
    implements $UsersLoginEntityCopyWith<$Res> {
  _$UsersLoginEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UsersLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? socialType = null,
    Object? profileStatus = null,
    Object? termsStatus = null,
  }) {
    return _then(_value.copyWith(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      socialType: null == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as String,
      profileStatus: null == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      termsStatus: null == termsStatus
          ? _value.termsStatus
          : termsStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UsersLoginEntityImplCopyWith<$Res>
    implements $UsersLoginEntityCopyWith<$Res> {
  factory _$$UsersLoginEntityImplCopyWith(_$UsersLoginEntityImpl value,
          $Res Function(_$UsersLoginEntityImpl) then) =
      __$$UsersLoginEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String idToken,
      String socialType,
      bool profileStatus,
      bool termsStatus});
}

/// @nodoc
class __$$UsersLoginEntityImplCopyWithImpl<$Res>
    extends _$UsersLoginEntityCopyWithImpl<$Res, _$UsersLoginEntityImpl>
    implements _$$UsersLoginEntityImplCopyWith<$Res> {
  __$$UsersLoginEntityImplCopyWithImpl(_$UsersLoginEntityImpl _value,
      $Res Function(_$UsersLoginEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of UsersLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idToken = null,
    Object? socialType = null,
    Object? profileStatus = null,
    Object? termsStatus = null,
  }) {
    return _then(_$UsersLoginEntityImpl(
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
      socialType: null == socialType
          ? _value.socialType
          : socialType // ignore: cast_nullable_to_non_nullable
              as String,
      profileStatus: null == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      termsStatus: null == termsStatus
          ? _value.termsStatus
          : termsStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UsersLoginEntityImpl implements _UsersLoginEntity {
  _$UsersLoginEntityImpl(
      {this.idToken = '',
      this.socialType = '',
      this.profileStatus = false,
      this.termsStatus = false});

  @override
  @JsonKey()
  final String idToken;
  @override
  @JsonKey()
  final String socialType;
  @override
  @JsonKey()
  final bool profileStatus;
  @override
  @JsonKey()
  final bool termsStatus;

  @override
  String toString() {
    return 'UsersLoginEntity(idToken: $idToken, socialType: $socialType, profileStatus: $profileStatus, termsStatus: $termsStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UsersLoginEntityImpl &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.socialType, socialType) ||
                other.socialType == socialType) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.termsStatus, termsStatus) ||
                other.termsStatus == termsStatus));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, idToken, socialType, profileStatus, termsStatus);

  /// Create a copy of UsersLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UsersLoginEntityImplCopyWith<_$UsersLoginEntityImpl> get copyWith =>
      __$$UsersLoginEntityImplCopyWithImpl<_$UsersLoginEntityImpl>(
          this, _$identity);
}

abstract class _UsersLoginEntity implements UsersLoginEntity {
  factory _UsersLoginEntity(
      {final String idToken,
      final String socialType,
      final bool profileStatus,
      final bool termsStatus}) = _$UsersLoginEntityImpl;

  @override
  String get idToken;
  @override
  String get socialType;
  @override
  bool get profileStatus;
  @override
  bool get termsStatus;

  /// Create a copy of UsersLoginEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UsersLoginEntityImplCopyWith<_$UsersLoginEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
