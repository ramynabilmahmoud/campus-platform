import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/error/failure.dart';

enum LoginStatus { initial, loading, success, error }

enum LoginFormField { identifier, password, loginButton }

class LoginState implements CustomFormInterface<LoginFormField> {
  final LoginStatus status;
  final Failure? error;

  @override
  final CustomForm<LoginFormField> form;

  const LoginState(
      {this.status = LoginStatus.initial, this.error, this.form = const {}});

  const LoginState.initial() : this();

  const LoginState.failed(Failure error)
      : this(error: error, status: LoginStatus.error);

  const LoginState.loading() : this(status: LoginStatus.loading);

  const LoginState.success() : this(status: LoginStatus.success);

  @override
  LoginState copyWith(
      {LoginStatus? status, Failure? error, CustomForm<LoginFormField>? form}) {
    return LoginState(
        status: status ?? this.status,
        error: error ?? this.error,
        form: form ?? this.form);
  }
}
