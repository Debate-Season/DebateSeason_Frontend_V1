// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'terms_agree_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TermsAgreeEntity {
  int get termsId => throw _privateConstructorUsedError;
  bool get agreed => throw _privateConstructorUsedError;

  /// Create a copy of TermsAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TermsAgreeEntityCopyWith<TermsAgreeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TermsAgreeEntityCopyWith<$Res> {
  factory $TermsAgreeEntityCopyWith(
          TermsAgreeEntity value, $Res Function(TermsAgreeEntity) then) =
      _$TermsAgreeEntityCopyWithImpl<$Res, TermsAgreeEntity>;
  @useResult
  $Res call({int termsId, bool agreed});
}

/// @nodoc
class _$TermsAgreeEntityCopyWithImpl<$Res, $Val extends TermsAgreeEntity>
    implements $TermsAgreeEntityCopyWith<$Res> {
  _$TermsAgreeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TermsAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsId = null,
    Object? agreed = null,
  }) {
    return _then(_value.copyWith(
      termsId: null == termsId
          ? _value.termsId
          : termsId // ignore: cast_nullable_to_non_nullable
              as int,
      agreed: null == agreed
          ? _value.agreed
          : agreed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TermsAgreeEntityImplCopyWith<$Res>
    implements $TermsAgreeEntityCopyWith<$Res> {
  factory _$$TermsAgreeEntityImplCopyWith(_$TermsAgreeEntityImpl value,
          $Res Function(_$TermsAgreeEntityImpl) then) =
      __$$TermsAgreeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int termsId, bool agreed});
}

/// @nodoc
class __$$TermsAgreeEntityImplCopyWithImpl<$Res>
    extends _$TermsAgreeEntityCopyWithImpl<$Res, _$TermsAgreeEntityImpl>
    implements _$$TermsAgreeEntityImplCopyWith<$Res> {
  __$$TermsAgreeEntityImplCopyWithImpl(_$TermsAgreeEntityImpl _value,
      $Res Function(_$TermsAgreeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of TermsAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? termsId = null,
    Object? agreed = null,
  }) {
    return _then(_$TermsAgreeEntityImpl(
      termsId: null == termsId
          ? _value.termsId
          : termsId // ignore: cast_nullable_to_non_nullable
              as int,
      agreed: null == agreed
          ? _value.agreed
          : agreed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TermsAgreeEntityImpl implements _TermsAgreeEntity {
  _$TermsAgreeEntityImpl({required this.termsId, required this.agreed});

  @override
  final int termsId;
  @override
  final bool agreed;

  @override
  String toString() {
    return 'TermsAgreeEntity(termsId: $termsId, agreed: $agreed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TermsAgreeEntityImpl &&
            (identical(other.termsId, termsId) || other.termsId == termsId) &&
            (identical(other.agreed, agreed) || other.agreed == agreed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, termsId, agreed);

  /// Create a copy of TermsAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TermsAgreeEntityImplCopyWith<_$TermsAgreeEntityImpl> get copyWith =>
      __$$TermsAgreeEntityImplCopyWithImpl<_$TermsAgreeEntityImpl>(
          this, _$identity);
}

abstract class _TermsAgreeEntity implements TermsAgreeEntity {
  factory _TermsAgreeEntity(
      {required final int termsId,
      required final bool agreed}) = _$TermsAgreeEntityImpl;

  @override
  int get termsId;
  @override
  bool get agreed;

  /// Create a copy of TermsAgreeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TermsAgreeEntityImplCopyWith<_$TermsAgreeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
