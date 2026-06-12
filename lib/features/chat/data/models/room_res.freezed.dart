// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RoomRes {

 int get chatRoomId; String get title; String get content; int get agree; int get disagree; DateTime get createdAt;@JsonKey(fromJson: OpinionType.fromJson) OpinionType get opinion;
/// Create a copy of RoomRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoomResCopyWith<RoomRes> get copyWith => _$RoomResCopyWithImpl<RoomRes>(this as RoomRes, _$identity);

  /// Serializes this RoomRes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoomRes&&(identical(other.chatRoomId, chatRoomId) || other.chatRoomId == chatRoomId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.agree, agree) || other.agree == agree)&&(identical(other.disagree, disagree) || other.disagree == disagree)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.opinion, opinion) || other.opinion == opinion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatRoomId,title,content,agree,disagree,createdAt,opinion);

@override
String toString() {
  return 'RoomRes(chatRoomId: $chatRoomId, title: $title, content: $content, agree: $agree, disagree: $disagree, createdAt: $createdAt, opinion: $opinion)';
}


}

/// @nodoc
abstract mixin class $RoomResCopyWith<$Res>  {
  factory $RoomResCopyWith(RoomRes value, $Res Function(RoomRes) _then) = _$RoomResCopyWithImpl;
@useResult
$Res call({
 int chatRoomId, String title, String content, int agree, int disagree, DateTime createdAt,@JsonKey(fromJson: OpinionType.fromJson) OpinionType opinion
});




}
/// @nodoc
class _$RoomResCopyWithImpl<$Res>
    implements $RoomResCopyWith<$Res> {
  _$RoomResCopyWithImpl(this._self, this._then);

  final RoomRes _self;
  final $Res Function(RoomRes) _then;

/// Create a copy of RoomRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatRoomId = null,Object? title = null,Object? content = null,Object? agree = null,Object? disagree = null,Object? createdAt = null,Object? opinion = null,}) {
  return _then(_self.copyWith(
chatRoomId: null == chatRoomId ? _self.chatRoomId : chatRoomId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,agree: null == agree ? _self.agree : agree // ignore: cast_nullable_to_non_nullable
as int,disagree: null == disagree ? _self.disagree : disagree // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,opinion: null == opinion ? _self.opinion : opinion // ignore: cast_nullable_to_non_nullable
as OpinionType,
  ));
}

}


/// Adds pattern-matching-related methods to [RoomRes].
extension RoomResPatterns on RoomRes {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoomRes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoomRes() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoomRes value)  $default,){
final _that = this;
switch (_that) {
case _RoomRes():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoomRes value)?  $default,){
final _that = this;
switch (_that) {
case _RoomRes() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int chatRoomId,  String title,  String content,  int agree,  int disagree,  DateTime createdAt, @JsonKey(fromJson: OpinionType.fromJson)  OpinionType opinion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoomRes() when $default != null:
return $default(_that.chatRoomId,_that.title,_that.content,_that.agree,_that.disagree,_that.createdAt,_that.opinion);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int chatRoomId,  String title,  String content,  int agree,  int disagree,  DateTime createdAt, @JsonKey(fromJson: OpinionType.fromJson)  OpinionType opinion)  $default,) {final _that = this;
switch (_that) {
case _RoomRes():
return $default(_that.chatRoomId,_that.title,_that.content,_that.agree,_that.disagree,_that.createdAt,_that.opinion);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int chatRoomId,  String title,  String content,  int agree,  int disagree,  DateTime createdAt, @JsonKey(fromJson: OpinionType.fromJson)  OpinionType opinion)?  $default,) {final _that = this;
switch (_that) {
case _RoomRes() when $default != null:
return $default(_that.chatRoomId,_that.title,_that.content,_that.agree,_that.disagree,_that.createdAt,_that.opinion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoomRes implements RoomRes {
  const _RoomRes({required this.chatRoomId, required this.title, required this.content, required this.agree, required this.disagree, required this.createdAt, @JsonKey(fromJson: OpinionType.fromJson) required this.opinion});
  factory _RoomRes.fromJson(Map<String, dynamic> json) => _$RoomResFromJson(json);

@override final  int chatRoomId;
@override final  String title;
@override final  String content;
@override final  int agree;
@override final  int disagree;
@override final  DateTime createdAt;
@override@JsonKey(fromJson: OpinionType.fromJson) final  OpinionType opinion;

/// Create a copy of RoomRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoomResCopyWith<_RoomRes> get copyWith => __$RoomResCopyWithImpl<_RoomRes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoomResToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoomRes&&(identical(other.chatRoomId, chatRoomId) || other.chatRoomId == chatRoomId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.agree, agree) || other.agree == agree)&&(identical(other.disagree, disagree) || other.disagree == disagree)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.opinion, opinion) || other.opinion == opinion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatRoomId,title,content,agree,disagree,createdAt,opinion);

@override
String toString() {
  return 'RoomRes(chatRoomId: $chatRoomId, title: $title, content: $content, agree: $agree, disagree: $disagree, createdAt: $createdAt, opinion: $opinion)';
}


}

/// @nodoc
abstract mixin class _$RoomResCopyWith<$Res> implements $RoomResCopyWith<$Res> {
  factory _$RoomResCopyWith(_RoomRes value, $Res Function(_RoomRes) _then) = __$RoomResCopyWithImpl;
@override @useResult
$Res call({
 int chatRoomId, String title, String content, int agree, int disagree, DateTime createdAt,@JsonKey(fromJson: OpinionType.fromJson) OpinionType opinion
});




}
/// @nodoc
class __$RoomResCopyWithImpl<$Res>
    implements _$RoomResCopyWith<$Res> {
  __$RoomResCopyWithImpl(this._self, this._then);

  final _RoomRes _self;
  final $Res Function(_RoomRes) _then;

/// Create a copy of RoomRes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatRoomId = null,Object? title = null,Object? content = null,Object? agree = null,Object? disagree = null,Object? createdAt = null,Object? opinion = null,}) {
  return _then(_RoomRes(
chatRoomId: null == chatRoomId ? _self.chatRoomId : chatRoomId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,agree: null == agree ? _self.agree : agree // ignore: cast_nullable_to_non_nullable
as int,disagree: null == disagree ? _self.disagree : disagree // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,opinion: null == opinion ? _self.opinion : opinion // ignore: cast_nullable_to_non_nullable
as OpinionType,
  ));
}


}

// dart format on
