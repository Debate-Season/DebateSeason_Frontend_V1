// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recommend_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecommendEntity {

 List<BreakingNewsEntity> get breakingNews; List<BestChatRoomEntity> get top5BestChatRooms; List<BestIssueRoomEntity> get top5BestIssueRooms; List<ChatRoomResponseEntity>? get chatRoomResponse;
/// Create a copy of RecommendEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendEntityCopyWith<RecommendEntity> get copyWith => _$RecommendEntityCopyWithImpl<RecommendEntity>(this as RecommendEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendEntity&&const DeepCollectionEquality().equals(other.breakingNews, breakingNews)&&const DeepCollectionEquality().equals(other.top5BestChatRooms, top5BestChatRooms)&&const DeepCollectionEquality().equals(other.top5BestIssueRooms, top5BestIssueRooms)&&const DeepCollectionEquality().equals(other.chatRoomResponse, chatRoomResponse));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(breakingNews),const DeepCollectionEquality().hash(top5BestChatRooms),const DeepCollectionEquality().hash(top5BestIssueRooms),const DeepCollectionEquality().hash(chatRoomResponse));

@override
String toString() {
  return 'RecommendEntity(breakingNews: $breakingNews, top5BestChatRooms: $top5BestChatRooms, top5BestIssueRooms: $top5BestIssueRooms, chatRoomResponse: $chatRoomResponse)';
}


}

/// @nodoc
abstract mixin class $RecommendEntityCopyWith<$Res>  {
  factory $RecommendEntityCopyWith(RecommendEntity value, $Res Function(RecommendEntity) _then) = _$RecommendEntityCopyWithImpl;
@useResult
$Res call({
 List<BreakingNewsEntity> breakingNews, List<BestChatRoomEntity> top5BestChatRooms, List<BestIssueRoomEntity> top5BestIssueRooms, List<ChatRoomResponseEntity>? chatRoomResponse
});




}
/// @nodoc
class _$RecommendEntityCopyWithImpl<$Res>
    implements $RecommendEntityCopyWith<$Res> {
  _$RecommendEntityCopyWithImpl(this._self, this._then);

  final RecommendEntity _self;
  final $Res Function(RecommendEntity) _then;

/// Create a copy of RecommendEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? breakingNews = null,Object? top5BestChatRooms = null,Object? top5BestIssueRooms = null,Object? chatRoomResponse = freezed,}) {
  return _then(_self.copyWith(
breakingNews: null == breakingNews ? _self.breakingNews : breakingNews // ignore: cast_nullable_to_non_nullable
as List<BreakingNewsEntity>,top5BestChatRooms: null == top5BestChatRooms ? _self.top5BestChatRooms : top5BestChatRooms // ignore: cast_nullable_to_non_nullable
as List<BestChatRoomEntity>,top5BestIssueRooms: null == top5BestIssueRooms ? _self.top5BestIssueRooms : top5BestIssueRooms // ignore: cast_nullable_to_non_nullable
as List<BestIssueRoomEntity>,chatRoomResponse: freezed == chatRoomResponse ? _self.chatRoomResponse : chatRoomResponse // ignore: cast_nullable_to_non_nullable
as List<ChatRoomResponseEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendEntity].
extension RecommendEntityPatterns on RecommendEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendEntity value)  $default,){
final _that = this;
switch (_that) {
case _RecommendEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<BreakingNewsEntity> breakingNews,  List<BestChatRoomEntity> top5BestChatRooms,  List<BestIssueRoomEntity> top5BestIssueRooms,  List<ChatRoomResponseEntity>? chatRoomResponse)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendEntity() when $default != null:
return $default(_that.breakingNews,_that.top5BestChatRooms,_that.top5BestIssueRooms,_that.chatRoomResponse);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<BreakingNewsEntity> breakingNews,  List<BestChatRoomEntity> top5BestChatRooms,  List<BestIssueRoomEntity> top5BestIssueRooms,  List<ChatRoomResponseEntity>? chatRoomResponse)  $default,) {final _that = this;
switch (_that) {
case _RecommendEntity():
return $default(_that.breakingNews,_that.top5BestChatRooms,_that.top5BestIssueRooms,_that.chatRoomResponse);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<BreakingNewsEntity> breakingNews,  List<BestChatRoomEntity> top5BestChatRooms,  List<BestIssueRoomEntity> top5BestIssueRooms,  List<ChatRoomResponseEntity>? chatRoomResponse)?  $default,) {final _that = this;
switch (_that) {
case _RecommendEntity() when $default != null:
return $default(_that.breakingNews,_that.top5BestChatRooms,_that.top5BestIssueRooms,_that.chatRoomResponse);case _:
  return null;

}
}

}

