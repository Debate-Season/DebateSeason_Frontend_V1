// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_reason_selection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReportReasonSelection {

 bool get isAbusive;// 욕설
 bool get isSexual;// 음란
 bool get isFalseInfo;// 허위
 bool get isSpam;// 도배
 bool get isPromotion;// 홍보
 bool get isPrivacyLeak;// 개인정보 노출
 bool get isEtc;// 기타
 String? get etcDescription;
/// Create a copy of ReportReasonSelection
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportReasonSelectionCopyWith<ReportReasonSelection> get copyWith => _$ReportReasonSelectionCopyWithImpl<ReportReasonSelection>(this as ReportReasonSelection, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportReasonSelection&&(identical(other.isAbusive, isAbusive) || other.isAbusive == isAbusive)&&(identical(other.isSexual, isSexual) || other.isSexual == isSexual)&&(identical(other.isFalseInfo, isFalseInfo) || other.isFalseInfo == isFalseInfo)&&(identical(other.isSpam, isSpam) || other.isSpam == isSpam)&&(identical(other.isPromotion, isPromotion) || other.isPromotion == isPromotion)&&(identical(other.isPrivacyLeak, isPrivacyLeak) || other.isPrivacyLeak == isPrivacyLeak)&&(identical(other.isEtc, isEtc) || other.isEtc == isEtc)&&(identical(other.etcDescription, etcDescription) || other.etcDescription == etcDescription));
}


@override
int get hashCode => Object.hash(runtimeType,isAbusive,isSexual,isFalseInfo,isSpam,isPromotion,isPrivacyLeak,isEtc,etcDescription);

@override
String toString() {
  return 'ReportReasonSelection(isAbusive: $isAbusive, isSexual: $isSexual, isFalseInfo: $isFalseInfo, isSpam: $isSpam, isPromotion: $isPromotion, isPrivacyLeak: $isPrivacyLeak, isEtc: $isEtc, etcDescription: $etcDescription)';
}


}

/// @nodoc
abstract mixin class $ReportReasonSelectionCopyWith<$Res>  {
  factory $ReportReasonSelectionCopyWith(ReportReasonSelection value, $Res Function(ReportReasonSelection) _then) = _$ReportReasonSelectionCopyWithImpl;
@useResult
$Res call({
 bool isAbusive, bool isSexual, bool isFalseInfo, bool isSpam, bool isPromotion, bool isPrivacyLeak, bool isEtc, String? etcDescription
});




}
/// @nodoc
class _$ReportReasonSelectionCopyWithImpl<$Res>
    implements $ReportReasonSelectionCopyWith<$Res> {
  _$ReportReasonSelectionCopyWithImpl(this._self, this._then);

  final ReportReasonSelection _self;
  final $Res Function(ReportReasonSelection) _then;

/// Create a copy of ReportReasonSelection
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAbusive = null,Object? isSexual = null,Object? isFalseInfo = null,Object? isSpam = null,Object? isPromotion = null,Object? isPrivacyLeak = null,Object? isEtc = null,Object? etcDescription = freezed,}) {
  return _then(_self.copyWith(
isAbusive: null == isAbusive ? _self.isAbusive : isAbusive // ignore: cast_nullable_to_non_nullable
as bool,isSexual: null == isSexual ? _self.isSexual : isSexual // ignore: cast_nullable_to_non_nullable
as bool,isFalseInfo: null == isFalseInfo ? _self.isFalseInfo : isFalseInfo // ignore: cast_nullable_to_non_nullable
as bool,isSpam: null == isSpam ? _self.isSpam : isSpam // ignore: cast_nullable_to_non_nullable
as bool,isPromotion: null == isPromotion ? _self.isPromotion : isPromotion // ignore: cast_nullable_to_non_nullable
as bool,isPrivacyLeak: null == isPrivacyLeak ? _self.isPrivacyLeak : isPrivacyLeak // ignore: cast_nullable_to_non_nullable
as bool,isEtc: null == isEtc ? _self.isEtc : isEtc // ignore: cast_nullable_to_non_nullable
as bool,etcDescription: freezed == etcDescription ? _self.etcDescription : etcDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportReasonSelection].
extension ReportReasonSelectionPatterns on ReportReasonSelection {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportReasonSelection value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportReasonSelection() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportReasonSelection value)  $default,){
final _that = this;
switch (_that) {
case _ReportReasonSelection():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportReasonSelection value)?  $default,){
final _that = this;
switch (_that) {
case _ReportReasonSelection() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAbusive,  bool isSexual,  bool isFalseInfo,  bool isSpam,  bool isPromotion,  bool isPrivacyLeak,  bool isEtc,  String? etcDescription)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportReasonSelection() when $default != null:
return $default(_that.isAbusive,_that.isSexual,_that.isFalseInfo,_that.isSpam,_that.isPromotion,_that.isPrivacyLeak,_that.isEtc,_that.etcDescription);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAbusive,  bool isSexual,  bool isFalseInfo,  bool isSpam,  bool isPromotion,  bool isPrivacyLeak,  bool isEtc,  String? etcDescription)  $default,) {final _that = this;
switch (_that) {
case _ReportReasonSelection():
return $default(_that.isAbusive,_that.isSexual,_that.isFalseInfo,_that.isSpam,_that.isPromotion,_that.isPrivacyLeak,_that.isEtc,_that.etcDescription);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAbusive,  bool isSexual,  bool isFalseInfo,  bool isSpam,  bool isPromotion,  bool isPrivacyLeak,  bool isEtc,  String? etcDescription)?  $default,) {final _that = this;
switch (_that) {
case _ReportReasonSelection() when $default != null:
return $default(_that.isAbusive,_that.isSexual,_that.isFalseInfo,_that.isSpam,_that.isPromotion,_that.isPrivacyLeak,_that.isEtc,_that.etcDescription);case _:
  return null;

}
}

}

