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
  String get date => throw _privateConstructorUsedError;
  List<ChatMessageEntity> get messages => throw _privateConstructorUsedError;
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
      {String date,
      List<ChatMessageEntity> messages,
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
    Object? date = null,
    Object? messages = null,
    Object? hasMore = null,
    Object? totalCount = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
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
      {String date,
      List<ChatMessageEntity> messages,
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
    Object? date = null,
    Object? messages = null,
    Object? hasMore = null,
    Object? totalCount = null,
  }) {
    return _then(_$ChatRoomMessageEntityImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
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
      {required this.date,
      required final List<ChatMessageEntity> messages,
      required this.hasMore,
      required this.totalCount})
      : _messages = messages;

  @override
  final String date;
  final List<ChatMessageEntity> _messages;
  @override
  List<ChatMessageEntity> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final bool hasMore;
  @override
  final int totalCount;

  @override
  String toString() {
    return 'ChatRoomMessageEntity(date: $date, messages: $messages, hasMore: $hasMore, totalCount: $totalCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomMessageEntityImpl &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date,
      const DeepCollectionEquality().hash(_messages), hasMore, totalCount);

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
      {required final String date,
      required final List<ChatMessageEntity> messages,
      required final bool hasMore,
      required final int totalCount}) = _$ChatRoomMessageEntityImpl;

  @override
  String get date;
  @override
  List<ChatMessageEntity> get messages;
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
