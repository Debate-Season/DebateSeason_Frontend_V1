// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatRoomMessageEntity {
  String get nextCursor => throw _privateConstructorUsedError;
  List<ChatMessageEntity> get items => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;

  /// Create a copy of ChatRoomMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomMessageEntityCopyWith<ChatRoomMessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomMessageEntityCopyWith<$Res> {
  factory $ChatRoomMessageEntityCopyWith(ChatRoomMessageEntity value,
          $Res Function(ChatRoomMessageEntity) then) =
      _$ChatRoomMessageEntityCopyWithImpl<$Res, ChatRoomMessageEntity>;
  @useResult
  $Res call(
      {String nextCursor,
      List<ChatMessageEntity> items,
      bool hasMore,
      int totalCount});
}

/// @nodoc
class _$ChatRoomMessageEntityCopyWithImpl<$Res,
        $Val extends ChatRoomMessageEntity>
    implements $ChatRoomMessageEntityCopyWith<$Res> {
  _$ChatRoomMessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextCursor = null,
    Object? items = null,
    Object? hasMore = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageEntity>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRoomMessageEntityImplCopyWith<$Res>
    implements $ChatRoomMessageEntityCopyWith<$Res> {
  factory _$$ChatRoomMessageEntityImplCopyWith(
          _$ChatRoomMessageEntityImpl value,
          $Res Function(_$ChatRoomMessageEntityImpl) then) =
      __$$ChatRoomMessageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nextCursor,
      List<ChatMessageEntity> items,
      bool hasMore,
      int totalCount});
}

/// @nodoc
class __$$ChatRoomMessageEntityImplCopyWithImpl<$Res>
    extends _$ChatRoomMessageEntityCopyWithImpl<$Res,
        _$ChatRoomMessageEntityImpl>
    implements _$$ChatRoomMessageEntityImplCopyWith<$Res> {
  __$$ChatRoomMessageEntityImplCopyWithImpl(_$ChatRoomMessageEntityImpl _value,
      $Res Function(_$ChatRoomMessageEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRoomMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextCursor = null,
    Object? items = null,
    Object? hasMore = null,
    Object? totalCount = null,
  }) {
    return _then(_$ChatRoomMessageEntityImpl(
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ChatMessageEntity>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ChatRoomMessageEntityImpl implements _ChatRoomMessageEntity {
  _$ChatRoomMessageEntityImpl(
      {required this.nextCursor,
      required final List<ChatMessageEntity> items,
      required this.hasMore,
      required this.totalCount})
      : _items = items;

  @override
  final String nextCursor;
  final List<ChatMessageEntity> _items;
  @override
  List<ChatMessageEntity> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final bool hasMore;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ChatRoomMessageEntity(nextCursor: $nextCursor, items: $items, hasMore: $hasMore, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomMessageEntityImpl &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nextCursor,
      const DeepCollectionEquality().hash(_items), hasMore, totalCount);

  /// Create a copy of ChatRoomMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomMessageEntityImplCopyWith<_$ChatRoomMessageEntityImpl>
      get copyWith => __$$ChatRoomMessageEntityImplCopyWithImpl<
          _$ChatRoomMessageEntityImpl>(this, _$identity);
}

abstract class _ChatRoomMessageEntity implements ChatRoomMessageEntity {
  factory _ChatRoomMessageEntity(
      {required final String nextCursor,
      required final List<ChatMessageEntity> items,
      required final bool hasMore,
      required final int totalCount}) = _$ChatRoomMessageEntityImpl;

  @override
  String get nextCursor;
  @override
  List<ChatMessageEntity> get items;
  @override
  bool get hasMore;
  @override
  int get totalCount;

  /// Create a copy of ChatRoomMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomMessageEntityImplCopyWith<_$ChatRoomMessageEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
