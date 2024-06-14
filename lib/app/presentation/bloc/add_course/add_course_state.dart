import 'package:image_picker/image_picker.dart';
import 'package:main_platform/app/domain/entity/program/program_entity.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/error/failure.dart';

enum AddCourseFormField {
  courseName,
  courseCode,
  programId,
  semester,
}

enum AddCourseStatus {
  initial,
  loading,
  error,
  success,
  programsLoaded,
  programsError
}

class AddCourseState implements CustomFormInterface<AddCourseFormField> {
  @override
  final CustomForm<AddCourseFormField> form;

  final AddCourseStatus status;
  final Failure? error;
  final XFile? image;
  final List<ProgramEntity>? programs;
  final List<String>? tags;
  final bool? programAssociated;
  final bool? community;
  final int? studyYear;
  final int? semester;
  final String? courseId;

  const AddCourseState(
      {this.status = AddCourseStatus.initial,
      this.image,
      this.error,
      this.courseId,
      this.studyYear,
      this.community = false,
      this.semester,
      this.programAssociated = false,
      this.tags = const [],
      this.programs = const [],
      this.form = const {}});

  @override
  AddCourseState copyWith(
      {AddCourseStatus? status,
      CustomForm<AddCourseFormField>? form,
      Failure? error,
      List<ProgramEntity>? programs,
      List<String>? tags,
      int? studyYear,
      int? semester,
      String? courseId,
      bool? programAssociated,
      bool? community,
      XFile? image}) {
    return AddCourseState(
        status: status ?? this.status,
        form: form ?? this.form,
        community: community ?? this.community,
        courseId: courseId ?? this.courseId,
        tags: tags ?? this.tags,
        semester: semester ?? this.semester,
        studyYear: studyYear ?? this.studyYear,
        programAssociated: programAssociated ?? this.programAssociated,
        programs: programs ?? this.programs,
        error: error ?? this.error,
        image: image ?? this.image);
  }
}
