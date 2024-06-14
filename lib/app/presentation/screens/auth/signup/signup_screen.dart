import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/signup/signup_cubit.dart';
import 'package:main_platform/app/presentation/bloc/signup/signup_state.dart';
import 'package:main_platform/app/presentation/screens/auth/signup/signup_screen.portrait.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';
import 'package:main_platform/core/widgets/responsive_layout.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SignUpCubit>(
            create: (BuildContext context) => getIt<SignUpCubit>(),
          ),
        ],
        child: Scaffold(
            body: SafeArea(
                child: BlocListener<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (ModalRoute.of(context)!.isCurrent != true) {
              Navigator.of(context).pop();
            }
            if (state.status == SignUpStatus.loading) {
              showCustomDialog(context: context, content: [
                const CircularProgressIndicator(),
                const SizedBox(height: 10),
                Text(LocaleKeys.plaese_wait.tr())
              ]);
            } else if (state.status == SignUpStatus.error) {
              showCustomDialog(
                  context: context,
                  dismissable: true,
                  title: LocaleKeys.auth_signup_failed.tr(),
                  content: [
                    Text(state.error?.message.tr() ??
                        LocaleKeys.error_unexpeceted_error.tr()),
                  ]);
            } else if (state.status == SignUpStatus.success) {
              showCustomDialog(
                  context: context,
                  dismissable: true,
                  title: LocaleKeys.auth_signup_success,
                  content: [
                    Text(LocaleKeys.auth_signup_success_info.tr()),
                  ],
                  actions: [
                    FilledButton(
                        onPressed: () {
                          context.router.navigateNamed('/login');
                        },
                        style: FilledButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                        child: Text(LocaleKeys.auth_log_in.tr()))
                  ]);
            }
          },
          child: const ResponsiveLayout(
            portraitWidget: PortraitSignUpScreen(),
            defaultWidget: PortraitSignUpScreen(),
          ),
        ))));
  }
}