/// @nodoc


class _RecommendEntity implements RecommendEntity {
   _RecommendEntity({required final  List<BreakingNewsEntity> breakingNews, required final  List<BestChatRoomEntity> top5BestChatRooms, required final  List<BestIssueRoomEntity> top5BestIssueRooms, required final  List<ChatRoomResponseEntity>? chatRoomResponse}): _breakingNews = breakingNews,_top5BestChatRooms = top5BestChatRooms,_top5BestIssueRooms = top5BestIssueRooms,_chatRoomResponse = chatRoomResponse;
  

 final  List<BreakingNewsEntity> _breakingNews;
@override List<BreakingNewsEntity> get breakingNews {
  if (_breakingNews is EqualUnmodifiableListView) return _breakingNews;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_breakingNews);
}

 final  List<BestChatRoomEntity> _top5BestChatRooms;
@override List<BestChatRoomEntity> get top5BestChatRooms {
  if (_top5BestChatRooms is EqualUnmodifiableListView) return _top5BestChatRooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_top5BestChatRooms);
}

 final  List<BestIssueRoomEntity> _top5BestIssueRooms;
@override List<BestIssueRoomEntity> get top5BestIssueRooms {
  if (_top5BestIssueRooms is EqualUnmodifiableListView) return _top5BestIssueRooms;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_top5BestIssueRooms);
}

 final  List<ChatRoomResponseEntity>? _chatRoomResponse;
@override List<ChatRoomResponseEntity>? get chatRoomResponse {
  final value = _chatRoomResponse;
  if (value == null) return null;
  if (_chatRoomResponse is EqualUnmodifiableListView) return _chatRoomResponse;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RecommendEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendEntityCopyWith<_RecommendEntity> get copyWith => __$RecommendEntityCopyWithImpl<_RecommendEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendEntity&&const DeepCollectionEquality().equals(other._breakingNews, _breakingNews)&&const DeepCollectionEquality().equals(other._top5BestChatRooms, _top5BestChatRooms)&&const DeepCollectionEquality().equals(other._top5BestIssueRooms, _top5BestIssueRooms)&&const DeepCollectionEquality().equals(other._chatRoomResponse, _chatRoomResponse));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_breakingNews),const DeepCollectionEquality().hash(_top5BestChatRooms),const DeepCollectionEquality().hash(_top5BestIssueRooms),const DeepCollectionEquality().hash(_chatRoomResponse));

@override
String toString() {
  return 'RecommendEntity(breakingNews: $breakingNews, top5BestChatRooms: $top5BestChatRooms, top5BestIssueRooms: $top5BestIssueRooms, chatRoomResponse: $chatRoomResponse)';
}


}

/// @nodoc
abstract mixin class _$RecommendEntityCopyWith<$Res> implements $RecommendEntityCopyWith<$Res> {
  factory _$RecommendEntityCopyWith(_RecommendEntity value, $Res Function(_RecommendEntity) _then) = __$RecommendEntityCopyWithImpl;
@override @useResult
$Res call({
 List<BreakingNewsEntity> breakingNews, List<BestChatRoomEntity> top5BestChatRooms, List<BestIssueRoomEntity> top5BestIssueRooms, List<ChatRoomResponseEntity>? chatRoomResponse
});




}
/// @nodoc
class __$RecommendEntityCopyWithImpl<$Res>
    implements _$RecommendEntityCopyWith<$Res> {
  __$RecommendEntityCopyWithImpl(this._self, this._then);

  final _RecommendEntity _self;
  final $Res Function(_RecommendEntity) _then;

/// Create a copy of RecommendEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? breakingNews = null,Object? top5BestChatRooms = null,Object? top5BestIssueRooms = null,Object? chatRoomResponse = freezed,}) {
  return _then(_RecommendEntity(
breakingNews: null == breakingNews ? _self._breakingNews : breakingNews // ignore: cast_nullable_to_non_nullable
as List<BreakingNewsEntity>,top5BestChatRooms: null == top5BestChatRooms ? _self._top5BestChatRooms : top5BestChatRooms // ignore: cast_nullable_to_non_nullable
as List<BestChatRoomEntity>,top5BestIssueRooms: null == top5BestIssueRooms ? _self._top5BestIssueRooms : top5BestIssueRooms // ignore: cast_nullable_to_non_nullable
as List<BestIssueRoomEntity>,chatRoomResponse: freezed == chatRoomResponse ? _self._chatRoomResponse : chatRoomResponse // ignore: cast_nullable_to_non_nullable
as List<ChatRoomResponseEntity>?,
  ));
}


}

// dart format on
