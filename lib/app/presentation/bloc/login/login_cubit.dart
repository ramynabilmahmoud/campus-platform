import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/auth/login_entity.dart';
import 'package:main_platform/app/domain/entity/auth/user_auth_tokens_entity.dart';
import 'package:main_platform/app/domain/usecase/auth/load_auth_user_usecase.dart';
import 'package:main_platform/app/domain/usecase/auth/login_usecase.dart';
import 'package:main_platform/app/domain/usecase/auth/set_auth_tokens_usecase.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_cubit.dart';
import 'package:main_platform/app/presentation/bloc/login/login_state.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_cubit.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/failure.dart';
import 'package:main_platform/core/utils/validators.dart';

@injectable
class LoginCubit extends CustomFormCubit<LoginFormField, LoginState> {
  final _loginUseCase = getIt<LoginUseCase>();
  final _authTokensUseCase = getIt<SetAuthTokensUseCase>();
  final _loadUserUseCase = getIt<LoadAuthUserUseCase>();

  LoginCubit() : super(const LoginState.initial());

  void showLoading() {
    emit(state.copyWith(status: LoginStatus.loading));
  }

  void showError(Failure error) {
    emit(state.copyWith(status: LoginStatus.error));
  }

  void showSuccess() {
    emit(const LoginState.success());
  }

  void initial() {
    emit(const LoginState.initial());
  }

  Future<String?> validateIdentifier(String? identifier) async {
    if (identifier == null ||
        identifier.isEmpty ||
        !Validators.isValidIdentifier(identifier)) {
      return LocaleKeys.auth_identifier_error;
    }
    return null;
  }

  Future<String?> validatePassword(String? password) async {
    if (password == null || password.isEmpty || password.length < 6) {
      return LocaleKeys.auth_password_error;
    }
    return null;
  }

  @override
  Future<String?> validateField(LoginFormField field, String? value) async {
    var form = {...state.form};

    form[LoginFormField.loginButton] =
        const CustomFormFieldState(isLoading: true);

    emit(state.copyWith(form: form));

    value ??= this.value(field);

    var validator = mapValidation(field);
    var error = validator != null ? await validator(value) : null;

    form[field] =
        CustomFormFieldState(value: value, error: error, isLoading: false);

    form = {...state.form};

    form[field] =
        CustomFormFieldState(value: value, error: error, isLoading: false);

    emit(state.copyWith(form: form));

    form[LoginFormField.loginButton] =
        const CustomFormFieldState(isLoading: false);

    emit(state.copyWith(form: form));

    return error;
  }

  Future<void> login() async {
    emit(state.copyWith(status: LoginStatus.loading));

    var data = LoginEntity(
        identifier: value(LoginFormField.identifier) ?? '',
        password: value(LoginFormField.password) ?? '');

    var res = await _loginUseCase(data);
    return res.fold((error) {
      var failure = _onLoginError(error);
      emit(state.copyWith(status: LoginStatus.error, error: failure));
    }, (tokens) {
      emit(state.copyWith(status: LoginStatus.success));
      _onLoginSuccess(tokens);
    });
  }

  Failure? _onLoginError(Failure error) {
    var form = state.form;
    if (error.location != null && error.location!.isNotEmpty) {
      LoginFormField? loc = mapLocation(error.location!);
      if (loc != null) {
        form[loc] = form[loc]!.copyWith(error: error.message);
        emit(state.copyWith(form: form));
      } else {
        return null;
      }
    } else {
      return error;
    }
    return null;
  }

  @override
  Future<String?> Function(String?)? mapValidation(LoginFormField field) {
    return switch (field) {
      LoginFormField.identifier => validateIdentifier,
      LoginFormField.password => validatePassword,
      _ => null
    };
  }

  @override
  LoginFormField? mapLocation(String location) {
    return switch (location) {
      'identifier' => LoginFormField.identifier,
      'password' => LoginFormField.password,
      _ => null
    };
  }

  void _onLoginSuccess(UserAuthTokensEntity tokens) async {
    await _authTokensUseCase(tokens);
    var result = await _loadUserUseCase(NoParams());
    result.fold(
        (error) => null, (user) => getIt<AuthCubit>().authenticated(user));
  }
}