/// @nodoc


class _ReportReasonSelection extends ReportReasonSelection {
  const _ReportReasonSelection({this.isAbusive = false, this.isSexual = false, this.isFalseInfo = false, this.isSpam = false, this.isPromotion = false, this.isPrivacyLeak = false, this.isEtc = false, this.etcDescription = ""}): super._();
  

@override@JsonKey() final  bool isAbusive;
// 욕설
@override@JsonKey() final  bool isSexual;
// 음란
@override@JsonKey() final  bool isFalseInfo;
// 허위
@override@JsonKey() final  bool isSpam;
// 도배
@override@JsonKey() final  bool isPromotion;
// 홍보
@override@JsonKey() final  bool isPrivacyLeak;
// 개인정보 노출
@override@JsonKey() final  bool isEtc;
// 기타
@override@JsonKey() final  String? etcDescription;

/// Create a copy of ReportReasonSelection
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportReasonSelectionCopyWith<_ReportReasonSelection> get copyWith => __$ReportReasonSelectionCopyWithImpl<_ReportReasonSelection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportReasonSelection&&(identical(other.isAbusive, isAbusive) || other.isAbusive == isAbusive)&&(identical(other.isSexual, isSexual) || other.isSexual == isSexual)&&(identical(other.isFalseInfo, isFalseInfo) || other.isFalseInfo == isFalseInfo)&&(identical(other.isSpam, isSpam) || other.isSpam == isSpam)&&(identical(other.isPromotion, isPromotion) || other.isPromotion == isPromotion)&&(identical(other.isPrivacyLeak, isPrivacyLeak) || other.isPrivacyLeak == isPrivacyLeak)&&(identical(other.isEtc, isEtc) || other.isEtc == isEtc)&&(identical(other.etcDescription, etcDescription) || other.etcDescription == etcDescription));
}


@override
int get hashCode => Object.hash(runtimeType,isAbusive,isSexual,isFalseInfo,isSpam,isPromotion,isPrivacyLeak,isEtc,etcDescription);

@override
String toString() {
  return 'ReportReasonSelection(isAbusive: $isAbusive, isSexual: $isSexual, isFalseInfo: $isFalseInfo, isSpam: $isSpam, isPromotion: $isPromotion, isPrivacyLeak: $isPrivacyLeak, isEtc: $isEtc, etcDescription: $etcDescription)';
}


}

/// @nodoc
abstract mixin class _$ReportReasonSelectionCopyWith<$Res> implements $ReportReasonSelectionCopyWith<$Res> {
  factory _$ReportReasonSelectionCopyWith(_ReportReasonSelection value, $Res Function(_ReportReasonSelection) _then) = __$ReportReasonSelectionCopyWithImpl;
@override @useResult
$Res call({
 bool isAbusive, bool isSexual, bool isFalseInfo, bool isSpam, bool isPromotion, bool isPrivacyLeak, bool isEtc, String? etcDescription
});




}
/// @nodoc
class __$ReportReasonSelectionCopyWithImpl<$Res>
    implements _$ReportReasonSelectionCopyWith<$Res> {
  __$ReportReasonSelectionCopyWithImpl(this._self, this._then);

  final _ReportReasonSelection _self;
  final $Res Function(_ReportReasonSelection) _then;

/// Create a copy of ReportReasonSelection
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAbusive = null,Object? isSexual = null,Object? isFalseInfo = null,Object? isSpam = null,Object? isPromotion = null,Object? isPrivacyLeak = null,Object? isEtc = null,Object? etcDescription = freezed,}) {
  return _then(_ReportReasonSelection(
isAbusive: null == isAbusive ? _self.isAbusive : isAbusive // ignore: cast_nullable_to_non_nullable
as bool,isSexual: null == isSexual ? _self.isSexual : isSexual // ignore: cast_nullable_to_non_nullable
as bool,isFalseInfo: null == isFalseInfo ? _self.isFalseInfo : isFalseInfo // ignore: cast_nullable_to_non_nullable
as bool,isSpam: null == isSpam ? _self.isSpam : isSpam // ignore: cast_nullable_to_non_nullable
as bool,isPromotion: null == isPromotion ? _self.isPromotion : isPromotion // ignore: cast_nullable_to_non_nullable
as bool,isPrivacyLeak: null == isPrivacyLeak ? _self.isPrivacyLeak : isPrivacyLeak // ignore: cast_nullable_to_non_nullable
as bool,isEtc: null == isEtc ? _self.isEtc : isEtc // ignore: cast_nullable_to_non_nullable
as bool,etcDescription: freezed == etcDescription ? _self.etcDescription : etcDescription // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
