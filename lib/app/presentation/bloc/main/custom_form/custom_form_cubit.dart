import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_form_state.dart';

abstract class CustomFormCubit<T, K extends CustomFormInterface<T>>
    extends Cubit<K> {
  CustomFormCubit(super.initialState);

  void checkField(T field) {
    if (!state.form.containsKey(field)) {
      var value = const CustomFormFieldState();
      emit(state.copyWith(form: {...state.form, field: value}) as K);
    }
  }

  String? error(T field) {
    checkField(field);
    return state.form[field]!.error;
  }

  String? value(T field) {
    checkField(field);
    return state.form[field]!.value;
  }

  bool loading(T field) {
    checkField(field);
    return state.form[field]!.isLoading;
  }

  Future<void> onValueChanged(T field, String? value) async {
    var form = {...state.form};

    if (!form.containsKey(field)) {
      form[field] = CustomFormFieldState(value: value, isLoading: true);
    } else {
      form[field] = CustomFormFieldState(value: value, isLoading: true);
    }

    emit(state.copyWith(form: form) as K);

    validateField(field, value);
  }

  setLoading(T field, bool loading) {
    var form = state.form;
    if (form.containsKey(field)) {
      form[field] = form[field]!.copyWith(isLoading: loading);
    } else {
      form[field] = CustomFormFieldState(isLoading: loading);
    }
    emit(state.copyWith(form: form) as K);
  }

  Future<bool> validateFields(List<T> fields) async {
    bool result = true;

    for (T field in fields) {
      String? error = await validateField(field, value(field));
      if (error != null) {
        result = false;
      }
    }

    return result;
  }

  Future<String?> validateField(T field, String? value);

  T? mapLocation(String location);

  Future<String?> Function(String?)? mapValidation(T field);
}
