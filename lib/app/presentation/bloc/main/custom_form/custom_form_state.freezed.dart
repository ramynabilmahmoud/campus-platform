// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CustomFormFieldState {
  String? get value => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CustomFormFieldStateCopyWith<CustomFormFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomFormFieldStateCopyWith<$Res> {
  factory $CustomFormFieldStateCopyWith(CustomFormFieldState value,
          $Res Function(CustomFormFieldState) then) =
      _$CustomFormFieldStateCopyWithImpl<$Res, CustomFormFieldState>;
  @useResult
  $Res call({String? value, String? error, bool isLoading});
}

/// @nodoc
class _$CustomFormFieldStateCopyWithImpl<$Res,
        $Val extends CustomFormFieldState>
    implements $CustomFormFieldStateCopyWith<$Res> {
  _$CustomFormFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomFormFieldStateImplCopyWith<$Res>
    implements $CustomFormFieldStateCopyWith<$Res> {
  factory _$$CustomFormFieldStateImplCopyWith(_$CustomFormFieldStateImpl value,
          $Res Function(_$CustomFormFieldStateImpl) then) =
      __$$CustomFormFieldStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? value, String? error, bool isLoading});
}

/// @nodoc
class __$$CustomFormFieldStateImplCopyWithImpl<$Res>
    extends _$CustomFormFieldStateCopyWithImpl<$Res, _$CustomFormFieldStateImpl>
    implements _$$CustomFormFieldStateImplCopyWith<$Res> {
  __$$CustomFormFieldStateImplCopyWithImpl(_$CustomFormFieldStateImpl _value,
      $Res Function(_$CustomFormFieldStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? error = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$CustomFormFieldStateImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CustomFormFieldStateImpl implements _CustomFormFieldState {
  const _$CustomFormFieldStateImpl(
      {this.value, this.error, this.isLoading = false});

  @override
  final String? value;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CustomFormFieldState(value: $value, error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomFormFieldStateImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, error, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomFormFieldStateImplCopyWith<_$CustomFormFieldStateImpl>
      get copyWith =>
          __$$CustomFormFieldStateImplCopyWithImpl<_$CustomFormFieldStateImpl>(
              this, _$identity);
}

abstract class _CustomFormFieldState implements CustomFormFieldState {
  const factory _CustomFormFieldState(
      {final String? value,
      final String? error,
      final bool isLoading}) = _$CustomFormFieldStateImpl;

  @override
  String? get value;
  @override
  String? get error;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$CustomFormFieldStateImplCopyWith<_$CustomFormFieldStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
