// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEntity {
  String get nickname => throw _privateConstructorUsedError;
  int get communityId => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get ageRange => throw _privateConstructorUsedError;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileEntityCopyWith<ProfileEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEntityCopyWith<$Res> {
  factory $ProfileEntityCopyWith(
          ProfileEntity value, $Res Function(ProfileEntity) then) =
      _$ProfileEntityCopyWithImpl<$Res, ProfileEntity>;
  @useResult
  $Res call({String nickname, int communityId, String gender, String ageRange});
}

/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res, $Val extends ProfileEntity>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? communityId = null,
    Object? gender = null,
    Object? ageRange = null,
  }) {
    return _then(_value.copyWith(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      ageRange: null == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileEntityImplCopyWith<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  factory _$$ProfileEntityImplCopyWith(
          _$ProfileEntityImpl value, $Res Function(_$ProfileEntityImpl) then) =
      __$$ProfileEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname, int communityId, String gender, String ageRange});
}

/// @nodoc
class __$$ProfileEntityImplCopyWithImpl<$Res>
    extends _$ProfileEntityCopyWithImpl<$Res, _$ProfileEntityImpl>
    implements _$$ProfileEntityImplCopyWith<$Res> {
  __$$ProfileEntityImplCopyWithImpl(
      _$ProfileEntityImpl _value, $Res Function(_$ProfileEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nickname = null,
    Object? communityId = null,
    Object? gender = null,
    Object? ageRange = null,
  }) {
    return _then(_$ProfileEntityImpl(
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      communityId: null == communityId
          ? _value.communityId
          : communityId // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      ageRange: null == ageRange
          ? _value.ageRange
          : ageRange // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileEntityImpl implements _ProfileEntity {
  _$ProfileEntityImpl(
      {required this.nickname,
      required this.communityId,
      required this.gender,
      required this.ageRange});

  @override
  final String nickname;
  @override
  final int communityId;
  @override
  final String gender;
  @override
  final String ageRange;

  @override
  String toString() {
    return 'ProfileEntity(nickname: $nickname, communityId: $communityId, gender: $gender, ageRange: $ageRange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileEntityImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.communityId, communityId) ||
                other.communityId == communityId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.ageRange, ageRange) ||
                other.ageRange == ageRange));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nickname, communityId, gender, ageRange);

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      __$$ProfileEntityImplCopyWithImpl<_$ProfileEntityImpl>(this, _$identity);
}

abstract class _ProfileEntity implements ProfileEntity {
  factory _ProfileEntity(
      {required final String nickname,
      required final int communityId,
      required final String gender,
      required final String ageRange}) = _$ProfileEntityImpl;

  @override
  String get nickname;
  @override
  int get communityId;
  @override
  String get gender;
  @override
  String get ageRange;

  /// Create a copy of ProfileEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileEntityImplCopyWith<_$ProfileEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
