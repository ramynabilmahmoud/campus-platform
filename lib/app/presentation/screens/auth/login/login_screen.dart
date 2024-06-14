import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/presentation/bloc/login/login_cubit.dart';
import 'package:main_platform/app/presentation/bloc/login/login_state.dart';
import 'package:main_platform/app/presentation/screens/auth/login/login_screen.portrait.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';
import 'package:main_platform/core/widgets/responsive_layout.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
        create: (BuildContext context) => getIt<LoginCubit>(),
        child: Scaffold(
            body: SafeArea(
          child: BlocListener<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
                current.status != previous.status,
            listener: (context, state) {
              if (ModalRoute.of(context)!.isCurrent != true) {
                Navigator.of(context).pop();
              }
              if (state.status == LoginStatus.loading) {
                showCustomDialog(context: context, content: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 10),
                  Text(LocaleKeys.auth_logging_in.tr())
                ]);
              } else if (state.status == LoginStatus.error) {
                showCustomDialog(
                    context: context,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    title: LocaleKeys.auth_login_failed.tr(),
                    dismissable: true,
                    icon: Icons.warning_rounded,
                    content: [
                      Text(state.error?.message.tr() ??
                          LocaleKeys.error_unexpeceted_error.tr())
                    ],
                    actions: [
                      TextButton(
                        child: Text(LocaleKeys.close.tr()),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ]);
              } else if (state.status == LoginStatus.success) {
                context.router.navigate(HomeRoute());
              }
            },
            child: ResponsiveLayout(
                defaultWidget:
                    SingleChildScrollView(child: PortraitLoginScreen()),
                landscapeWidget:
                    SingleChildScrollView(child: PortraitLoginScreen())),
          ),
        )));
  }
}
