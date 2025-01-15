// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'community_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommunityEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get iconUrl => throw _privateConstructorUsedError;

  /// Create a copy of CommunityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommunityEntityCopyWith<CommunityEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommunityEntityCopyWith<$Res> {
  factory $CommunityEntityCopyWith(
          CommunityEntity value, $Res Function(CommunityEntity) then) =
      _$CommunityEntityCopyWithImpl<$Res, CommunityEntity>;
  @useResult
  $Res call({int id, String name, String iconUrl});
}

/// @nodoc
class _$CommunityEntityCopyWithImpl<$Res, $Val extends CommunityEntity>
    implements $CommunityEntityCopyWith<$Res> {
  _$CommunityEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommunityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommunityEntityImplCopyWith<$Res>
    implements $CommunityEntityCopyWith<$Res> {
  factory _$$CommunityEntityImplCopyWith(_$CommunityEntityImpl value,
          $Res Function(_$CommunityEntityImpl) then) =
      __$$CommunityEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String iconUrl});
}

/// @nodoc
class __$$CommunityEntityImplCopyWithImpl<$Res>
    extends _$CommunityEntityCopyWithImpl<$Res, _$CommunityEntityImpl>
    implements _$$CommunityEntityImplCopyWith<$Res> {
  __$$CommunityEntityImplCopyWithImpl(
      _$CommunityEntityImpl _value, $Res Function(_$CommunityEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommunityEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? iconUrl = null,
  }) {
    return _then(_$CommunityEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      iconUrl: null == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CommunityEntityImpl implements _CommunityEntity {
  _$CommunityEntityImpl(
      {required this.id, required this.name, required this.iconUrl});

  @override
  final int id;
  @override
  final String name;
  @override
  final String iconUrl;

  @override
  String toString() {
    return 'CommunityEntity(id: $id, name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommunityEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconUrl);

  /// Create a copy of CommunityEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommunityEntityImplCopyWith<_$CommunityEntityImpl> get copyWith =>
      __$$CommunityEntityImplCopyWithImpl<_$CommunityEntityImpl>(
          this, _$identity);
}

abstract class _CommunityEntity implements CommunityEntity {
  factory _CommunityEntity(
      {required final int id,
      required final String name,
      required final String iconUrl}) = _$CommunityEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get iconUrl;

  /// Create a copy of CommunityEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommunityEntityImplCopyWith<_$CommunityEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
