import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_form_state.freezed.dart';

typedef CustomFormState<K> = Map<K, CustomFormFieldState>;

typedef CustomForm<K> = Map<K, CustomFormFieldState>;

abstract interface class CustomFormInterface<T> {
  final CustomForm<T> form;

  const CustomFormInterface({this.form = const {}});

  CustomFormInterface<T> copyWith({CustomForm<T>? form});
}

@freezed
class CustomFormFieldState with _$CustomFormFieldState {
  const factory CustomFormFieldState({
    String? value,
    String? error,
    @Default(false) bool isLoading,
  }) = _CustomFormFieldState;
}
