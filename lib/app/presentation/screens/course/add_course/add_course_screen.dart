import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/app/presentation/bloc/add_course/add_course_cubit.dart';
import 'package:main_platform/app/presentation/bloc/add_course/add_course_state.dart';
import 'package:main_platform/app/presentation/widgets/course_preview_widget.dart';
import 'package:main_platform/app/presentation/widgets/custom_choice_widget.dart';
import 'package:main_platform/app/presentation/widgets/custom_textfield.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/router/router.dart';
import 'package:main_platform/core/widgets/custom_dialog_widget.dart';

const kCourseNameExamples = [
  "IT Essentials",
  "Data Structures",
  "Database Programming",
  "Electric Power Systems",
  "Smart Grid Technology",
  "Power System Protection"
];

const semesters = {1: "S1", 2: "S2"};

const years = {1: "Y1", 2: "Y2", 3: "Y3", 4: "Y4"};

@RoutePage()
class AddCourseScreen extends StatelessWidget {
  const AddCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocProvider(
      create: (context) => getIt<AddCourseCubit>(),
      child: BlocListener<AddCourseCubit, AddCourseState>(
        listenWhen: (previous, current) => current.status != previous.status,
        listener: (context, state) {
          if (ModalRoute.of(context)!.isCurrent != true) {
            Navigator.of(context).pop();
          }
          if (state.status == AddCourseStatus.loading) {
            showCustomDialog(context: context, content: [
              const CircularProgressIndicator(),
              const SizedBox(height: 10),
              Text(LocaleKeys.loading.tr())
            ]);
          } else if (state.status == AddCourseStatus.error) {
            showCustomDialog(
                context: context,
                dismissable: true,
                title: LocaleKeys.failed.tr(),
                content: [
                  Text(state.error?.message.tr() ??
                      LocaleKeys.error_unexpeceted_error.tr()),
                ]);
          } else if (state.status == AddCourseStatus.programsError) {
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
                              context.router.push(const AddCourseRoute()));
                        },
                        style: FilledButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                        ),
                        child: const Text("Retry"),
                      ))
                ]);
          } else if (state.status == AddCourseStatus.success) {
            context.router.navigate(CourseRoute(courseId: state.courseId));
          }
        },
        child: Scaffold(
            appBar: AppBar(
              forceMaterialTransparency: true,
              shape: Border(
                  bottom: BorderSide(
                color: theme.colorScheme.outlineVariant,
                width: 2,
              )),
              title: Text(LocaleKeys.add_course_title.tr(),
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w900)),
            ),
            body: SafeArea(
                child: Column(
              children: [
                Builder(builder: (context) {
                  // context.read<AddCourseCubit>().create();
                  return Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              BlocBuilder<AddCourseCubit, AddCourseState>(
                                buildWhen: (previous, current) =>
                                    previous
                                        .form[AddCourseFormField.courseName] !=
                                    current.form[AddCourseFormField.courseName],
                                builder: (context, state) => CustomTextField(
                                    borderRadius: 0,
                                    label: "Course Name",
                                    hint: kCourseNameExamples[Random()
                                        .nextInt(kCourseNameExamples.length)],
                                    maxChar: 64,
                                    isLoading: context
                                        .read<AddCourseCubit>()
                                        .loading(AddCourseFormField.courseName),
                                    value: context
                                        .read<AddCourseCubit>()
                                        .value(AddCourseFormField.courseName),
                                    error: context
                                        .read<AddCourseCubit>()
                                        .error(AddCourseFormField.courseName),
                                    onChange: (value) => context
                                        .read<AddCourseCubit>()
                                        .onValueChanged(
                                            AddCourseFormField.courseName,
                                            value)),
                              ),
                              BlocBuilder<AddCourseCubit, AddCourseState>(
                                buildWhen: (previous, current) =>
                                    previous
                                        .form[AddCourseFormField.courseCode] !=
                                    current.form[AddCourseFormField.courseCode],
                                builder: (context, state) => CustomTextField(
                                    borderRadius: 0,
                                    hint: "ICT-122",
                                    label: "Course Code",
                                    maxChar: 16,
                                    isLoading: context
                                        .read<AddCourseCubit>()
                                        .loading(AddCourseFormField.courseCode),
                                    value: context
                                        .read<AddCourseCubit>()
                                        .value(AddCourseFormField.courseCode),
                                    error: context
                                        .read<AddCourseCubit>()
                                        .error(AddCourseFormField.courseCode),
                                    onChange: (value) {
                                      context
                                          .read<AddCourseCubit>()
                                          .onValueChanged(
                                              AddCourseFormField.courseCode,
                                              value);
                                    }),
                              ),
                              const SizedBox(height: 10),
                              Row(children: [
                                const Text("Enable community",
                                    style: TextStyle(fontSize: 15)),
                                const Spacer(),
                                BlocBuilder<AddCourseCubit, AddCourseState>(
                                  buildWhen: (previous, current) =>
                                      previous.community != current.community,
                                  builder: (context, state) {
                                    return Switch(
                                      value: state.community!,
                                      onChanged: (v) {
                                        context
                                            .read<AddCourseCubit>()
                                            .setCommunity(v);
                                      },
                                    );
                                  },
                                )
                              ]),
                              const SizedBox(height: 10),
                              BlocBuilder<AddCourseCubit, AddCourseState>(
                                buildWhen: ((previous, current) =>
                                    (previous.programs?.length !=
                                        current.programs?.length)),
                                builder: (context, state) {
                                  return CustomChoiceWidget(
                                    label: "Program",
                                    items: List.generate(
                                        state.programs?.length ?? 0,
                                        (index) =>
                                            CustomChoiceItem<ProgramEntity>(
                                                value: state.programs![index],
                                                label: state
                                                    .programs![index].name!)),
                                    onChange: (v) {
                                      context
                                          .read<AddCourseCubit>()
                                          .onValueChanged(
                                              AddCourseFormField.programId,
                                              v?.id);
                                    },
                                  );
                                },
                              ),
                              BlocBuilder<AddCourseCubit, AddCourseState>(
                                buildWhen: (previous, current) =>
                                    previous.studyYear != current.studyYear ||
                                    previous.semester != current.semester,
                                builder: (context, state) {
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: CustomChoiceWidget(
                                          label: "Study Year",
                                          items: List.generate(
                                              years.length,
                                              (index) => CustomChoiceItem<int>(
                                                  value: years.keys
                                                      .elementAt(index),
                                                  label: years.values
                                                      .elementAt(index))),
                                          onChange: (v) {
                                            context
                                                .read<AddCourseCubit>()
                                                .setStudyYear(v);
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomChoiceWidget(
                                          label: "Semester",
                                          items: List.generate(
                                              semesters.length,
                                              (index) => CustomChoiceItem<int>(
                                                  value: semesters.keys
                                                      .elementAt(index),
                                                  label: semesters.values
                                                      .elementAt(index))),
                                          onChange: (v) {
                                            context
                                                .read<AddCourseCubit>()
                                                .setSemester(v);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              BlocBuilder<AddCourseCubit, AddCourseState>(
                                buildWhen: (previous, current) =>
                                    previous.form[
                                            AddCourseFormField.courseName] !=
                                        current.form[
                                            AddCourseFormField.courseName] ||
                                    previous.image != current.image,
                                builder: (context, state) {
                                  return CoursePreviewWidget(
                                      courseName: context
                                              .read<AddCourseCubit>()
                                              .value(AddCourseFormField
                                                  .courseName) ??
                                          "Course Name",
                                      imagePath: state.image?.path,
                                      onImageEdit: () {
                                        context
                                            .read<AddCourseCubit>()
                                            .pickCourseImage();
                                      });
                                },
                              )
                            ],
                          )),
                    ),
                  );
                }),
                Builder(builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(15),
                    child: SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: FilledButton(
                          onPressed: () {
                            context.read<AddCourseCubit>().create();
                          },
                          style: FilledButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          child: const Text("Continue"),
                        )),
                  );
                })
              ],
            ))),
      ),
    );
  }
}
