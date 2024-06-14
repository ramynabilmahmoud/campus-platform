import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/error/failure.dart';

enum VerifyEmailField {
  studentCode,
  semester,
  section,
  academicYear,
  attendedProgram,
  continueButton
}

enum VerifyEmailStatus {
  initial,
  loading,
  error,
  success,
}

class VerifyEmailState {
  final VerifyEmailStatus status;
  final Failure? error;
  final String? code;

  const VerifyEmailState(
      {this.status = VerifyEmailStatus.initial, this.error, this.code});

  VerifyEmailState copyWith(
          {VerifyEmailStatus? status, String? code, Failure? error}) =>
      VerifyEmailState(
          code: code ?? this.code,
          status: status ?? this.status,
          error: error ?? this.error);
}
