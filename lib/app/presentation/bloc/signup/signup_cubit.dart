import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/auth/signup_entity.dart';
import 'package:main_platform/app/domain/usecase/auth/signup_usecase.dart';
import 'package:main_platform/app/domain/usecase/auth/user_exists_usecase.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_cubit.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/app/presentation/bloc/signup/signup_state.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/enums/user_filter_key.dart';
import 'package:main_platform/core/error/failure.dart';
import 'package:main_platform/core/utils/validators.dart';

enum SignUpRole { student, professor, instructor, employee }

@injectable
class SignUpCubit
    extends CustomFormCubit<SignUpFormField, SignUpState<SignUpFormField>> {
  SignUpCubit() : super(const SignUpState.initial());

  final SignUpUseCase _signUpUseCase = getIt<SignUpUseCase>();
  final UserExistsUseCase _userExistsUseCase = getIt<UserExistsUseCase>();

  void showLoading() {
    emit(state.copyWith(status: SignUpStatus.loading));
  }

  void showError(Failure error) {
    emit(state.copyWith(status: SignUpStatus.error, error: error));
  }

  void showSuccess() {
    emit(const SignUpState.success());
  }

  void initial() {
    emit(const SignUpState.initial());
  }

  SignUpEntity toSignUpEntity() {
    SignUpEntity entity = SignUpEntity(
        email: value(SignUpFormField.emailAddress),
        fullName: value(SignUpFormField.fullName),
        nationalId: value(SignUpFormField.nationalId),
        password: value(SignUpFormField.password),
        role:
            SignUpRole.values.byName(value(SignUpFormField.role) ?? "student"));
    return entity;
  }

  Future<String?> validateEmailAddress(String? email) async {
    if (email == null ||
        email.isEmpty ||
        !Validators.isValidEmailAddress(email)) {
      return LocaleKeys.auth_email_error;
    } else {
      try {
        Either<Failure, bool> result = await _userExistsUseCase(UserExistsParam(
            filterKey: UserExistsFilterKey.email, value: email));

        bool exists = result.fold((error) => throw error, (result) => result);
        if (exists) {
          return LocaleKeys.auth_email_already_exists;
        }
        return null;
      } on Failure catch (exc) {
        return exc.message;
      }
    }
  }

  Future<String?> validateNationalId(String? nationalId) async {
    if (nationalId == null ||
        nationalId.isEmpty ||
        !Validators.isValidNationalId(nationalId)) {
      return LocaleKeys.auth_national_id_error;
    } else {
      try {
        Either<Failure, bool> result = await _userExistsUseCase(UserExistsParam(
            filterKey: UserExistsFilterKey.nationalId, value: nationalId));

        bool exists = result.fold((error) => throw error, (result) => result);
        if (exists) {
          return LocaleKeys.auth_national_id_exists;
        }
        return null;
      } on Failure catch (exc) {
        return exc.message;
      }
    }
  }

  Future<String?> validateFullName(String? fullName) async {
    if (fullName == null ||
        fullName.isEmpty ||
        !Validators.isValidFullName(fullName)) {
      return LocaleKeys.auth_full_name_error;
    }
    return null;
  }

  Future<String?> validatePassword(String? password) async {
    if (password == null || password.isEmpty || password.length < 6) {
      return LocaleKeys.auth_password_error;
    }
    return null;
  }

  Future<Failure?> signUp() async {
    SignUpEntity entity = toSignUpEntity();
    var result = await _signUpUseCase(entity);
    return result.fold((error) => _onSignUpError(error), (_) => null);
  }

  @override
  Future<String?> validateField(SignUpFormField field, String? value) async {
    var form = state.form;

    form[SignUpFormField.continueButton] =
        const CustomFormFieldState(isLoading: true);

    emit(state.copyWith(form: form));

    value ??= this.value(field);

    var validator = mapValidation(field);
    var error = validator != null ? await validator(value) : null;

    form = {...state.form};

    form[field] =
        CustomFormFieldState(value: value, error: error, isLoading: false);

    emit(state.copyWith(form: form));

    form[SignUpFormField.continueButton] =
        const CustomFormFieldState(isLoading: false);

    emit(state.copyWith(form: form));

    return error;
  }

  @override
  Future<String?> Function(String?)? mapValidation(SignUpFormField field) {
    return switch (field) {
      SignUpFormField.emailAddress => validateEmailAddress,
      SignUpFormField.nationalId => validateNationalId,
      SignUpFormField.fullName => validateFullName,
      SignUpFormField.password => validatePassword,
      _ => null
    };
  }

  Failure? _onSignUpError(Failure error) {
    var form = state.form;
    if (error.location != null && error.location!.isNotEmpty) {
      SignUpFormField? loc = mapLocation(error.location!);
      if (loc != null) {
        form[loc] = form[loc]!.copyWith(error: error.message);
        emit(state.copyWith(form: form));
      } else {
        return null;
      }
    } else {
      if (error.code == 101) {
        form[SignUpFormField.emailAddress] =
            form[SignUpFormField.emailAddress]!.copyWith(error: error.message);
        form[SignUpFormField.nationalId] =
            form[SignUpFormField.nationalId]!.copyWith(error: error.message);
        emit(state.copyWith(form: form));
        return null;
      } else {
        return error;
      }
    }
    return null;
  }

  @override
  SignUpFormField? mapLocation(String location) {
    switch (location) {
      case 'email':
        return SignUpFormField.emailAddress;
      case 'national_id':
        return SignUpFormField.nationalId;
      case 'full_name':
        return SignUpFormField.fullName;
      case 'password':
        return SignUpFormField.password;
    }
    return null;
  }
}
