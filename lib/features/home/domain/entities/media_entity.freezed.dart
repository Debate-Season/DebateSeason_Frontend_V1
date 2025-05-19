// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MediaEntity {
  List<MediaItemEntity> get mediaMap => throw _privateConstructorUsedError;

  /// Create a copy of MediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MediaEntityCopyWith<MediaEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaEntityCopyWith<$Res> {
  factory $MediaEntityCopyWith(
          MediaEntity value, $Res Function(MediaEntity) then) =
      _$MediaEntityCopyWithImpl<$Res, MediaEntity>;
  @useResult
  $Res call({List<MediaItemEntity> mediaMap});
}

/// @nodoc
class _$MediaEntityCopyWithImpl<$Res, $Val extends MediaEntity>
    implements $MediaEntityCopyWith<$Res> {
  _$MediaEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaMap = null,
  }) {
    return _then(_value.copyWith(
      mediaMap: null == mediaMap
          ? _value.mediaMap
          : mediaMap // ignore: cast_nullable_to_non_nullable
              as List<MediaItemEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaEntityImplCopyWith<$Res>
    implements $MediaEntityCopyWith<$Res> {
  factory _$$MediaEntityImplCopyWith(
          _$MediaEntityImpl value, $Res Function(_$MediaEntityImpl) then) =
      __$$MediaEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MediaItemEntity> mediaMap});
}

/// @nodoc
class __$$MediaEntityImplCopyWithImpl<$Res>
    extends _$MediaEntityCopyWithImpl<$Res, _$MediaEntityImpl>
    implements _$$MediaEntityImplCopyWith<$Res> {
  __$$MediaEntityImplCopyWithImpl(
      _$MediaEntityImpl _value, $Res Function(_$MediaEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mediaMap = null,
  }) {
    return _then(_$MediaEntityImpl(
      mediaMap: null == mediaMap
          ? _value._mediaMap
          : mediaMap // ignore: cast_nullable_to_non_nullable
              as List<MediaItemEntity>,
    ));
  }
}

/// @nodoc

class _$MediaEntityImpl implements _MediaEntity {
  _$MediaEntityImpl({required final List<MediaItemEntity> mediaMap})
      : _mediaMap = mediaMap;

  final List<MediaItemEntity> _mediaMap;
  @override
  List<MediaItemEntity> get mediaMap {
    if (_mediaMap is EqualUnmodifiableListView) return _mediaMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mediaMap);
  }

  @override
  String toString() {
    return 'MediaEntity(mediaMap: $mediaMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaEntityImpl &&
            const DeepCollectionEquality().equals(other._mediaMap, _mediaMap));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_mediaMap));

  /// Create a copy of MediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaEntityImplCopyWith<_$MediaEntityImpl> get copyWith =>
      __$$MediaEntityImplCopyWithImpl<_$MediaEntityImpl>(this, _$identity);
}

abstract class _MediaEntity implements MediaEntity {
  factory _MediaEntity({required final List<MediaItemEntity> mediaMap}) =
      _$MediaEntityImpl;

  @override
  List<MediaItemEntity> get mediaMap;

  /// Create a copy of MediaEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MediaEntityImplCopyWith<_$MediaEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
