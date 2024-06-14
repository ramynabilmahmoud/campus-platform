import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/app/presentation/bloc/signup/fill_student_info_cubit.dart';
import 'package:main_platform/app/presentation/bloc/signup/fill_student_info_state.dart';
import 'package:main_platform/app/presentation/widgets/custom_choice_widget.dart';
import 'package:main_platform/app/presentation/widgets/custom_textfield.dart';
import 'package:main_platform/core/cache/auth_cache.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';
import 'package:main_platform/core/utils/assets.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';

@RoutePage()
class FillStudentInfoScreen extends StatefulWidget {
  final GlobalKey<FormState> _studentInfoFormKey = GlobalKey<FormState>();

  FillStudentInfoScreen({super.key});

  @override
  State<FillStudentInfoScreen> createState() => _FillStudentInfoScreenState();
}

class _FillStudentInfoScreenState extends State<FillStudentInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FillStudentInfoCubit>(),
      child: BlocListener<FillStudentInfoCubit, FillStudentInfoState>(
        listenWhen: (previous, current) => current.status != previous.status,
        listener: (context, state) {
          if (ModalRoute.of(context)!.isCurrent != true) {
            Navigator.of(context).pop();
          }
          if (state.status == FillStudentInfoStatus.loading) {
            showCustomDialog(context: context, content: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              Text(LocaleKeys.loading.tr())
            ]);
          } else if (state.status == FillStudentInfoStatus.error) {
            showCustomDialog(
                context: context,
                dismissable: true,
                title: LocaleKeys.failed.tr(),
                content: [
                  Text(state.error?.message.tr() ??
                      LocaleKeys.error_unexpeceted_error.tr()),
                ]);
          } else if (state.status == FillStudentInfoStatus.programsError) {
            showCustomDialog(
                context: context,
                title: LocaleKeys.failed.tr(),
                content: [
                  Text(state.error?.message.tr() ??
                      LocaleKeys.error_unexpeceted_error.tr()),
                ],
                actions: [
                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          context.router.maybePop().then((_) =>
                              context.router.push(FillStudentInfoRoute()));
                        },
                        style: FilledButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                        child: const Text("Retry"),
                      ))
                ]);
          } else if (state.status == FillStudentInfoStatus.success) {
            getIt<AuthCache>().user = getIt<AuthCache>().user!.copyWith(
                flags: getIt<AuthCache>()
                    .user!
                    .flags!
                    .copyWith(isKnownStudent: true));
            context.router.navigate(const HomeRoute());
          }
        },
        child: Scaffold(
          floatingActionButton:
              BlocBuilder<FillStudentInfoCubit, FillStudentInfoState>(
            buildWhen: (previous, current) =>
                previous.form[FillStudentInfoField.continueButton] !=
                current.form[FillStudentInfoField.continueButton],
            builder: (context, state) {
              return FloatingActionButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                onPressed: context
                        .read<FillStudentInfoCubit>()
                        .loading(FillStudentInfoField.continueButton)
                    ? null
                    : () {
                        context.read<FillStudentInfoCubit>().validateFields([
                          FillStudentInfoField.studentCode,
                          FillStudentInfoField.academicYear,
                          FillStudentInfoField.section,
                          FillStudentInfoField.semester,
                          FillStudentInfoField.attendedProgram,
                        ]).then((isValid) {
                          if (isValid) {
                            context.read<FillStudentInfoCubit>().submit();
                          }
                        });
                      },
                child: const Icon(Icons.navigate_next_rounded),
              );
            },
          ),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: widget._studentInfoFormKey,
                  child: Column(
                    children: [
                      Image.asset(Assets.path('assets/images/brand/splash.png'),
                          width: 80),
                      const SizedBox(height: 15),
                      const Text(
                        "We need you to fill your student information",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w900),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: BlocBuilder<FillStudentInfoCubit, FillStudentInfoState>(
                                buildWhen: (previous, current) =>
                                    previous.form[FillStudentInfoField.studentCode] !=
                                    current
                                        .form[FillStudentInfoField.studentCode],
                                builder: (context, state) => CustomTextField(
                                    label: "Student code",
                                    borderRadius: 5,
                                    isDense: true,
                                    formatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    helper:
                                        "Your student code as it given from your institution",
                                    isLoading: context.read<FillStudentInfoCubit>().loading(
                                        FillStudentInfoField.studentCode),
                                    value: context.read<FillStudentInfoCubit>().value(
                                        FillStudentInfoField.studentCode),
                                    error: context.read<FillStudentInfoCubit>().error(
                                        FillStudentInfoField.studentCode),
                                    onChange: (value) => context
                                        .read<FillStudentInfoCubit>()
                                        .onValueChanged(FillStudentInfoField.studentCode, value))),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: BlocBuilder<FillStudentInfoCubit,
                                    FillStudentInfoState>(
                                buildWhen: (previous, current) =>
                                    previous
                                        .form[FillStudentInfoField.section] !=
                                    current.form[FillStudentInfoField.section],
                                builder: (context, state) => CustomTextField(
                                    label: "Section",
                                    borderRadius: 5,
                                    helper:
                                        "Your section number which is given by your institution",
                                    isDense: true,
                                    formatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    isLoading: context
                                        .read<FillStudentInfoCubit>()
                                        .loading(
                                          FillStudentInfoField.section,
                                        ),
                                    value: context
                                        .read<FillStudentInfoCubit>()
                                        .value(FillStudentInfoField.section),
                                    error: context
                                        .read<FillStudentInfoCubit>()
                                        .error(
                                          FillStudentInfoField.section,
                                        ),
                                    onChange: (value) => context
                                        .read<FillStudentInfoCubit>()
                                        .onValueChanged(
                                            FillStudentInfoField.section,
                                            value))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: BlocBuilder<FillStudentInfoCubit,
                                    FillStudentInfoState>(
                                buildWhen: (previous, current) =>
                                    previous
                                        .form[FillStudentInfoField.semester] !=
                                    current.form[FillStudentInfoField.semester],
                                builder: (context, state) => CustomTextField(
                                    label: "Semester",
                                    borderRadius: 5,
                                    helper:
                                        "Your section number which is given by your institution",
                                    formatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    isLoading: context
                                        .read<FillStudentInfoCubit>()
                                        .loading(
                                          FillStudentInfoField.semester,
                                        ),
                                    isDense: true,
                                    value: context
                                        .read<FillStudentInfoCubit>()
                                        .value(FillStudentInfoField.semester),
                                    error: context
                                        .read<FillStudentInfoCubit>()
                                        .error(
                                          FillStudentInfoField.semester,
                                        ),
                                    onChange: (value) => context
                                        .read<FillStudentInfoCubit>()
                                        .onValueChanged(
                                            FillStudentInfoField.semester,
                                            value))),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: BlocBuilder<FillStudentInfoCubit,
                                    FillStudentInfoState>(
                                buildWhen: (previous, current) =>
                                    previous.form[
                                        FillStudentInfoField.academicYear] !=
                                    current.form[
                                        FillStudentInfoField.academicYear],
                                builder: (context, state) => CustomTextField(
                                    label: "Academic Year",
                                    borderRadius: 5,
                                    helper:
                                        "Your academic year is the year you attendend and started your academic period.",
                                    isDense: true,
                                    formatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    isLoading: context
                                        .read<FillStudentInfoCubit>()
                                        .loading(
                                          FillStudentInfoField.academicYear,
                                        ),
                                    value: context
                                        .read<FillStudentInfoCubit>()
                                        .value(
                                            FillStudentInfoField.academicYear),
                                    error: context
                                        .read<FillStudentInfoCubit>()
                                        .error(
                                          FillStudentInfoField.academicYear,
                                        ),
                                    onChange: (value) => context
                                        .read<FillStudentInfoCubit>()
                                        .onValueChanged(
                                            FillStudentInfoField.academicYear,
                                            value))),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<FillStudentInfoCubit, FillStudentInfoState>(
                          buildWhen: ((previous, current) =>
                              (previous.programs?.length !=
                                  current.programs?.length) ||
                              previous.form[
                                      FillStudentInfoField.attendedProgram] !=
                                  current.form[
                                      FillStudentInfoField.attendedProgram]),
                          builder: (context, state) {
                            return CustomChoiceWidget(
                              label: "Program",
                              items: List.generate(
                                  state.programs?.length ?? 0,
                                  (index) => CustomChoiceItem<ProgramEntity>(
                                      value: state.programs![index],
                                      label: state.programs![index].name!)),
                              onChange: (v) {
                                context
                                    .read<FillStudentInfoCubit>()
                                    .onValueChanged(
                                        FillStudentInfoField.attendedProgram,
                                        v?.id);
                              },
                              error: context
                                  .read<FillStudentInfoCubit>()
                                  .error(FillStudentInfoField.attendedProgram),
                            );
                          }),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
