import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/find_student_code/find_student_code_cubit.dart';
import 'package:main_platform/app/presentation/bloc/find_student_code/find_student_code_state.dart';
import 'package:main_platform/app/presentation/widgets/custom_textfield.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';

class FindStudentCodeDialog extends StatelessWidget {
  FindStudentCodeDialog({super.key});
  final GlobalKey<FormState> _findStudentCodeFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
          key: _findStudentCodeFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<FindStudentCodeCubit,
                      FindStudentCodeState<FindStudentCodeFormField>>(
                  buildWhen: (previous, current) =>
                      previous.form[FindStudentCodeFormField.nationalId] !=
                      current.form[FindStudentCodeFormField.nationalId],
                  builder: (context, state) {
                    return CustomTextField(
                        label: LocaleKeys.auth_national_id.tr(),
                        prefixIcon: Icons.numbers_rounded,
                        helper: LocaleKeys.auth_national_id_helper.tr(),
                        formatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        hint: "30412061201027",
                        borderRadius: 0,
                        isLoading: context
                            .read<FindStudentCodeCubit>()
                            .loading(FindStudentCodeFormField.nationalId),
                        value: context
                            .read<FindStudentCodeCubit>()
                            .value(FindStudentCodeFormField.nationalId),
                        error: context
                            .read<FindStudentCodeCubit>()
                            .error(FindStudentCodeFormField.nationalId)
                            ?.tr(),
                        onChange: (value) => context
                            .read<FindStudentCodeCubit>()
                            .onValueChanged(
                                FindStudentCodeFormField.nationalId, value));
                  }),
            ],
          )),
    );
  }
}

showFindStudentCodeDialog(BuildContext context) {
  showCustomDialog(
      dismissable: true,
      title: "Find student code",
      context: context,
      providers: [
        BlocProvider<FindStudentCodeCubit>(
            create: (context) => getIt<FindStudentCodeCubit>()),
        BlocProvider<FindStudentCodeCubit>(
            create: (context) => getIt<FindStudentCodeCubit>())
      ],
      content: [
        FindStudentCodeDialog()
      ],
      actions: [
        TextButton(
          child: Text(
            "Close",
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          onPressed: () => Navigator.of(context).pop(),
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
        BlocBuilder<FindStudentCodeCubit,
                FindStudentCodeState<FindStudentCodeFormField>>(
            builder: (context, state) => FilledButton(
                  onPressed: context
                          .read<FindStudentCodeCubit>()
                          .loading(FindStudentCodeFormField.findButton)
                      ? null
                      : () {
                          context.read<FindStudentCodeCubit>().setLoading(
                              FindStudentCodeFormField.findButton, true);
                          context.read<FindStudentCodeCubit>().validateFields([
                            FindStudentCodeFormField.nationalId,
                          ]).then((isValid) {
                            if (isValid) {}
                          });
                        },
                  style: FilledButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                  ),
                  child: Text(
                    "Find",
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                )),
      ]);
}
