// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProgramEntity {
  String? get id => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get headId => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  int? get flags => throw _privateConstructorUsedError;
  double? get createdAt => throw _privateConstructorUsedError;
  double? get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgramEntityCopyWith<ProgramEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramEntityCopyWith<$Res> {
  factory $ProgramEntityCopyWith(
          ProgramEntity value, $Res Function(ProgramEntity) then) =
      _$ProgramEntityCopyWithImpl<$Res, ProgramEntity>;
  @useResult
  $Res call(
      {String? id,
      String? code,
      String? name,
      String? headId,
      String? parentId,
      int? flags,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class _$ProgramEntityCopyWithImpl<$Res, $Val extends ProgramEntity>
    implements $ProgramEntityCopyWith<$Res> {
  _$ProgramEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? headId = freezed,
    Object? parentId = freezed,
    Object? flags = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      headId: freezed == headId
          ? _value.headId
          : headId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: freezed == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramEntityImplCopyWith<$Res>
    implements $ProgramEntityCopyWith<$Res> {
  factory _$$ProgramEntityImplCopyWith(
          _$ProgramEntityImpl value, $Res Function(_$ProgramEntityImpl) then) =
      __$$ProgramEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? code,
      String? name,
      String? headId,
      String? parentId,
      int? flags,
      double? createdAt,
      double? updatedAt});
}

/// @nodoc
class __$$ProgramEntityImplCopyWithImpl<$Res>
    extends _$ProgramEntityCopyWithImpl<$Res, _$ProgramEntityImpl>
    implements _$$ProgramEntityImplCopyWith<$Res> {
  __$$ProgramEntityImplCopyWithImpl(
      _$ProgramEntityImpl _value, $Res Function(_$ProgramEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? code = freezed,
    Object? name = freezed,
    Object? headId = freezed,
    Object? parentId = freezed,
    Object? flags = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ProgramEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      headId: freezed == headId
          ? _value.headId
          : headId // ignore: cast_nullable_to_non_nullable
              as String?,
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: freezed == flags
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as double?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$ProgramEntityImpl implements _ProgramEntity {
  const _$ProgramEntityImpl(
      {required this.id,
      required this.code,
      required this.name,
      required this.headId,
      required this.parentId,
      required this.flags,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String? id;
  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? headId;
  @override
  final String? parentId;
  @override
  final int? flags;
  @override
  final double? createdAt;
  @override
  final double? updatedAt;

  @override
  String toString() {
    return 'ProgramEntity(id: $id, code: $code, name: $name, headId: $headId, parentId: $parentId, flags: $flags, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.headId, headId) || other.headId == headId) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.flags, flags) || other.flags == flags) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, code, name, headId, parentId,
      flags, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramEntityImplCopyWith<_$ProgramEntityImpl> get copyWith =>
      __$$ProgramEntityImplCopyWithImpl<_$ProgramEntityImpl>(this, _$identity);
}

abstract class _ProgramEntity implements ProgramEntity {
  const factory _ProgramEntity(
      {required final String? id,
      required final String? code,
      required final String? name,
      required final String? headId,
      required final String? parentId,
      required final int? flags,
      required final double? createdAt,
      required final double? updatedAt}) = _$ProgramEntityImpl;

  @override
  String? get id;
  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get headId;
  @override
  String? get parentId;
  @override
  int? get flags;
  @override
  double? get createdAt;
  @override
  double? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$ProgramEntityImplCopyWith<_$ProgramEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
