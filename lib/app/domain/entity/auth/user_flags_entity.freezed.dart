// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_flags_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserFlagsEntity {
  bool get isEmailVerified => throw _privateConstructorUsedError;
  bool get isIdentityVerified => throw _privateConstructorUsedError;
  bool get isKnownStudent => throw _privateConstructorUsedError;
  bool get isApprovedUser => throw _privateConstructorUsedError;
  bool get isSuspendedUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserFlagsEntityCopyWith<UserFlagsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFlagsEntityCopyWith<$Res> {
  factory $UserFlagsEntityCopyWith(
          UserFlagsEntity value, $Res Function(UserFlagsEntity) then) =
      _$UserFlagsEntityCopyWithImpl<$Res, UserFlagsEntity>;
  @useResult
  $Res call(
      {bool isEmailVerified,
      bool isIdentityVerified,
      bool isKnownStudent,
      bool isApprovedUser,
      bool isSuspendedUser});
}

/// @nodoc
class _$UserFlagsEntityCopyWithImpl<$Res, $Val extends UserFlagsEntity>
    implements $UserFlagsEntityCopyWith<$Res> {
  _$UserFlagsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerified = null,
    Object? isIdentityVerified = null,
    Object? isKnownStudent = null,
    Object? isApprovedUser = null,
    Object? isSuspendedUser = null,
  }) {
    return _then(_value.copyWith(
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isIdentityVerified: null == isIdentityVerified
          ? _value.isIdentityVerified
          : isIdentityVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isKnownStudent: null == isKnownStudent
          ? _value.isKnownStudent
          : isKnownStudent // ignore: cast_nullable_to_non_nullable
              as bool,
      isApprovedUser: null == isApprovedUser
          ? _value.isApprovedUser
          : isApprovedUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspendedUser: null == isSuspendedUser
          ? _value.isSuspendedUser
          : isSuspendedUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFlagsEntityImplCopyWith<$Res>
    implements $UserFlagsEntityCopyWith<$Res> {
  factory _$$UserFlagsEntityImplCopyWith(_$UserFlagsEntityImpl value,
          $Res Function(_$UserFlagsEntityImpl) then) =
      __$$UserFlagsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isEmailVerified,
      bool isIdentityVerified,
      bool isKnownStudent,
      bool isApprovedUser,
      bool isSuspendedUser});
}

/// @nodoc
class __$$UserFlagsEntityImplCopyWithImpl<$Res>
    extends _$UserFlagsEntityCopyWithImpl<$Res, _$UserFlagsEntityImpl>
    implements _$$UserFlagsEntityImplCopyWith<$Res> {
  __$$UserFlagsEntityImplCopyWithImpl(
      _$UserFlagsEntityImpl _value, $Res Function(_$UserFlagsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isEmailVerified = null,
    Object? isIdentityVerified = null,
    Object? isKnownStudent = null,
    Object? isApprovedUser = null,
    Object? isSuspendedUser = null,
  }) {
    return _then(_$UserFlagsEntityImpl(
      isEmailVerified: null == isEmailVerified
          ? _value.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isIdentityVerified: null == isIdentityVerified
          ? _value.isIdentityVerified
          : isIdentityVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      isKnownStudent: null == isKnownStudent
          ? _value.isKnownStudent
          : isKnownStudent // ignore: cast_nullable_to_non_nullable
              as bool,
      isApprovedUser: null == isApprovedUser
          ? _value.isApprovedUser
          : isApprovedUser // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuspendedUser: null == isSuspendedUser
          ? _value.isSuspendedUser
          : isSuspendedUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UserFlagsEntityImpl implements _UserFlagsEntity {
  const _$UserFlagsEntityImpl(
      {required this.isEmailVerified,
      required this.isIdentityVerified,
      required this.isKnownStudent,
      required this.isApprovedUser,
      required this.isSuspendedUser});

  @override
  final bool isEmailVerified;
  @override
  final bool isIdentityVerified;
  @override
  final bool isKnownStudent;
  @override
  final bool isApprovedUser;
  @override
  final bool isSuspendedUser;

  @override
  String toString() {
    return 'UserFlagsEntity(isEmailVerified: $isEmailVerified, isIdentityVerified: $isIdentityVerified, isKnownStudent: $isKnownStudent, isApprovedUser: $isApprovedUser, isSuspendedUser: $isSuspendedUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFlagsEntityImpl &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.isIdentityVerified, isIdentityVerified) ||
                other.isIdentityVerified == isIdentityVerified) &&
            (identical(other.isKnownStudent, isKnownStudent) ||
                other.isKnownStudent == isKnownStudent) &&
            (identical(other.isApprovedUser, isApprovedUser) ||
                other.isApprovedUser == isApprovedUser) &&
            (identical(other.isSuspendedUser, isSuspendedUser) ||
                other.isSuspendedUser == isSuspendedUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isEmailVerified,
      isIdentityVerified, isKnownStudent, isApprovedUser, isSuspendedUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFlagsEntityImplCopyWith<_$UserFlagsEntityImpl> get copyWith =>
      __$$UserFlagsEntityImplCopyWithImpl<_$UserFlagsEntityImpl>(
          this, _$identity);
}

abstract class _UserFlagsEntity implements UserFlagsEntity {
  const factory _UserFlagsEntity(
      {required final bool isEmailVerified,
      required final bool isIdentityVerified,
      required final bool isKnownStudent,
      required final bool isApprovedUser,
      required final bool isSuspendedUser}) = _$UserFlagsEntityImpl;

  @override
  bool get isEmailVerified;
  @override
  bool get isIdentityVerified;
  @override
  bool get isKnownStudent;
  @override
  bool get isApprovedUser;
  @override
  bool get isSuspendedUser;
  @override
  @JsonKey(ignore: true)
  _$$UserFlagsEntityImplCopyWith<_$UserFlagsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
