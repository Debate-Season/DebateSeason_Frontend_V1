// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_version_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppVersionEntity {
  bool get forceUpdate => throw _privateConstructorUsedError;
  int get versionCode => throw _privateConstructorUsedError;

  /// Create a copy of AppVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppVersionEntityCopyWith<AppVersionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppVersionEntityCopyWith<$Res> {
  factory $AppVersionEntityCopyWith(
          AppVersionEntity value, $Res Function(AppVersionEntity) then) =
      _$AppVersionEntityCopyWithImpl<$Res, AppVersionEntity>;
  @useResult
  $Res call({bool forceUpdate, int versionCode});
}

/// @nodoc
class _$AppVersionEntityCopyWithImpl<$Res, $Val extends AppVersionEntity>
    implements $AppVersionEntityCopyWith<$Res> {
  _$AppVersionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceUpdate = null,
    Object? versionCode = null,
  }) {
    return _then(_value.copyWith(
      forceUpdate: null == forceUpdate
          ? _value.forceUpdate
          : forceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      versionCode: null == versionCode
          ? _value.versionCode
          : versionCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppVersionEntityImplCopyWith<$Res>
    implements $AppVersionEntityCopyWith<$Res> {
  factory _$$AppVersionEntityImplCopyWith(_$AppVersionEntityImpl value,
          $Res Function(_$AppVersionEntityImpl) then) =
      __$$AppVersionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool forceUpdate, int versionCode});
}

/// @nodoc
class __$$AppVersionEntityImplCopyWithImpl<$Res>
    extends _$AppVersionEntityCopyWithImpl<$Res, _$AppVersionEntityImpl>
    implements _$$AppVersionEntityImplCopyWith<$Res> {
  __$$AppVersionEntityImplCopyWithImpl(_$AppVersionEntityImpl _value,
      $Res Function(_$AppVersionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forceUpdate = null,
    Object? versionCode = null,
  }) {
    return _then(_$AppVersionEntityImpl(
      forceUpdate: null == forceUpdate
          ? _value.forceUpdate
          : forceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      versionCode: null == versionCode
          ? _value.versionCode
          : versionCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppVersionEntityImpl implements _AppVersionEntity {
  _$AppVersionEntityImpl(
      {required this.forceUpdate, required this.versionCode});

  @override
  final bool forceUpdate;
  @override
  final int versionCode;

  @override
  String toString() {
    return 'AppVersionEntity(forceUpdate: $forceUpdate, versionCode: $versionCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppVersionEntityImpl &&
            (identical(other.forceUpdate, forceUpdate) ||
                other.forceUpdate == forceUpdate) &&
            (identical(other.versionCode, versionCode) ||
                other.versionCode == versionCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, forceUpdate, versionCode);

  /// Create a copy of AppVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppVersionEntityImplCopyWith<_$AppVersionEntityImpl> get copyWith =>
      __$$AppVersionEntityImplCopyWithImpl<_$AppVersionEntityImpl>(
          this, _$identity);
}

abstract class _AppVersionEntity implements AppVersionEntity {
  factory _AppVersionEntity(
      {required final bool forceUpdate,
      required final int versionCode}) = _$AppVersionEntityImpl;

  @override
  bool get forceUpdate;
  @override
  int get versionCode;

  /// Create a copy of AppVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppVersionEntityImplCopyWith<_$AppVersionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
