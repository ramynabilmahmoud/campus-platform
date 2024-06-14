import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/error/failure.dart';

enum FillStudentInfoField {
  studentCode,
  semester,
  section,
  academicYear,
  attendedProgram,
  continueButton
}

enum FillStudentInfoStatus {
  initial,
  loading,
  error,
  success,
  programsLoaded,
  programsError
}

class FillStudentInfoState
    implements CustomFormInterface<FillStudentInfoField> {
  final FillStudentInfoStatus status;
  final List<ProgramEntity>? programs;
  final Failure? error;

  @override
  final CustomForm<FillStudentInfoField> form;

  const FillStudentInfoState(
      {this.status = FillStudentInfoStatus.initial,
      this.error,
      this.form = const {},
      this.programs = const []});

  @override
  FillStudentInfoState copyWith(
          {FillStudentInfoStatus? status,
          CustomForm<FillStudentInfoField>? form,
          List<ProgramEntity>? programs,
          Failure? error}) =>
      FillStudentInfoState(
          form: form ?? this.form,
          status: status ?? this.status,
          programs: programs ?? this.programs,
          error: error ?? this.error);
}
