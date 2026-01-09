// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_my_agree_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TermsMyAgreeEntity {
  String get termsType => throw _privateConstructorUsedError;
  String get agreedAt => throw _privateConstructorUsedError;
  String get notionUrl => throw _privateConstructorUsedError;

  /// Create a copy of TermsMyAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TermsMyAgreeEntityCopyWith<TermsMyAgreeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsMyAgreeEntityCopyWith<$Res> {
  factory $TermsMyAgreeEntityCopyWith(
          TermsMyAgreeEntity value, $Res Function(TermsMyAgreeEntity) then) =
      _$TermsMyAgreeEntityCopyWithImpl<$Res, TermsMyAgreeEntity>;
  @useResult
  $Res call({String termsType, String agreedAt, String notionUrl});
}

/// @nodoc
class _$TermsMyAgreeEntityCopyWithImpl<$Res, $Val extends TermsMyAgreeEntity>
    implements $TermsMyAgreeEntityCopyWith<$Res> {
  _$TermsMyAgreeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TermsMyAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsType = null,
    Object? agreedAt = null,
    Object? notionUrl = null,
  }) {
    return _then(_value.copyWith(
      termsType: null == termsType
          ? _value.termsType
          : termsType // ignore: cast_nullable_to_non_nullable
              as String,
      agreedAt: null == agreedAt
          ? _value.agreedAt
          : agreedAt // ignore: cast_nullable_to_non_nullable
              as String,
      notionUrl: null == notionUrl
          ? _value.notionUrl
          : notionUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsMyAgreeEntityImplCopyWith<$Res>
    implements $TermsMyAgreeEntityCopyWith<$Res> {
  factory _$$TermsMyAgreeEntityImplCopyWith(_$TermsMyAgreeEntityImpl value,
          $Res Function(_$TermsMyAgreeEntityImpl) then) =
      __$$TermsMyAgreeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String termsType, String agreedAt, String notionUrl});
}

/// @nodoc
class __$$TermsMyAgreeEntityImplCopyWithImpl<$Res>
    extends _$TermsMyAgreeEntityCopyWithImpl<$Res, _$TermsMyAgreeEntityImpl>
    implements _$$TermsMyAgreeEntityImplCopyWith<$Res> {
  __$$TermsMyAgreeEntityImplCopyWithImpl(_$TermsMyAgreeEntityImpl _value,
      $Res Function(_$TermsMyAgreeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TermsMyAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsType = null,
    Object? agreedAt = null,
    Object? notionUrl = null,
  }) {
    return _then(_$TermsMyAgreeEntityImpl(
      termsType: null == termsType
          ? _value.termsType
          : termsType // ignore: cast_nullable_to_non_nullable
              as String,
      agreedAt: null == agreedAt
          ? _value.agreedAt
          : agreedAt // ignore: cast_nullable_to_non_nullable
              as String,
      notionUrl: null == notionUrl
          ? _value.notionUrl
          : notionUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TermsMyAgreeEntityImpl implements _TermsMyAgreeEntity {
  _$TermsMyAgreeEntityImpl(
      {required this.termsType,
      required this.agreedAt,
      required this.notionUrl});

  @override
  final String termsType;
  @override
  final String agreedAt;
  @override
  final String notionUrl;

  @override
  String toString() {
    return 'TermsMyAgreeEntity(termsType: $termsType, agreedAt: $agreedAt, notionUrl: $notionUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsMyAgreeEntityImpl &&
            (identical(other.termsType, termsType) ||
                other.termsType == termsType) &&
            (identical(other.agreedAt, agreedAt) ||
                other.agreedAt == agreedAt) &&
            (identical(other.notionUrl, notionUrl) ||
                other.notionUrl == notionUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, termsType, agreedAt, notionUrl);

  /// Create a copy of TermsMyAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsMyAgreeEntityImplCopyWith<_$TermsMyAgreeEntityImpl> get copyWith =>
      __$$TermsMyAgreeEntityImplCopyWithImpl<_$TermsMyAgreeEntityImpl>(
          this, _$identity);
}

abstract class _TermsMyAgreeEntity implements TermsMyAgreeEntity {
  factory _TermsMyAgreeEntity(
      {required final String termsType,
      required final String agreedAt,
      required final String notionUrl}) = _$TermsMyAgreeEntityImpl;

  @override
  String get termsType;
  @override
  String get agreedAt;
  @override
  String get notionUrl;

  /// Create a copy of TermsMyAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TermsMyAgreeEntityImplCopyWith<_$TermsMyAgreeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
