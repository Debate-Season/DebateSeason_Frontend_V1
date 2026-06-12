// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_agree_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TermsAgreeEntity {

 int get termsId; bool get agreed;
/// Create a copy of TermsAgreeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TermsAgreeEntityCopyWith<TermsAgreeEntity> get copyWith => _$TermsAgreeEntityCopyWithImpl<TermsAgreeEntity>(this as TermsAgreeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TermsAgreeEntity&&(identical(other.termsId, termsId) || other.termsId == termsId)&&(identical(other.agreed, agreed) || other.agreed == agreed));
}


@override
int get hashCode => Object.hash(runtimeType,termsId,agreed);

@override
String toString() {
  return 'TermsAgreeEntity(termsId: $termsId, agreed: $agreed)';
}


}

/// @nodoc
abstract mixin class $TermsAgreeEntityCopyWith<$Res>  {
  factory $TermsAgreeEntityCopyWith(TermsAgreeEntity value, $Res Function(TermsAgreeEntity) _then) = _$TermsAgreeEntityCopyWithImpl;
@useResult
$Res call({
 int termsId, bool agreed
});




}
/// @nodoc
class _$TermsAgreeEntityCopyWithImpl<$Res>
    implements $TermsAgreeEntityCopyWith<$Res> {
  _$TermsAgreeEntityCopyWithImpl(this._self, this._then);

  final TermsAgreeEntity _self;
  final $Res Function(TermsAgreeEntity) _then;

/// Create a copy of TermsAgreeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? termsId = null,Object? agreed = null,}) {
  return _then(_self.copyWith(
termsId: null == termsId ? _self.termsId : termsId // ignore: cast_nullable_to_non_nullable
as int,agreed: null == agreed ? _self.agreed : agreed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TermsAgreeEntity].
extension TermsAgreeEntityPatterns on TermsAgreeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TermsAgreeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TermsAgreeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TermsAgreeEntity value)  $default,){
final _that = this;
switch (_that) {
case _TermsAgreeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TermsAgreeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TermsAgreeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int termsId,  bool agreed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TermsAgreeEntity() when $default != null:
return $default(_that.termsId,_that.agreed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int termsId,  bool agreed)  $default,) {final _that = this;
switch (_that) {
case _TermsAgreeEntity():
return $default(_that.termsId,_that.agreed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int termsId,  bool agreed)?  $default,) {final _that = this;
switch (_that) {
case _TermsAgreeEntity() when $default != null:
return $default(_that.termsId,_that.agreed);case _:
  return null;

}
}

}

/// @nodoc


class _TermsAgreeEntity implements TermsAgreeEntity {
   _TermsAgreeEntity({required this.termsId, required this.agreed});
  

@override final  int termsId;
@override final  bool agreed;

/// Create a copy of TermsAgreeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TermsAgreeEntityCopyWith<_TermsAgreeEntity> get copyWith => __$TermsAgreeEntityCopyWithImpl<_TermsAgreeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TermsAgreeEntity&&(identical(other.termsId, termsId) || other.termsId == termsId)&&(identical(other.agreed, agreed) || other.agreed == agreed));
}


@override
int get hashCode => Object.hash(runtimeType,termsId,agreed);

@override
String toString() {
  return 'TermsAgreeEntity(termsId: $termsId, agreed: $agreed)';
}


}

/// @nodoc
abstract mixin class _$TermsAgreeEntityCopyWith<$Res> implements $TermsAgreeEntityCopyWith<$Res> {
  factory _$TermsAgreeEntityCopyWith(_TermsAgreeEntity value, $Res Function(_TermsAgreeEntity) _then) = __$TermsAgreeEntityCopyWithImpl;
@override @useResult
$Res call({
 int termsId, bool agreed
});




}
/// @nodoc
class __$TermsAgreeEntityCopyWithImpl<$Res>
    implements _$TermsAgreeEntityCopyWith<$Res> {
  __$TermsAgreeEntityCopyWithImpl(this._self, this._then);

  final _TermsAgreeEntity _self;
  final $Res Function(_TermsAgreeEntity) _then;

/// Create a copy of TermsAgreeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? termsId = null,Object? agreed = null,}) {
  return _then(_TermsAgreeEntity(
termsId: null == termsId ? _self.termsId : termsId // ignore: cast_nullable_to_non_nullable
as int,agreed: null == agreed ? _self.agreed : agreed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
