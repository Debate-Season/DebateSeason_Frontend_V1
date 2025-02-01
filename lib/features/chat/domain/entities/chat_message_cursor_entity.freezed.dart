// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message_cursor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatMessageCursorEntity {
  List<ChatRoomMessageEntity> get chatRoomMessages =>
      throw _privateConstructorUsedError;
  String get nextCursor => throw _privateConstructorUsedError;

  /// Create a copy of ChatMessageCursorEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatMessageCursorEntityCopyWith<ChatMessageCursorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatMessageCursorEntityCopyWith<$Res> {
  factory $ChatMessageCursorEntityCopyWith(ChatMessageCursorEntity value,
          $Res Function(ChatMessageCursorEntity) then) =
      _$ChatMessageCursorEntityCopyWithImpl<$Res, ChatMessageCursorEntity>;
  @useResult
  $Res call({List<ChatRoomMessageEntity> chatRoomMessages, String nextCursor});
}

/// @nodoc
class _$ChatMessageCursorEntityCopyWithImpl<$Res,
        $Val extends ChatMessageCursorEntity>
    implements $ChatMessageCursorEntityCopyWith<$Res> {
  _$ChatMessageCursorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatMessageCursorEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomMessages = null,
    Object? nextCursor = null,
  }) {
    return _then(_value.copyWith(
      chatRoomMessages: null == chatRoomMessages
          ? _value.chatRoomMessages
          : chatRoomMessages // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomMessageEntity>,
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatMessageCursorEntityImplCopyWith<$Res>
    implements $ChatMessageCursorEntityCopyWith<$Res> {
  factory _$$ChatMessageCursorEntityImplCopyWith(
          _$ChatMessageCursorEntityImpl value,
          $Res Function(_$ChatMessageCursorEntityImpl) then) =
      __$$ChatMessageCursorEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ChatRoomMessageEntity> chatRoomMessages, String nextCursor});
}

/// @nodoc
class __$$ChatMessageCursorEntityImplCopyWithImpl<$Res>
    extends _$ChatMessageCursorEntityCopyWithImpl<$Res,
        _$ChatMessageCursorEntityImpl>
    implements _$$ChatMessageCursorEntityImplCopyWith<$Res> {
  __$$ChatMessageCursorEntityImplCopyWithImpl(
      _$ChatMessageCursorEntityImpl _value,
      $Res Function(_$ChatMessageCursorEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatMessageCursorEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomMessages = null,
    Object? nextCursor = null,
  }) {
    return _then(_$ChatMessageCursorEntityImpl(
      chatRoomMessages: null == chatRoomMessages
          ? _value._chatRoomMessages
          : chatRoomMessages // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomMessageEntity>,
      nextCursor: null == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChatMessageCursorEntityImpl implements _ChatMessageCursorEntity {
  _$ChatMessageCursorEntityImpl(
      {required final List<ChatRoomMessageEntity> chatRoomMessages,
      required this.nextCursor})
      : _chatRoomMessages = chatRoomMessages;

  final List<ChatRoomMessageEntity> _chatRoomMessages;
  @override
  List<ChatRoomMessageEntity> get chatRoomMessages {
    if (_chatRoomMessages is EqualUnmodifiableListView)
      return _chatRoomMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chatRoomMessages);
  }

  @override
  final String nextCursor;

  @override
  String toString() {
    return 'ChatMessageCursorEntity(chatRoomMessages: $chatRoomMessages, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatMessageCursorEntityImpl &&
            const DeepCollectionEquality()
                .equals(other._chatRoomMessages, _chatRoomMessages) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_chatRoomMessages), nextCursor);

  /// Create a copy of ChatMessageCursorEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatMessageCursorEntityImplCopyWith<_$ChatMessageCursorEntityImpl>
      get copyWith => __$$ChatMessageCursorEntityImplCopyWithImpl<
          _$ChatMessageCursorEntityImpl>(this, _$identity);
}

abstract class _ChatMessageCursorEntity implements ChatMessageCursorEntity {
  factory _ChatMessageCursorEntity(
      {required final List<ChatRoomMessageEntity> chatRoomMessages,
      required final String nextCursor}) = _$ChatMessageCursorEntityImpl;

  @override
  List<ChatRoomMessageEntity> get chatRoomMessages;
  @override
  String get nextCursor;

  /// Create a copy of ChatMessageCursorEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatMessageCursorEntityImplCopyWith<_$ChatMessageCursorEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
