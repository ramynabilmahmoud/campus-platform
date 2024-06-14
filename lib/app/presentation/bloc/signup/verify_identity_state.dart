import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/error/failure.dart';

enum VerifyIdentityField { personalPhoto, nationalIDPhoto, continueButton }

enum VerifyIdentityStatus { initial, loading, success, error }

class VerifyIdentityState implements CustomFormInterface<VerifyIdentityField> {
  final VerifyIdentityStatus status;
  final Failure? error;

  @override
  final CustomForm<VerifyIdentityField> form;

  const VerifyIdentityState(
      {this.status = VerifyIdentityStatus.initial,
      this.error,
      this.form = const {}});

  @override
  VerifyIdentityState copyWith(
      {VerifyIdentityStatus? status,
      CustomForm<VerifyIdentityField>? form,
      Failure? error}) {
    return VerifyIdentityState(
        status: status ?? this.status,
        form: form ?? this.form,
        error: error ?? this.error);
  }
}
