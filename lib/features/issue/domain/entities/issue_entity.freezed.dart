// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'issue_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IssueEntity {

 String get title; Map<String, int> get map; List<ChatRoomEntity> get chatRoomMap;
/// Create a copy of IssueEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IssueEntityCopyWith<IssueEntity> get copyWith => _$IssueEntityCopyWithImpl<IssueEntity>(this as IssueEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IssueEntity&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.map, map)&&const DeepCollectionEquality().equals(other.chatRoomMap, chatRoomMap));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(map),const DeepCollectionEquality().hash(chatRoomMap));

@override
String toString() {
  return 'IssueEntity(title: $title, map: $map, chatRoomMap: $chatRoomMap)';
}


}

/// @nodoc
abstract mixin class $IssueEntityCopyWith<$Res>  {
  factory $IssueEntityCopyWith(IssueEntity value, $Res Function(IssueEntity) _then) = _$IssueEntityCopyWithImpl;
@useResult
$Res call({
 String title, Map<String, int> map, List<ChatRoomEntity> chatRoomMap
});




}
/// @nodoc
class _$IssueEntityCopyWithImpl<$Res>
    implements $IssueEntityCopyWith<$Res> {
  _$IssueEntityCopyWithImpl(this._self, this._then);

  final IssueEntity _self;
  final $Res Function(IssueEntity) _then;

/// Create a copy of IssueEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? map = null,Object? chatRoomMap = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,map: null == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as Map<String, int>,chatRoomMap: null == chatRoomMap ? _self.chatRoomMap : chatRoomMap // ignore: cast_nullable_to_non_nullable
as List<ChatRoomEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [IssueEntity].
extension IssueEntityPatterns on IssueEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IssueEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IssueEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IssueEntity value)  $default,){
final _that = this;
switch (_that) {
case _IssueEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IssueEntity value)?  $default,){
final _that = this;
switch (_that) {
case _IssueEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  Map<String, int> map,  List<ChatRoomEntity> chatRoomMap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IssueEntity() when $default != null:
return $default(_that.title,_that.map,_that.chatRoomMap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  Map<String, int> map,  List<ChatRoomEntity> chatRoomMap)  $default,) {final _that = this;
switch (_that) {
case _IssueEntity():
return $default(_that.title,_that.map,_that.chatRoomMap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  Map<String, int> map,  List<ChatRoomEntity> chatRoomMap)?  $default,) {final _that = this;
switch (_that) {
case _IssueEntity() when $default != null:
return $default(_that.title,_that.map,_that.chatRoomMap);case _:
  return null;

}
}

}

/// @nodoc


class _IssueEntity implements IssueEntity {
   _IssueEntity({required this.title, required final  Map<String, int> map, required final  List<ChatRoomEntity> chatRoomMap}): _map = map,_chatRoomMap = chatRoomMap;
  

@override final  String title;
 final  Map<String, int> _map;
@override Map<String, int> get map {
  if (_map is EqualUnmodifiableMapView) return _map;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_map);
}

 final  List<ChatRoomEntity> _chatRoomMap;
@override List<ChatRoomEntity> get chatRoomMap {
  if (_chatRoomMap is EqualUnmodifiableListView) return _chatRoomMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chatRoomMap);
}


/// Create a copy of IssueEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IssueEntityCopyWith<_IssueEntity> get copyWith => __$IssueEntityCopyWithImpl<_IssueEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IssueEntity&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other._map, _map)&&const DeepCollectionEquality().equals(other._chatRoomMap, _chatRoomMap));
}


@override
int get hashCode => Object.hash(runtimeType,title,const DeepCollectionEquality().hash(_map),const DeepCollectionEquality().hash(_chatRoomMap));

@override
String toString() {
  return 'IssueEntity(title: $title, map: $map, chatRoomMap: $chatRoomMap)';
}


}

/// @nodoc
abstract mixin class _$IssueEntityCopyWith<$Res> implements $IssueEntityCopyWith<$Res> {
  factory _$IssueEntityCopyWith(_IssueEntity value, $Res Function(_IssueEntity) _then) = __$IssueEntityCopyWithImpl;
@override @useResult
$Res call({
 String title, Map<String, int> map, List<ChatRoomEntity> chatRoomMap
});




}
/// @nodoc
class __$IssueEntityCopyWithImpl<$Res>
    implements _$IssueEntityCopyWith<$Res> {
  __$IssueEntityCopyWithImpl(this._self, this._then);

  final _IssueEntity _self;
  final $Res Function(_IssueEntity) _then;

/// Create a copy of IssueEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? map = null,Object? chatRoomMap = null,}) {
  return _then(_IssueEntity(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,map: null == map ? _self._map : map // ignore: cast_nullable_to_non_nullable
as Map<String, int>,chatRoomMap: null == chatRoomMap ? _self._chatRoomMap : chatRoomMap // ignore: cast_nullable_to_non_nullable
as List<ChatRoomEntity>,
  ));
}


}

// dart format on
