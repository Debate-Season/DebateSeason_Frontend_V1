// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEntity {

 String get profileImage; String get nickname; String get gender; String get ageRange; CommunityEntity get community; String? get residenceProvince; String? get residenceDistrict; String get hometownProvince; String get hometownDistrict;
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<ProfileEntity> get copyWith => _$ProfileEntityCopyWithImpl<ProfileEntity>(this as ProfileEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntity&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ageRange, ageRange) || other.ageRange == ageRange)&&(identical(other.community, community) || other.community == community)&&(identical(other.residenceProvince, residenceProvince) || other.residenceProvince == residenceProvince)&&(identical(other.residenceDistrict, residenceDistrict) || other.residenceDistrict == residenceDistrict)&&(identical(other.hometownProvince, hometownProvince) || other.hometownProvince == hometownProvince)&&(identical(other.hometownDistrict, hometownDistrict) || other.hometownDistrict == hometownDistrict));
}


@override
int get hashCode => Object.hash(runtimeType,profileImage,nickname,gender,ageRange,community,residenceProvince,residenceDistrict,hometownProvince,hometownDistrict);

@override
String toString() {
  return 'ProfileEntity(profileImage: $profileImage, nickname: $nickname, gender: $gender, ageRange: $ageRange, community: $community, residenceProvince: $residenceProvince, residenceDistrict: $residenceDistrict, hometownProvince: $hometownProvince, hometownDistrict: $hometownDistrict)';
}


}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res>  {
  factory $ProfileEntityCopyWith(ProfileEntity value, $Res Function(ProfileEntity) _then) = _$ProfileEntityCopyWithImpl;
@useResult
$Res call({
 String profileImage, String nickname, String gender, String ageRange, CommunityEntity community, String? residenceProvince, String? residenceDistrict, String hometownProvince, String hometownDistrict
});


$CommunityEntityCopyWith<$Res> get community;

}
/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileImage = null,Object? nickname = null,Object? gender = null,Object? ageRange = null,Object? community = null,Object? residenceProvince = freezed,Object? residenceDistrict = freezed,Object? hometownProvince = null,Object? hometownDistrict = null,}) {
  return _then(_self.copyWith(
profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,ageRange: null == ageRange ? _self.ageRange : ageRange // ignore: cast_nullable_to_non_nullable
as String,community: null == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as CommunityEntity,residenceProvince: freezed == residenceProvince ? _self.residenceProvince : residenceProvince // ignore: cast_nullable_to_non_nullable
as String?,residenceDistrict: freezed == residenceDistrict ? _self.residenceDistrict : residenceDistrict // ignore: cast_nullable_to_non_nullable
as String?,hometownProvince: null == hometownProvince ? _self.hometownProvince : hometownProvince // ignore: cast_nullable_to_non_nullable
as String,hometownDistrict: null == hometownDistrict ? _self.hometownDistrict : hometownDistrict // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityEntityCopyWith<$Res> get community {
  
  return $CommunityEntityCopyWith<$Res>(_self.community, (value) {
    return _then(_self.copyWith(community: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileEntity].
extension ProfileEntityPatterns on ProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String profileImage,  String nickname,  String gender,  String ageRange,  CommunityEntity community,  String? residenceProvince,  String? residenceDistrict,  String hometownProvince,  String hometownDistrict)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.profileImage,_that.nickname,_that.gender,_that.ageRange,_that.community,_that.residenceProvince,_that.residenceDistrict,_that.hometownProvince,_that.hometownDistrict);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String profileImage,  String nickname,  String gender,  String ageRange,  CommunityEntity community,  String? residenceProvince,  String? residenceDistrict,  String hometownProvince,  String hometownDistrict)  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity():
return $default(_that.profileImage,_that.nickname,_that.gender,_that.ageRange,_that.community,_that.residenceProvince,_that.residenceDistrict,_that.hometownProvince,_that.hometownDistrict);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String profileImage,  String nickname,  String gender,  String ageRange,  CommunityEntity community,  String? residenceProvince,  String? residenceDistrict,  String hometownProvince,  String hometownDistrict)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.profileImage,_that.nickname,_that.gender,_that.ageRange,_that.community,_that.residenceProvince,_that.residenceDistrict,_that.hometownProvince,_that.hometownDistrict);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileEntity implements ProfileEntity {
   _ProfileEntity({this.profileImage = '', required this.nickname, required this.gender, required this.ageRange, required this.community, this.residenceProvince, this.residenceDistrict, required this.hometownProvince, required this.hometownDistrict});
  

@override@JsonKey() final  String profileImage;
@override final  String nickname;
@override final  String gender;
@override final  String ageRange;
@override final  CommunityEntity community;
@override final  String? residenceProvince;
@override final  String? residenceDistrict;
@override final  String hometownProvince;
@override final  String hometownDistrict;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEntityCopyWith<_ProfileEntity> get copyWith => __$ProfileEntityCopyWithImpl<_ProfileEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEntity&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.ageRange, ageRange) || other.ageRange == ageRange)&&(identical(other.community, community) || other.community == community)&&(identical(other.residenceProvince, residenceProvince) || other.residenceProvince == residenceProvince)&&(identical(other.residenceDistrict, residenceDistrict) || other.residenceDistrict == residenceDistrict)&&(identical(other.hometownProvince, hometownProvince) || other.hometownProvince == hometownProvince)&&(identical(other.hometownDistrict, hometownDistrict) || other.hometownDistrict == hometownDistrict));
}


