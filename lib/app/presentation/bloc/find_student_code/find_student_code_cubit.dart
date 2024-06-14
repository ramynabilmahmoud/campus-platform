import 'package:injectable/injectable.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_cubit.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/utils/validators.dart';
import 'find_student_code_state.dart';

@injectable
class FindStudentCodeCubit extends CustomFormCubit<FindStudentCodeFormField,
    FindStudentCodeState<FindStudentCodeFormField>> {
  FindStudentCodeCubit(super.initialState);

  @override
  FindStudentCodeFormField? mapLocation(String location) {
    return null;
  }

  Future<String?> validateNationalId(String? nationalId) async {
    if (nationalId == null ||
        nationalId.isEmpty ||
        !Validators.isValidNationalId(nationalId)) {
      return LocaleKeys.auth_national_id_error;
    }
    return null;
  }

  @override
  Future<String?> validateField(
      FindStudentCodeFormField field, String? value) async {
    var form = state.form;
    form[FindStudentCodeFormField.findButton] =
        const CustomFormFieldState(isLoading: true);

    emit(state.copyWith(form: form));

    value ??= this.value(field);

    var validator = mapValidation(field);
    var error = validator != null ? await validator(value) : null;
    form[field] =
        form[field]!.copyWith(error: error, value: value, isLoading: false);

    form[FindStudentCodeFormField.findButton] =
        const CustomFormFieldState(isLoading: false);
    emit(state.copyWith(form: form));

    return error;
  }

  @override
  Future<String?> Function(String?)? mapValidation(
      FindStudentCodeFormField field) {
    return switch (field) {
      FindStudentCodeFormField.nationalId => validateNationalId,
      _ => null
    };
  }
}
