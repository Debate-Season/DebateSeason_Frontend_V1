// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IssueEntity {
  String get title => throw _privateConstructorUsedError;
  Map<String, int> get map => throw _privateConstructorUsedError;
  List<ChatRoomEntity> get chatRoomMap => throw _privateConstructorUsedError;

  /// Create a copy of IssueEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IssueEntityCopyWith<IssueEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueEntityCopyWith<$Res> {
  factory $IssueEntityCopyWith(
          IssueEntity value, $Res Function(IssueEntity) then) =
      _$IssueEntityCopyWithImpl<$Res, IssueEntity>;
  @useResult
  $Res call(
      {String title, Map<String, int> map, List<ChatRoomEntity> chatRoomMap});
}

/// @nodoc
class _$IssueEntityCopyWithImpl<$Res, $Val extends IssueEntity>
    implements $IssueEntityCopyWith<$Res> {
  _$IssueEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IssueEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? map = null,
    Object? chatRoomMap = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      map: null == map
          ? _value.map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      chatRoomMap: null == chatRoomMap
          ? _value.chatRoomMap
          : chatRoomMap // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IssueEntityImplCopyWith<$Res>
    implements $IssueEntityCopyWith<$Res> {
  factory _$$IssueEntityImplCopyWith(
          _$IssueEntityImpl value, $Res Function(_$IssueEntityImpl) then) =
      __$$IssueEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, Map<String, int> map, List<ChatRoomEntity> chatRoomMap});
}

/// @nodoc
class __$$IssueEntityImplCopyWithImpl<$Res>
    extends _$IssueEntityCopyWithImpl<$Res, _$IssueEntityImpl>
    implements _$$IssueEntityImplCopyWith<$Res> {
  __$$IssueEntityImplCopyWithImpl(
      _$IssueEntityImpl _value, $Res Function(_$IssueEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of IssueEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? map = null,
    Object? chatRoomMap = null,
  }) {
    return _then(_$IssueEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      map: null == map
          ? _value._map
          : map // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      chatRoomMap: null == chatRoomMap
          ? _value._chatRoomMap
          : chatRoomMap // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomEntity>,
    ));
  }
}

/// @nodoc

class _$IssueEntityImpl implements _IssueEntity {
  _$IssueEntityImpl(
      {required this.title,
      required final Map<String, int> map,
      required final List<ChatRoomEntity> chatRoomMap})
      : _map = map,
        _chatRoomMap = chatRoomMap;

  @override
  final String title;
  final Map<String, int> _map;
  @override
  Map<String, int> get map {
    if (_map is EqualUnmodifiableMapView) return _map;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_map);
  }

  final List<ChatRoomEntity> _chatRoomMap;
  @override
  List<ChatRoomEntity> get chatRoomMap {
    if (_chatRoomMap is EqualUnmodifiableListView) return _chatRoomMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatRoomMap);
  }

  @override
  String toString() {
    return 'IssueEntity(title: $title, map: $map, chatRoomMap: $chatRoomMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IssueEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._map, _map) &&
            const DeepCollectionEquality()
                .equals(other._chatRoomMap, _chatRoomMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_map),
      const DeepCollectionEquality().hash(_chatRoomMap));

  /// Create a copy of IssueEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IssueEntityImplCopyWith<_$IssueEntityImpl> get copyWith =>
      __$$IssueEntityImplCopyWithImpl<_$IssueEntityImpl>(this, _$identity);
}

abstract class _IssueEntity implements IssueEntity {
  factory _IssueEntity(
      {required final String title,
      required final Map<String, int> map,
      required final List<ChatRoomEntity> chatRoomMap}) = _$IssueEntityImpl;

  @override
  String get title;
  @override
  Map<String, int> get map;
  @override
  List<ChatRoomEntity> get chatRoomMap;

  /// Create a copy of IssueEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IssueEntityImplCopyWith<_$IssueEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
