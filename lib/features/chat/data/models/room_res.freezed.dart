// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RoomRes _$RoomResFromJson(Map<String, dynamic> json) {
  return _RoomRes.fromJson(json);
}

/// @nodoc
mixin _$RoomRes {
  int get chatRoomId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get agree => throw _privateConstructorUsedError;
  int get disagree => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(fromJson: OpinionType.fromJson)
  OpinionType get opinion => throw _privateConstructorUsedError;

  /// Serializes this RoomRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RoomRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomResCopyWith<RoomRes> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomResCopyWith<$Res> {
  factory $RoomResCopyWith(RoomRes value, $Res Function(RoomRes) then) =
      _$RoomResCopyWithImpl<$Res, RoomRes>;
  @useResult
  $Res call(
      {int chatRoomId,
      String title,
      String content,
      int agree,
      int disagree,
      DateTime createdAt,
      @JsonKey(fromJson: OpinionType.fromJson) OpinionType opinion});
}

/// @nodoc
class _$RoomResCopyWithImpl<$Res, $Val extends RoomRes>
    implements $RoomResCopyWith<$Res> {
  _$RoomResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? title = null,
    Object? content = null,
    Object? agree = null,
    Object? disagree = null,
    Object? createdAt = null,
    Object? opinion = null,
  }) {
    return _then(_value.copyWith(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      agree: null == agree
          ? _value.agree
          : agree // ignore: cast_nullable_to_non_nullable
              as int,
      disagree: null == disagree
          ? _value.disagree
          : disagree // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      opinion: null == opinion
          ? _value.opinion
          : opinion // ignore: cast_nullable_to_non_nullable
              as OpinionType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RoomResImplCopyWith<$Res> implements $RoomResCopyWith<$Res> {
  factory _$$RoomResImplCopyWith(
          _$RoomResImpl value, $Res Function(_$RoomResImpl) then) =
      __$$RoomResImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int chatRoomId,
      String title,
      String content,
      int agree,
      int disagree,
      DateTime createdAt,
      @JsonKey(fromJson: OpinionType.fromJson) OpinionType opinion});
}

/// @nodoc
class __$$RoomResImplCopyWithImpl<$Res>
    extends _$RoomResCopyWithImpl<$Res, _$RoomResImpl>
    implements _$$RoomResImplCopyWith<$Res> {
  __$$RoomResImplCopyWithImpl(
      _$RoomResImpl _value, $Res Function(_$RoomResImpl) _then)
      : super(_value, _then);

  /// Create a copy of RoomRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatRoomId = null,
    Object? title = null,
    Object? content = null,
    Object? agree = null,
    Object? disagree = null,
    Object? createdAt = null,
    Object? opinion = null,
  }) {
    return _then(_$RoomResImpl(
      chatRoomId: null == chatRoomId
          ? _value.chatRoomId
          : chatRoomId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      agree: null == agree
          ? _value.agree
          : agree // ignore: cast_nullable_to_non_nullable
              as int,
      disagree: null == disagree
          ? _value.disagree
          : disagree // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      opinion: null == opinion
          ? _value.opinion
          : opinion // ignore: cast_nullable_to_non_nullable
              as OpinionType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RoomResImpl implements _RoomRes {
  const _$RoomResImpl(
      {required this.chatRoomId,
      required this.title,
      required this.content,
      required this.agree,
      required this.disagree,
      required this.createdAt,
      @JsonKey(fromJson: OpinionType.fromJson) required this.opinion});

  factory _$RoomResImpl.fromJson(Map<String, dynamic> json) =>
      _$$RoomResImplFromJson(json);

  @override
  final int chatRoomId;
  @override
  final String title;
  @override
  final String content;
  @override
  final int agree;
  @override
  final int disagree;
  @override
  final DateTime createdAt;
  @override
  @JsonKey(fromJson: OpinionType.fromJson)
  final OpinionType opinion;

  @override
  String toString() {
    return 'RoomRes(chatRoomId: $chatRoomId, title: $title, content: $content, agree: $agree, disagree: $disagree, createdAt: $createdAt, opinion: $opinion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomResImpl &&
            (identical(other.chatRoomId, chatRoomId) ||
                other.chatRoomId == chatRoomId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.agree, agree) || other.agree == agree) &&
            (identical(other.disagree, disagree) ||
                other.disagree == disagree) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.opinion, opinion) || other.opinion == opinion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, chatRoomId, title, content,
      agree, disagree, createdAt, opinion);

  /// Create a copy of RoomRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomResImplCopyWith<_$RoomResImpl> get copyWith =>
      __$$RoomResImplCopyWithImpl<_$RoomResImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RoomResImplToJson(
      this,
    );
  }
}

abstract class _RoomRes implements RoomRes {
  const factory _RoomRes(
      {required final int chatRoomId,
      required final String title,
      required final String content,
      required final int agree,
      required final int disagree,
      required final DateTime createdAt,
      @JsonKey(fromJson: OpinionType.fromJson)
      required final OpinionType opinion}) = _$RoomResImpl;

  factory _RoomRes.fromJson(Map<String, dynamic> json) = _$RoomResImpl.fromJson;

  @override
  int get chatRoomId;
  @override
  String get title;
  @override
  String get content;
  @override
  int get agree;
  @override
  int get disagree;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(fromJson: OpinionType.fromJson)
  OpinionType get opinion;

  /// Create a copy of RoomRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomResImplCopyWith<_$RoomResImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
