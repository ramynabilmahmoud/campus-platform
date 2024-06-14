import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_cubit.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_state.dart';
import 'package:main_platform/app/presentation/bloc/login/login_cubit.dart';
import 'package:main_platform/app/presentation/bloc/login/login_state.dart';
import 'package:main_platform/app/presentation/widgets/custom_textfield.dart';
import 'package:main_platform/app/presentation/widgets/find_student_code_dialog.dart';
import 'package:main_platform/app/presentation/widgets/separator_widget.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/utils/assets.dart';
import 'package:main_platform/core/utils/native_locale.dart';
import 'package:main_platform/core/widgets/locale_list_widget.dart';

class PortraitLoginScreen extends StatelessWidget {
  PortraitLoginScreen({super.key});

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(35),
          child: Form(
            key: _loginFormKey,
            child: Column(
              children: [
                Image.asset(Assets.path('assets/images/brand/splash.png'),
                    width: 100),
                const SizedBox(height: 50),
                BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.form[LoginFormField.identifier] !=
                        current.form[LoginFormField.identifier],
                    builder: (context, state) => CustomTextField(
                        label: LocaleKeys.auth_identifier.tr(),
                        borderRadius: 10,
                        hint: "20220325@nctu.edu.eg",
                        helper: LocaleKeys.auth_identifier_helper.tr(),
                        prefixIcon: Icons.person,
                        isLoading: context
                            .read<LoginCubit>()
                            .loading(LoginFormField.identifier),
                        value: context
                            .read<LoginCubit>()
                            .value(LoginFormField.identifier),
                        error: context
                            .read<LoginCubit>()
                            .error(LoginFormField.identifier)
                            ?.tr(),
                        onChange: (value) => context
                            .read<LoginCubit>()
                            .onValueChanged(LoginFormField.identifier,
                                value))), // CustomTextF
                const SizedBox(height: 15),
                BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.form[LoginFormField.password] !=
                        current.form[LoginFormField.password],
                    builder: (context, state) => CustomTextField(
                        label: LocaleKeys.auth_password.tr(),
                        isObscure: true,
                        maxLines: 1,
                        borderRadius: 10,
                        hint: "••••••••••",
                        prefixIcon: Icons.security_rounded,
                        isLoading: context
                            .read<LoginCubit>()
                            .loading(LoginFormField.password),
                        value: context
                            .read<LoginCubit>()
                            .value(LoginFormField.password),
                        error: context
                            .read<LoginCubit>()
                            .error(LoginFormField.password)
                            ?.tr(),
                        onChange: (value) => context
                            .read<LoginCubit>()
                            .onValueChanged(LoginFormField.password,
                                value))), // CustomTextField(
                const SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) =>
                            BlocBuilder<AuthCubit, AuthState>(
                              builder:
                                  (BuildContext context, AuthState state) =>
                                      FilledButton(
                                onPressed: context
                                                .read<AuthCubit>()
                                                .state
                                                .status ==
                                            AuthStatus.loading ||
                                        context
                                            .read<LoginCubit>()
                                            .loading(LoginFormField.loginButton)
                                    ? null
                                    : () {
                                        context.read<LoginCubit>().setLoading(
                                            LoginFormField.loginButton, true);
                                        context
                                            .read<LoginCubit>()
                                            .validateFields([
                                          LoginFormField.identifier,
                                          LoginFormField.password,
                                        ]).then((isValid) {
                                          if (isValid) {
                                            context.read<LoginCubit>().login();
                                          }
                                          context.read<LoginCubit>().setLoading(
                                              LoginFormField.loginButton,
                                              false);
                                        });
                                      },
                                style: FilledButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12))),
                                ),
                                child: Text(
                                  LocaleKeys.auth_log_in.tr().toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ))),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                                text: LocaleKeys.auth_find_student_code.tr(),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    showFindStudentCodeDialog(context);
                                  })),
                      ),
                      Expanded(
                        flex: 1,
                        child: RichText(
                            textAlign: TextAlign.end,
                            text: TextSpan(
                                text: LocaleKeys.auth_reset_password.tr(),
                                style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.onSurface),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {})),
                      )
                    ],
                  ),
                ),
                SeparatorWidget(separatorText: LocaleKeys.auth_or.tr()),
                RichText(
                    text: TextSpan(
                        style: theme.textTheme.bodyMedium,
                        text: LocaleKeys.auth_dont_have_an_account.tr(),
                        children: [
                      TextSpan(
                          text: LocaleKeys.auth_sign_up.tr(),
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: theme.colorScheme.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.router.pushNamed('/signup');
                            })
                    ])),
                const SizedBox(height: 50),
                RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                        text: NativeLocale.getNativeLanguageName(
                            Localizations.localeOf(context).languageCode),
                        style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            decorationColor: theme.colorScheme.primary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) =>
                                    LocaleListWidget(
                                        supportedLocales:
                                            context.supportedLocales));
                          })),
              ],
            ),
          )),
    );
  }
}
