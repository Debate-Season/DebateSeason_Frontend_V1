// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TermsEntity {
  int get termsId => throw _privateConstructorUsedError;
  String get termsType => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get notionUrl => throw _privateConstructorUsedError;

  /// Create a copy of TermsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TermsEntityCopyWith<TermsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsEntityCopyWith<$Res> {
  factory $TermsEntityCopyWith(
          TermsEntity value, $Res Function(TermsEntity) then) =
      _$TermsEntityCopyWithImpl<$Res, TermsEntity>;
  @useResult
  $Res call({int termsId, String termsType, String version, String notionUrl});
}

/// @nodoc
class _$TermsEntityCopyWithImpl<$Res, $Val extends TermsEntity>
    implements $TermsEntityCopyWith<$Res> {
  _$TermsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TermsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsId = null,
    Object? termsType = null,
    Object? version = null,
    Object? notionUrl = null,
  }) {
    return _then(_value.copyWith(
      termsId: null == termsId
          ? _value.termsId
          : termsId // ignore: cast_nullable_to_non_nullable
              as int,
      termsType: null == termsType
          ? _value.termsType
          : termsType // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      notionUrl: null == notionUrl
          ? _value.notionUrl
          : notionUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsEntityImplCopyWith<$Res>
    implements $TermsEntityCopyWith<$Res> {
  factory _$$TermsEntityImplCopyWith(
          _$TermsEntityImpl value, $Res Function(_$TermsEntityImpl) then) =
      __$$TermsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int termsId, String termsType, String version, String notionUrl});
}

/// @nodoc
class __$$TermsEntityImplCopyWithImpl<$Res>
    extends _$TermsEntityCopyWithImpl<$Res, _$TermsEntityImpl>
    implements _$$TermsEntityImplCopyWith<$Res> {
  __$$TermsEntityImplCopyWithImpl(
      _$TermsEntityImpl _value, $Res Function(_$TermsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TermsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsId = null,
    Object? termsType = null,
    Object? version = null,
    Object? notionUrl = null,
  }) {
    return _then(_$TermsEntityImpl(
      termsId: null == termsId
          ? _value.termsId
          : termsId // ignore: cast_nullable_to_non_nullable
              as int,
      termsType: null == termsType
          ? _value.termsType
          : termsType // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      notionUrl: null == notionUrl
          ? _value.notionUrl
          : notionUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TermsEntityImpl implements _TermsEntity {
  _$TermsEntityImpl(
      {required this.termsId,
      required this.termsType,
      required this.version,
      required this.notionUrl});

  @override
  final int termsId;
  @override
  final String termsType;
  @override
  final String version;
  @override
  final String notionUrl;

  @override
  String toString() {
    return 'TermsEntity(termsId: $termsId, termsType: $termsType, version: $version, notionUrl: $notionUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsEntityImpl &&
            (identical(other.termsId, termsId) || other.termsId == termsId) &&
            (identical(other.termsType, termsType) ||
                other.termsType == termsType) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.notionUrl, notionUrl) ||
                other.notionUrl == notionUrl));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, termsId, termsType, version, notionUrl);

  /// Create a copy of TermsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsEntityImplCopyWith<_$TermsEntityImpl> get copyWith =>
      __$$TermsEntityImplCopyWithImpl<_$TermsEntityImpl>(this, _$identity);
}

abstract class _TermsEntity implements TermsEntity {
  factory _TermsEntity(
      {required final int termsId,
      required final String termsType,
      required final String version,
      required final String notionUrl}) = _$TermsEntityImpl;

  @override
  int get termsId;
  @override
  String get termsType;
  @override
  String get version;
  @override
  String get notionUrl;

  /// Create a copy of TermsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TermsEntityImplCopyWith<_$TermsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
