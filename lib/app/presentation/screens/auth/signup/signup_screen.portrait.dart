import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/signup/signup_cubit.dart';
import 'package:main_platform/app/presentation/bloc/signup/signup_state.dart';
import 'package:main_platform/app/presentation/widgets/custom_textfield.dart';
import 'package:main_platform/app/presentation/widgets/separator_widget.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';

const List<SignUpRole> roles = <SignUpRole>[
  SignUpRole.student,
  SignUpRole.professor,
  SignUpRole.instructor,
  SignUpRole.employee
];

const Map<SignUpRole, String> roleNames = <SignUpRole, String>{
  SignUpRole.student: LocaleKeys.auth_roles_student,
  SignUpRole.instructor: LocaleKeys.auth_roles_instructor,
  SignUpRole.professor: LocaleKeys.auth_roles_professor,
  SignUpRole.employee: LocaleKeys.auth_roles_employee,
};

class PortraitSignUpScreen extends StatelessWidget {
  const PortraitSignUpScreen({super.key});
  @override
  Widget build(context) {
    ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
        child: Center(
            child: Padding(
      padding: const EdgeInsets.all(35),
      child: Column(
        children: [
          Text(
            LocaleKeys.auth_sign_up.tr(),
            style: theme.textTheme.displaySmall
                ?.copyWith(fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 50),
          BlocBuilder<SignUpCubit, SignUpState<SignUpFormField>>(
              buildWhen: (previous, current) =>
                  previous.form[SignUpFormField.fullName] !=
                  current.form[SignUpFormField.fullName],
              builder: (context, state) => CustomTextField(
                  label: LocaleKeys.auth_full_name.tr(),
                  hint: "عمر اشرف محمد عبداللطيف",
                  helper: LocaleKeys.auth_full_name_helper.tr(),
                  borderRadius: 0,
                  prefixIcon: Icons.person,
                  isLoading: context
                      .read<SignUpCubit>()
                      .loading(SignUpFormField.fullName),
                  value: context
                      .read<SignUpCubit>()
                      .value(SignUpFormField.fullName),
                  error: context
                      .read<SignUpCubit>()
                      .error(SignUpFormField.fullName)
                      ?.tr(),
                  onChange: (value) => context
                      .read<SignUpCubit>()
                      .onValueChanged(SignUpFormField.fullName, value))),
          const SizedBox(height: 10),
          BlocBuilder<SignUpCubit, SignUpState<SignUpFormField>>(
              buildWhen: (previous, current) =>
                  previous.form[SignUpFormField.nationalId] !=
                  current.form[SignUpFormField.nationalId],
              builder: (context, state) => CustomTextField(
                  label: LocaleKeys.auth_national_id.tr(),
                  prefixIcon: Icons.numbers_rounded,
                  type: TextInputType.number,
                  helper: LocaleKeys.auth_national_id_helper.tr(),
                  formatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  hint: "30412061201027",
                  borderRadius: 0,
                  isLoading: context
                      .read<SignUpCubit>()
                      .loading(SignUpFormField.nationalId),
                  value: context
                      .read<SignUpCubit>()
                      .value(SignUpFormField.nationalId),
                  error: context
                      .read<SignUpCubit>()
                      .error(SignUpFormField.nationalId)
                      ?.tr(),
                  onChange: (value) => context
                      .read<SignUpCubit>()
                      .onValueChanged(SignUpFormField.nationalId, value))),
          const SizedBox(height: 10),
          BlocBuilder<SignUpCubit, SignUpState<SignUpFormField>>(
              buildWhen: (previous, current) {
                return previous.form[SignUpFormField.emailAddress] !=
                    current.form[SignUpFormField.emailAddress];
              },
              builder: (context, state) => CustomTextField(
                    label: LocaleKeys.auth_email_address.tr(),
                    type: TextInputType.emailAddress,
                    prefixIcon: Icons.email_rounded,
                    hint: 'john.doe@nctu.edu.eg',
                    isLoading: context
                        .read<SignUpCubit>()
                        .loading(SignUpFormField.emailAddress),
                    value: context
                        .read<SignUpCubit>()
                        .value(SignUpFormField.emailAddress),
                    error: context
                        .read<SignUpCubit>()
                        .error(SignUpFormField.emailAddress)
                        ?.tr(),
                    borderRadius: 0,
                    onChange: (value) => context
                        .read<SignUpCubit>()
                        .onValueChanged(SignUpFormField.emailAddress, value),
                  )),
          const SizedBox(height: 10),
          BlocBuilder<SignUpCubit, SignUpState<SignUpFormField>>(
              buildWhen: (previous, current) =>
                  previous.form[SignUpFormField.password] !=
                  current.form[SignUpFormField.password],
              builder: (context, state) => CustomTextField(
                  label: LocaleKeys.auth_password.tr(),
                  isObscure: true,
                  prefixIcon: Icons.security_rounded,
                  borderRadius: 0,
                  maxLines: 1,
                  hint: "••••••••••",
                  isLoading: context
                      .read<SignUpCubit>()
                      .loading(SignUpFormField.password),
                  value: context
                      .read<SignUpCubit>()
                      .value(SignUpFormField.password),
                  error: context
                      .read<SignUpCubit>()
                      .error(SignUpFormField.password)
                      ?.tr(),
                  onChange: (value) => context
                      .read<SignUpCubit>()
                      .onValueChanged(SignUpFormField.password, value))),
          const SizedBox(height: 10),
          DropdownButtonHideUnderline(
              child: DropdownButtonFormField<SignUpRole>(
                  isDense: true,
                  decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(0),
                          borderSide: BorderSide(
                              color: theme.colorScheme.outlineVariant,
                              width: 1))),
                  value: SignUpRole.student,
                  items: roles
                      .map<DropdownMenuItem<SignUpRole>>((SignUpRole role) =>
                          DropdownMenuItem<SignUpRole>(
                              value: role, child: Text(roleNames[role]!.tr())))
                      .toList(),
                  onChanged: (value) {
                    context.read<SignUpCubit>().onValueChanged(
                        SignUpFormField.role,
                        SignUpRole
                            .values[value != null ? value.index : 0].name);
                  })),
          const SizedBox(height: 10),
          SizedBox(
              width: double.infinity,
              height: 50,
              child: BlocBuilder<SignUpCubit, SignUpState<SignUpFormField>>(
                  builder: (context, state) => FilledButton(
                        onPressed: context
                                .read<SignUpCubit>()
                                .loading(SignUpFormField.continueButton)
                            ? null
                            : () {
                                context.read<SignUpCubit>().setLoading(
                                    SignUpFormField.continueButton, true);
                                context.read<SignUpCubit>().validateFields([
                                  SignUpFormField.fullName,
                                  SignUpFormField.emailAddress,
                                  SignUpFormField.nationalId,
                                  SignUpFormField.password,
                                  SignUpFormField.role
                                ]).then((isValid) {
                                  if (isValid) {
                                    context.read<SignUpCubit>().showLoading();
                                    context
                                        .read<SignUpCubit>()
                                        .signUp()
                                        .then((error) {
                                      if (error != null) {
                                        context
                                            .read<SignUpCubit>()
                                            .showError(error);
                                      } else {
                                        context
                                            .read<SignUpCubit>()
                                            .showSuccess();
                                      }
                                    });
                                  }
                                });
                              },
                        style: FilledButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                        child: Text(
                          LocaleKeys.auth_continue_button.tr().toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ))),
          SeparatorWidget(separatorText: LocaleKeys.auth_or.tr()),
          RichText(
              text: TextSpan(
                  style: theme.textTheme.bodyMedium,
                  text: LocaleKeys.auth_already_have_account.tr(),
                  children: [
                TextSpan(
                    text: LocaleKeys.auth_log_in.tr(),
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: theme.colorScheme.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.router.replaceNamed('/login');
                      })
              ])),
        ],
      ),
    )));
  }
}
