import 'package:flutter_test/flutter_test.dart';
import 'package:main_platform/app/presentation/bloc/find_student_code/find_student_code_cubit.dart';
import 'package:main_platform/app/presentation/bloc/find_student_code/find_student_code_state.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';

void main() {
  late FindStudentCodeCubit cubit;

  setUp(() {
    cubit = FindStudentCodeCubit(
        const FindStudentCodeState<FindStudentCodeFormField>());
  });

  tearDown(() => cubit.close());

  // onValueChanged starts validation without awaiting it, so let it finish.
  Future<void> settle() => Future<void>.delayed(Duration.zero);

  test('starts in the initial status with an empty form', () {
    expect(cubit.state.status, FindStudentCodeStatus.initial);
    expect(cubit.state.form, isEmpty);
  });

  test('validateNationalId returns an error for a missing or short id',
      () async {
    expect(await cubit.validateNationalId(null),
        LocaleKeys.auth_national_id_error);
    expect(await cubit.validateNationalId(''),
        LocaleKeys.auth_national_id_error);
    expect(await cubit.validateNationalId('123'),
        LocaleKeys.auth_national_id_error);
  });

  test('validateNationalId accepts a 14-digit id', () async {
    expect(await cubit.validateNationalId('29801011234567'), isNull);
  });

  test('typing an invalid id stores the value and the error', () async {
    await cubit.onValueChanged(FindStudentCodeFormField.nationalId, '123');
    await settle();

    expect(cubit.value(FindStudentCodeFormField.nationalId), '123');
    expect(cubit.error(FindStudentCodeFormField.nationalId),
        LocaleKeys.auth_national_id_error);
    expect(cubit.loading(FindStudentCodeFormField.nationalId), isFalse);
    expect(cubit.loading(FindStudentCodeFormField.findButton), isFalse);
  });

  test('typing a valid id clears the error', () async {
    await cubit.onValueChanged(
        FindStudentCodeFormField.nationalId, '29801011234567');
    await settle();

    expect(cubit.error(FindStudentCodeFormField.nationalId), isNull);
    expect(cubit.loading(FindStudentCodeFormField.nationalId), isFalse);
  });
}
