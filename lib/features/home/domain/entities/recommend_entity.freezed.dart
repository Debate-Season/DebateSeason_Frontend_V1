// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecommendEntity {
  List<BreakingNewsEntity> get breakingNews =>
      throw _privateConstructorUsedError;
  List<BestChatRoomEntity> get top5BestChatRooms =>
      throw _privateConstructorUsedError;
  List<BestIssueRoomEntity> get top5BestIssueRooms =>
      throw _privateConstructorUsedError;
  List<ChatRoomResponseEntity>? get chatRoomResponse =>
      throw _privateConstructorUsedError;

  /// Create a copy of RecommendEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecommendEntityCopyWith<RecommendEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecommendEntityCopyWith<$Res> {
  factory $RecommendEntityCopyWith(
          RecommendEntity value, $Res Function(RecommendEntity) then) =
      _$RecommendEntityCopyWithImpl<$Res, RecommendEntity>;
  @useResult
  $Res call(
      {List<BreakingNewsEntity> breakingNews,
      List<BestChatRoomEntity> top5BestChatRooms,
      List<BestIssueRoomEntity> top5BestIssueRooms,
      List<ChatRoomResponseEntity>? chatRoomResponse});
}

/// @nodoc
class _$RecommendEntityCopyWithImpl<$Res, $Val extends RecommendEntity>
    implements $RecommendEntityCopyWith<$Res> {
  _$RecommendEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecommendEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breakingNews = null,
    Object? top5BestChatRooms = null,
    Object? top5BestIssueRooms = null,
    Object? chatRoomResponse = freezed,
  }) {
    return _then(_value.copyWith(
      breakingNews: null == breakingNews
          ? _value.breakingNews
          : breakingNews // ignore: cast_nullable_to_non_nullable
              as List<BreakingNewsEntity>,
      top5BestChatRooms: null == top5BestChatRooms
          ? _value.top5BestChatRooms
          : top5BestChatRooms // ignore: cast_nullable_to_non_nullable
              as List<BestChatRoomEntity>,
      top5BestIssueRooms: null == top5BestIssueRooms
          ? _value.top5BestIssueRooms
          : top5BestIssueRooms // ignore: cast_nullable_to_non_nullable
              as List<BestIssueRoomEntity>,
      chatRoomResponse: freezed == chatRoomResponse
          ? _value.chatRoomResponse
          : chatRoomResponse // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomResponseEntity>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecommendEntityImplCopyWith<$Res>
    implements $RecommendEntityCopyWith<$Res> {
  factory _$$RecommendEntityImplCopyWith(_$RecommendEntityImpl value,
          $Res Function(_$RecommendEntityImpl) then) =
      __$$RecommendEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BreakingNewsEntity> breakingNews,
      List<BestChatRoomEntity> top5BestChatRooms,
      List<BestIssueRoomEntity> top5BestIssueRooms,
      List<ChatRoomResponseEntity>? chatRoomResponse});
}

/// @nodoc
class __$$RecommendEntityImplCopyWithImpl<$Res>
    extends _$RecommendEntityCopyWithImpl<$Res, _$RecommendEntityImpl>
    implements _$$RecommendEntityImplCopyWith<$Res> {
  __$$RecommendEntityImplCopyWithImpl(
      _$RecommendEntityImpl _value, $Res Function(_$RecommendEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecommendEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? breakingNews = null,
    Object? top5BestChatRooms = null,
    Object? top5BestIssueRooms = null,
    Object? chatRoomResponse = freezed,
  }) {
    return _then(_$RecommendEntityImpl(
      breakingNews: null == breakingNews
          ? _value._breakingNews
          : breakingNews // ignore: cast_nullable_to_non_nullable
              as List<BreakingNewsEntity>,
      top5BestChatRooms: null == top5BestChatRooms
          ? _value._top5BestChatRooms
          : top5BestChatRooms // ignore: cast_nullable_to_non_nullable
              as List<BestChatRoomEntity>,
      top5BestIssueRooms: null == top5BestIssueRooms
          ? _value._top5BestIssueRooms
          : top5BestIssueRooms // ignore: cast_nullable_to_non_nullable
              as List<BestIssueRoomEntity>,
      chatRoomResponse: freezed == chatRoomResponse
          ? _value._chatRoomResponse
          : chatRoomResponse // ignore: cast_nullable_to_non_nullable
              as List<ChatRoomResponseEntity>?,
    ));
  }
}

/// @nodoc

class _$RecommendEntityImpl implements _RecommendEntity {
  _$RecommendEntityImpl(
      {required final List<BreakingNewsEntity> breakingNews,
      required final List<BestChatRoomEntity> top5BestChatRooms,
      required final List<BestIssueRoomEntity> top5BestIssueRooms,
      required final List<ChatRoomResponseEntity>? chatRoomResponse})
      : _breakingNews = breakingNews,
        _top5BestChatRooms = top5BestChatRooms,
        _top5BestIssueRooms = top5BestIssueRooms,
        _chatRoomResponse = chatRoomResponse;

  final List<BreakingNewsEntity> _breakingNews;
  @override
  List<BreakingNewsEntity> get breakingNews {
    if (_breakingNews is EqualUnmodifiableListView) return _breakingNews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_breakingNews);
  }

  final List<BestChatRoomEntity> _top5BestChatRooms;
  @override
  List<BestChatRoomEntity> get top5BestChatRooms {
    if (_top5BestChatRooms is EqualUnmodifiableListView)
      return _top5BestChatRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top5BestChatRooms);
  }

  final List<BestIssueRoomEntity> _top5BestIssueRooms;
  @override
  List<BestIssueRoomEntity> get top5BestIssueRooms {
    if (_top5BestIssueRooms is EqualUnmodifiableListView)
      return _top5BestIssueRooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_top5BestIssueRooms);
  }

  final List<ChatRoomResponseEntity>? _chatRoomResponse;
  @override
  List<ChatRoomResponseEntity>? get chatRoomResponse {
    final value = _chatRoomResponse;
    if (value == null) return null;
    if (_chatRoomResponse is EqualUnmodifiableListView)
      return _chatRoomResponse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecommendEntity(breakingNews: $breakingNews, top5BestChatRooms: $top5BestChatRooms, top5BestIssueRooms: $top5BestIssueRooms, chatRoomResponse: $chatRoomResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecommendEntityImpl &&
            const DeepCollectionEquality()
                .equals(other._breakingNews, _breakingNews) &&
            const DeepCollectionEquality()
                .equals(other._top5BestChatRooms, _top5BestChatRooms) &&
            const DeepCollectionEquality()
                .equals(other._top5BestIssueRooms, _top5BestIssueRooms) &&
            const DeepCollectionEquality()
                .equals(other._chatRoomResponse, _chatRoomResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_breakingNews),
      const DeepCollectionEquality().hash(_top5BestChatRooms),
      const DeepCollectionEquality().hash(_top5BestIssueRooms),
      const DeepCollectionEquality().hash(_chatRoomResponse));

  /// Create a copy of RecommendEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecommendEntityImplCopyWith<_$RecommendEntityImpl> get copyWith =>
      __$$RecommendEntityImplCopyWithImpl<_$RecommendEntityImpl>(
          this, _$identity);
}

abstract class _RecommendEntity implements RecommendEntity {
  factory _RecommendEntity(
          {required final List<BreakingNewsEntity> breakingNews,
          required final List<BestChatRoomEntity> top5BestChatRooms,
          required final List<BestIssueRoomEntity> top5BestIssueRooms,
          required final List<ChatRoomResponseEntity>? chatRoomResponse}) =
      _$RecommendEntityImpl;

  @override
  List<BreakingNewsEntity> get breakingNews;
  @override
  List<BestChatRoomEntity> get top5BestChatRooms;
  @override
  List<BestIssueRoomEntity> get top5BestIssueRooms;
  @override
  List<ChatRoomResponseEntity>? get chatRoomResponse;

  /// Create a copy of RecommendEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecommendEntityImplCopyWith<_$RecommendEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
