import 'package:injectable/injectable.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/error/failure.dart';

enum FindStudentCodeStatus { initial, found, error, loading }

enum FindStudentCodeFormField { nationalId, findButton }

@injectable
class FindStudentCodeState<T> implements CustomFormInterface<T> {
  final FindStudentCodeStatus status;
  final String? code;
  final Failure? error;
  @override
  final CustomForm<T> form;

  const FindStudentCodeState(
      {this.status = FindStudentCodeStatus.initial,
      this.code,
      this.error,
      this.form = const {}});

  const FindStudentCodeState.found(String code)
      : this(status: FindStudentCodeStatus.found, code: code);

  const FindStudentCodeState.error(Failure? error)
      : this(status: FindStudentCodeStatus.error, error: error);

  const FindStudentCodeState.initial() : this();

  @override
  FindStudentCodeState<T> copyWith(
      {FindStudentCodeStatus? status,
      String? code,
      Failure? error,
      CustomForm<T>? form}) {
    return FindStudentCodeState<T>(
        status: status ?? this.status,
        code: code ?? this.code,
        error: error ?? this.error,
        form: form ?? this.form);
  }
}
