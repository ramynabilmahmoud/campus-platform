// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CourseEntity {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get ownerId => throw _privateConstructorUsedError;
  int? get semester => throw _privateConstructorUsedError;
  List<CourseParticipantEntity> get someParticipants =>
      throw _privateConstructorUsedError;
  ProgramEntity? get program => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CourseEntityCopyWith<CourseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseEntityCopyWith<$Res> {
  factory $CourseEntityCopyWith(
          CourseEntity value, $Res Function(CourseEntity) then) =
      _$CourseEntityCopyWithImpl<$Res, CourseEntity>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? code,
      String? imageUrl,
      String? ownerId,
      int? semester,
      List<CourseParticipantEntity> someParticipants,
      ProgramEntity? program});

  $ProgramEntityCopyWith<$Res>? get program;
}

/// @nodoc
class _$CourseEntityCopyWithImpl<$Res, $Val extends CourseEntity>
    implements $CourseEntityCopyWith<$Res> {
  _$CourseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? imageUrl = freezed,
    Object? ownerId = freezed,
    Object? semester = freezed,
    Object? someParticipants = null,
    Object? program = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as int?,
      someParticipants: null == someParticipants
          ? _value.someParticipants
          : someParticipants // ignore: cast_nullable_to_non_nullable
              as List<CourseParticipantEntity>,
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as ProgramEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProgramEntityCopyWith<$Res>? get program {
    if (_value.program == null) {
      return null;
    }

    return $ProgramEntityCopyWith<$Res>(_value.program!, (value) {
      return _then(_value.copyWith(program: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CourseEntityImplCopyWith<$Res>
    implements $CourseEntityCopyWith<$Res> {
  factory _$$CourseEntityImplCopyWith(
          _$CourseEntityImpl value, $Res Function(_$CourseEntityImpl) then) =
      __$$CourseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? code,
      String? imageUrl,
      String? ownerId,
      int? semester,
      List<CourseParticipantEntity> someParticipants,
      ProgramEntity? program});

  @override
  $ProgramEntityCopyWith<$Res>? get program;
}

/// @nodoc
class __$$CourseEntityImplCopyWithImpl<$Res>
    extends _$CourseEntityCopyWithImpl<$Res, _$CourseEntityImpl>
    implements _$$CourseEntityImplCopyWith<$Res> {
  __$$CourseEntityImplCopyWithImpl(
      _$CourseEntityImpl _value, $Res Function(_$CourseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? code = freezed,
    Object? imageUrl = freezed,
    Object? ownerId = freezed,
    Object? semester = freezed,
    Object? someParticipants = null,
    Object? program = freezed,
  }) {
    return _then(_$CourseEntityImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: freezed == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String?,
      semester: freezed == semester
          ? _value.semester
          : semester // ignore: cast_nullable_to_non_nullable
              as int?,
      someParticipants: null == someParticipants
          ? _value._someParticipants
          : someParticipants // ignore: cast_nullable_to_non_nullable
              as List<CourseParticipantEntity>,
      program: freezed == program
          ? _value.program
          : program // ignore: cast_nullable_to_non_nullable
              as ProgramEntity?,
    ));
  }
}

/// @nodoc

class _$CourseEntityImpl implements _CourseEntity {
  const _$CourseEntityImpl(
      {required this.id,
      required this.name,
      required this.code,
      required this.imageUrl,
      required this.ownerId,
      required this.semester,
      required final List<CourseParticipantEntity> someParticipants,
      required this.program})
      : _someParticipants = someParticipants;

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? code;
  @override
  final String? imageUrl;
  @override
  final String? ownerId;
  @override
  final int? semester;
  final List<CourseParticipantEntity> _someParticipants;
  @override
  List<CourseParticipantEntity> get someParticipants {
    if (_someParticipants is EqualUnmodifiableListView)
      return _someParticipants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_someParticipants);
  }

  @override
  final ProgramEntity? program;

  @override
  String toString() {
    return 'CourseEntity(id: $id, name: $name, code: $code, imageUrl: $imageUrl, ownerId: $ownerId, semester: $semester, someParticipants: $someParticipants, program: $program)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.semester, semester) ||
                other.semester == semester) &&
            const DeepCollectionEquality()
                .equals(other._someParticipants, _someParticipants) &&
            (identical(other.program, program) || other.program == program));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      code,
      imageUrl,
      ownerId,
      semester,
      const DeepCollectionEquality().hash(_someParticipants),
      program);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseEntityImplCopyWith<_$CourseEntityImpl> get copyWith =>
      __$$CourseEntityImplCopyWithImpl<_$CourseEntityImpl>(this, _$identity);
}

abstract class _CourseEntity implements CourseEntity {
  const factory _CourseEntity(
      {required final String? id,
      required final String? name,
      required final String? code,
      required final String? imageUrl,
      required final String? ownerId,
      required final int? semester,
      required final List<CourseParticipantEntity> someParticipants,
      required final ProgramEntity? program}) = _$CourseEntityImpl;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get code;
  @override
  String? get imageUrl;
  @override
  String? get ownerId;
  @override
  int? get semester;
  @override
  List<CourseParticipantEntity> get someParticipants;
  @override
  ProgramEntity? get program;
  @override
  @JsonKey(ignore: true)
  _$$CourseEntityImplCopyWith<_$CourseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