@override
int get hashCode => Object.hash(runtimeType,profileImage,nickname,gender,ageRange,community,residenceProvince,residenceDistrict,hometownProvince,hometownDistrict);

@override
String toString() {
  return 'ProfileEntity(profileImage: $profileImage, nickname: $nickname, gender: $gender, ageRange: $ageRange, community: $community, residenceProvince: $residenceProvince, residenceDistrict: $residenceDistrict, hometownProvince: $hometownProvince, hometownDistrict: $hometownDistrict)';
}


}

/// @nodoc
abstract mixin class _$ProfileEntityCopyWith<$Res> implements $ProfileEntityCopyWith<$Res> {
  factory _$ProfileEntityCopyWith(_ProfileEntity value, $Res Function(_ProfileEntity) _then) = __$ProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String profileImage, String nickname, String gender, String ageRange, CommunityEntity community, String? residenceProvince, String? residenceDistrict, String hometownProvince, String hometownDistrict
});


@override $CommunityEntityCopyWith<$Res> get community;

}
/// @nodoc
class __$ProfileEntityCopyWithImpl<$Res>
    implements _$ProfileEntityCopyWith<$Res> {
  __$ProfileEntityCopyWithImpl(this._self, this._then);

  final _ProfileEntity _self;
  final $Res Function(_ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileImage = null,Object? nickname = null,Object? gender = null,Object? ageRange = null,Object? community = null,Object? residenceProvince = freezed,Object? residenceDistrict = freezed,Object? hometownProvince = null,Object? hometownDistrict = null,}) {
  return _then(_ProfileEntity(
profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String,ageRange: null == ageRange ? _self.ageRange : ageRange // ignore: cast_nullable_to_non_nullable
as String,community: null == community ? _self.community : community // ignore: cast_nullable_to_non_nullable
as CommunityEntity,residenceProvince: freezed == residenceProvince ? _self.residenceProvince : residenceProvince // ignore: cast_nullable_to_non_nullable
as String?,residenceDistrict: freezed == residenceDistrict ? _self.residenceDistrict : residenceDistrict // ignore: cast_nullable_to_non_nullable
as String?,hometownProvince: null == hometownProvince ? _self.hometownProvince : hometownProvince // ignore: cast_nullable_to_non_nullable
as String,hometownDistrict: null == hometownDistrict ? _self.hometownDistrict : hometownDistrict // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommunityEntityCopyWith<$Res> get community {
  
  return $CommunityEntityCopyWith<$Res>(_self.community, (value) {
    return _then(_self.copyWith(community: value));
  });
}
}

// dart format on
