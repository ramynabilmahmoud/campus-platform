import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/usecase/auth/user_exists_usecase.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/domain/usecase/program/get_programs_usecase.dart';
import 'package:main_platform/app/domain/usecase/user/fill_student_info_usecase.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_cubit.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/app/presentation/bloc/signup/fill_student_info_state.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/enums/user_filter_key.dart';
import 'package:main_platform/core/error/failure.dart';
import 'package:main_platform/core/utils/validators.dart';

@injectable
class FillStudentInfoCubit
    extends CustomFormCubit<FillStudentInfoField, FillStudentInfoState> {
  final _getProgramsUseCase = getIt<GetProgramsUseCase>();
  final _userExistsUseCase = getIt<UserExistsUseCase>();
  final _fillStudentInfoUseCase = getIt<FillStudentInfoUseCase>();

  FillStudentInfoCubit() : super(const FillStudentInfoState()) {
    fetchPrograms();
  }
  void fetchPrograms() {
    emit(state.copyWith(status: FillStudentInfoStatus.loading));

    _getProgramsUseCase.call(NoParams()).then((result) {
      result.fold((error) {
        emit(state.copyWith(
            status: FillStudentInfoStatus.programsError, error: error));
      }, (programs) {
        emit(state.copyWith(
            programs: programs, status: FillStudentInfoStatus.programsLoaded));
      });
    });
  }

  Future<String?> validateStudentCode(String? studentCode) async {
    if (studentCode == null ||
        studentCode.isEmpty ||
        !Validators.isValidStudentCode(studentCode)) {
      return "ERROR";
    } else {
      try {
        Either<Failure, bool> result = await _userExistsUseCase(UserExistsParam(
            filterKey: UserExistsFilterKey.studentCode, value: studentCode));

        bool exists = result.fold((error) => throw error, (result) => result);
        if (exists) {
          return "ALREADY EXISTS";
        }
        return null;
      } on Failure catch (exc) {
        return exc.message;
      }
    }
  }

  Future<String?> validateProgramId(String? programId) async {
    if (programId == null || programId.isEmpty) {
      return "ERROR";
    }
    return null;
  }

  @override
  Future<String?> validateField(
      FillStudentInfoField field, String? value) async {
    var form = state.form;

    form[FillStudentInfoField.continueButton] =
        const CustomFormFieldState(isLoading: true);

    emit(state.copyWith(form: form));

    value ??= this.value(field);

    var validator = mapValidation(field);
    var error = validator != null ? await validator(value) : null;

    form = {...state.form};

    form[field] =
        CustomFormFieldState(value: value, error: error, isLoading: false);

    emit(state.copyWith(form: form));

    form[FillStudentInfoField.continueButton] =
        const CustomFormFieldState(isLoading: false);

    emit(state.copyWith(form: form));

    return error;
  }

  @override
  Future<String?> Function(String?)? mapValidation(FillStudentInfoField field) {
    return switch (field) {
      FillStudentInfoField.studentCode => validateStudentCode,
      FillStudentInfoField.attendedProgram => validateProgramId,
      _ => null
    };
  }

  @override
  FillStudentInfoField? mapLocation(String location) {
    return switch (location) {
      'student_code' => FillStudentInfoField.studentCode,
      'program_id' => FillStudentInfoField.attendedProgram,
      _ => null
    };
  }

  void submit() async {
    emit(state.copyWith(status: FillStudentInfoStatus.loading));
    var studentCode = value(FillStudentInfoField.studentCode) ?? "";
    var programId = value(FillStudentInfoField.attendedProgram) ?? "";
    var semester = int.parse(value(FillStudentInfoField.semester) ?? "0");
    var section = int.parse(value(FillStudentInfoField.section) ?? "0");
    var academicYear =
        int.parse(value(FillStudentInfoField.academicYear) ?? "0");
    var params = FillStudentInfoUseCaseParams(
        studentCode: studentCode,
        programId: programId,
        semester: semester,
        section: section,
        academicYear: academicYear);
    var result = await _fillStudentInfoUseCase(params);

    result.fold((error) {
      emit(state.copyWith(status: FillStudentInfoStatus.error, error: error));
    }, (_) {
      print("SUCCESS");
      emit(state.copyWith(status: FillStudentInfoStatus.success));
    });
  }
}
