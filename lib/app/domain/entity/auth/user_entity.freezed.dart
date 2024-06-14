// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthUserEntity {
  String? get id => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get nationalId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  double? get updatedAt => throw _privateConstructorUsedError;
  UserFlagsEntity? get flags => throw _privateConstructorUsedError;
  List<String>? get roles => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get englishName => throw _privateConstructorUsedError;
  String? get profilePicture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthUserEntityCopyWith<AuthUserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserEntityCopyWith<$Res> {
  factory $AuthUserEntityCopyWith(
          AuthUserEntity value, $Res Function(AuthUserEntity) then) =
      _$AuthUserEntityCopyWithImpl<$Res, AuthUserEntity>;
  @useResult
  $Res call(
      {String? id,
      String? fullName,
      String? nationalId,
      String? email,
      double? updatedAt,
      UserFlagsEntity? flags,
      List<String>? roles,
      String? status,
      String? englishName,
      String? profilePicture});

  $UserFlagsEntityCopyWith<$Res>? get flags;
}

/// @nodoc
class _$AuthUserEntityCopyWithImpl<$Res, $Val extends AuthUserEntity>
    implements $AuthUserEntityCopyWith<$Res> {
  _$AuthUserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? nationalId = freezed,
    Object? email = freezed,
    Object? updatedAt = freezed,
    Object? flags = freezed,
    Object? roles = freezed,
    Object? status = freezed,
    Object? englishName = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalId: freezed == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as double?,
      flags: freezed == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as UserFlagsEntity?,
      roles: freezed == roles
          ? _value.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserFlagsEntityCopyWith<$Res>? get flags {
    if (_value.flags == null) {
      return null;
    }

    return $UserFlagsEntityCopyWith<$Res>(_value.flags!, (value) {
      return _then(_value.copyWith(flags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthUserEntityImplCopyWith<$Res>
    implements $AuthUserEntityCopyWith<$Res> {
  factory _$$AuthUserEntityImplCopyWith(_$AuthUserEntityImpl value,
          $Res Function(_$AuthUserEntityImpl) then) =
      __$$AuthUserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? fullName,
      String? nationalId,
      String? email,
      double? updatedAt,
      UserFlagsEntity? flags,
      List<String>? roles,
      String? status,
      String? englishName,
      String? profilePicture});

  @override
  $UserFlagsEntityCopyWith<$Res>? get flags;
}

/// @nodoc
class __$$AuthUserEntityImplCopyWithImpl<$Res>
    extends _$AuthUserEntityCopyWithImpl<$Res, _$AuthUserEntityImpl>
    implements _$$AuthUserEntityImplCopyWith<$Res> {
  __$$AuthUserEntityImplCopyWithImpl(
      _$AuthUserEntityImpl _value, $Res Function(_$AuthUserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? nationalId = freezed,
    Object? email = freezed,
    Object? updatedAt = freezed,
    Object? flags = freezed,
    Object? roles = freezed,
    Object? status = freezed,
    Object? englishName = freezed,
    Object? profilePicture = freezed,
  }) {
    return _then(_$AuthUserEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      nationalId: freezed == nationalId
          ? _value.nationalId
          : nationalId // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as double?,
      flags: freezed == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as UserFlagsEntity?,
      roles: freezed == roles
          ? _value._roles
          : roles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      englishName: freezed == englishName
          ? _value.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthUserEntityImpl implements _AuthUserEntity {
  const _$AuthUserEntityImpl(
      {required this.id,
      required this.fullName,
      required this.nationalId,
      required this.email,
      required this.updatedAt,
      required this.flags,
      required final List<String>? roles,
      required this.status,
      this.englishName,
      this.profilePicture})
      : _roles = roles;

  @override
  final String? id;
  @override
  final String? fullName;
  @override
  final String? nationalId;
  @override
  final String? email;
  @override
  final double? updatedAt;
  @override
  final UserFlagsEntity? flags;
  final List<String>? _roles;
  @override
  List<String>? get roles {
    final value = _roles;
    if (value == null) return null;
    if (_roles is EqualUnmodifiableListView) return _roles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final String? englishName;
  @override
  final String? profilePicture;

  @override
  String toString() {
    return 'AuthUserEntity(id: $id, fullName: $fullName, nationalId: $nationalId, email: $email, updatedAt: $updatedAt, flags: $flags, roles: $roles, status: $status, englishName: $englishName, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.nationalId, nationalId) ||
                other.nationalId == nationalId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.flags, flags) || other.flags == flags) &&
            const DeepCollectionEquality().equals(other._roles, _roles) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      nationalId,
      email,
      updatedAt,
      flags,
      const DeepCollectionEquality().hash(_roles),
      status,
      englishName,
      profilePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserEntityImplCopyWith<_$AuthUserEntityImpl> get copyWith =>
      __$$AuthUserEntityImplCopyWithImpl<_$AuthUserEntityImpl>(
          this, _$identity);
}

abstract class _AuthUserEntity implements AuthUserEntity {
  const factory _AuthUserEntity(
      {required final String? id,
      required final String? fullName,
      required final String? nationalId,
      required final String? email,
      required final double? updatedAt,
      required final UserFlagsEntity? flags,
      required final List<String>? roles,
      required final String? status,
      final String? englishName,
      final String? profilePicture}) = _$AuthUserEntityImpl;

  @override
  String? get id;
  @override
  String? get fullName;
  @override
  String? get nationalId;
  @override
  String? get email;
  @override
  double? get updatedAt;
  @override
  UserFlagsEntity? get flags;
  @override
  List<String>? get roles;
  @override
  String? get status;
  @override
  String? get englishName;
  @override
  String? get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$AuthUserEntityImplCopyWith<_$AuthUserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
