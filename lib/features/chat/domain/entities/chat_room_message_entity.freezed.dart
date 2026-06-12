// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_message_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatRoomMessageEntity {

 String get nextCursor; List<ChatMessageEntity> get items; bool get hasMore; int get totalCount;
/// Create a copy of ChatRoomMessageEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatRoomMessageEntityCopyWith<ChatRoomMessageEntity> get copyWith => _$ChatRoomMessageEntityCopyWithImpl<ChatRoomMessageEntity>(this as ChatRoomMessageEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatRoomMessageEntity&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,nextCursor,const DeepCollectionEquality().hash(items),hasMore,totalCount);

@override
String toString() {
  return 'ChatRoomMessageEntity(nextCursor: $nextCursor, items: $items, hasMore: $hasMore, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $ChatRoomMessageEntityCopyWith<$Res>  {
  factory $ChatRoomMessageEntityCopyWith(ChatRoomMessageEntity value, $Res Function(ChatRoomMessageEntity) _then) = _$ChatRoomMessageEntityCopyWithImpl;
@useResult
$Res call({
 String nextCursor, List<ChatMessageEntity> items, bool hasMore, int totalCount
});




}
/// @nodoc
class _$ChatRoomMessageEntityCopyWithImpl<$Res>
    implements $ChatRoomMessageEntityCopyWith<$Res> {
  _$ChatRoomMessageEntityCopyWithImpl(this._self, this._then);

  final ChatRoomMessageEntity _self;
  final $Res Function(ChatRoomMessageEntity) _then;

/// Create a copy of ChatRoomMessageEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nextCursor = null,Object? items = null,Object? hasMore = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
nextCursor: null == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ChatMessageEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatRoomMessageEntity].
extension ChatRoomMessageEntityPatterns on ChatRoomMessageEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatRoomMessageEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatRoomMessageEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatRoomMessageEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChatRoomMessageEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatRoomMessageEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChatRoomMessageEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nextCursor,  List<ChatMessageEntity> items,  bool hasMore,  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatRoomMessageEntity() when $default != null:
return $default(_that.nextCursor,_that.items,_that.hasMore,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nextCursor,  List<ChatMessageEntity> items,  bool hasMore,  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _ChatRoomMessageEntity():
return $default(_that.nextCursor,_that.items,_that.hasMore,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nextCursor,  List<ChatMessageEntity> items,  bool hasMore,  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _ChatRoomMessageEntity() when $default != null:
return $default(_that.nextCursor,_that.items,_that.hasMore,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc


class _ChatRoomMessageEntity implements ChatRoomMessageEntity {
   _ChatRoomMessageEntity({required this.nextCursor, required final  List<ChatMessageEntity> items, required this.hasMore, required this.totalCount}): _items = items;
  

@override final  String nextCursor;
 final  List<ChatMessageEntity> _items;
@override List<ChatMessageEntity> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  bool hasMore;
@override final  int totalCount;

/// Create a copy of ChatRoomMessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatRoomMessageEntityCopyWith<_ChatRoomMessageEntity> get copyWith => __$ChatRoomMessageEntityCopyWithImpl<_ChatRoomMessageEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatRoomMessageEntity&&(identical(other.nextCursor, nextCursor) || other.nextCursor == nextCursor)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}


@override
int get hashCode => Object.hash(runtimeType,nextCursor,const DeepCollectionEquality().hash(_items),hasMore,totalCount);

@override
String toString() {
  return 'ChatRoomMessageEntity(nextCursor: $nextCursor, items: $items, hasMore: $hasMore, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$ChatRoomMessageEntityCopyWith<$Res> implements $ChatRoomMessageEntityCopyWith<$Res> {
  factory _$ChatRoomMessageEntityCopyWith(_ChatRoomMessageEntity value, $Res Function(_ChatRoomMessageEntity) _then) = __$ChatRoomMessageEntityCopyWithImpl;
@override @useResult
$Res call({
 String nextCursor, List<ChatMessageEntity> items, bool hasMore, int totalCount
});




}
/// @nodoc
class __$ChatRoomMessageEntityCopyWithImpl<$Res>
    implements _$ChatRoomMessageEntityCopyWith<$Res> {
  __$ChatRoomMessageEntityCopyWithImpl(this._self, this._then);

  final _ChatRoomMessageEntity _self;
  final $Res Function(_ChatRoomMessageEntity) _then;

/// Create a copy of ChatRoomMessageEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nextCursor = null,Object? items = null,Object? hasMore = null,Object? totalCount = null,}) {
  return _then(_ChatRoomMessageEntity(
nextCursor: null == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ChatMessageEntity>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
