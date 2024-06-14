import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/error/failure.dart';

enum SignUpStatus { initial, loading, success, error }

enum SignUpFormField {
  fullName,
  nationalId,
  emailAddress,
  password,
  role,
  continueButton
}

class SignUpState<T> implements CustomFormInterface<T> {
  final SignUpStatus status;
  final Failure? error;

  @override
  final CustomForm<T> form;

  const SignUpState(
      {this.status = SignUpStatus.initial, this.error, this.form = const {}});

  const SignUpState.initial() : this();

  const SignUpState.failed(Failure error)
      : this(error: error, status: SignUpStatus.error);

  const SignUpState.loading() : this(status: SignUpStatus.loading);

  const SignUpState.success() : this(status: SignUpStatus.success);

  @override
  SignUpState<T> copyWith(
      {SignUpStatus? status, Failure? error, CustomForm<T>? form}) {
    return SignUpState<T>(
        status: status ?? this.status,
        error: error ?? this.error,
        form: form ?? this.form);
  }
}
