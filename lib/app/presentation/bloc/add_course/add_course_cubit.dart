import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/course/create_course_entity.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/domain/usecase/course/create_course_usecase.dart';
import 'package:main_platform/app/domain/usecase/program/get_programs_usecase.dart';
import 'package:main_platform/app/presentation/bloc/add_course/add_course_state.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_cubit.dart';
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart';
import 'package:main_platform/core/di/di.dart';

@injectable
class AddCourseCubit
    extends CustomFormCubit<AddCourseFormField, AddCourseState> {
  AddCourseCubit() : super(const AddCourseState()) {
    fetchPrograms();
  }

  final ImagePicker picker = ImagePicker();
  final GetProgramsUseCase _getProgramsUseCase = getIt<GetProgramsUseCase>();
  final CreateCourseUseCase _createCourseUseCase = getIt<CreateCourseUseCase>();

  void fetchPrograms() {
    emit(state.copyWith(status: AddCourseStatus.loading));

    _getProgramsUseCase.call(NoParams()).then((result) {
      result.fold((error) {
        emit(state.copyWith(
            status: AddCourseStatus.programsError, error: error));
      }, (programs) {
        emit(state.copyWith(
            programs: programs, status: AddCourseStatus.programsLoaded));
      });
    });
  }

  void setProgramAssociated(bool value) {
    emit(state.copyWith(programAssociated: value));
  }

  void setCommunity(bool value) {
    emit(state.copyWith(community: value));
  }

  void pushProgramTag(String tag) {
    List<String> tags = [...(state.tags ?? [])];
    if (tags.isNotEmpty) {
      tags.removeAt(0);
    }

    tags.add(tag.toUpperCase());
    tags = Set.of(tags).toList();
    emit(state.copyWith(tags: tags));
  }

  void pushStudyYearTag(String year) {
    List<String> tags = [...(state.tags ?? [])];
    if (tags.length > 1) {
      tags.removeAt(1);
    }

    tags.add(year);
    tags = Set.of(tags).toList();
    emit(state.copyWith(tags: tags));
  }

  void pushSemesterTag(String sem) {
    List<String> tags = [...(state.tags ?? [])];
    if (tags.length > 2) {
      tags.removeAt(2);
    }

    tags.add(sem);
    tags = Set.of(tags).toList();
    emit(state.copyWith(tags: tags));
  }

  void pickCourseImage() async {
    var file =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (file != null) {
      emit(state.copyWith(image: file));
    }
  }

  void setSemester(int? semester) => emit(state.copyWith(semester: semester));
  void setStudyYear(int? year) => emit(state.copyWith(studyYear: year));

  Future<void> create() async {
    var semester = (state.studyYear! - 1) * 2 + state.semester!;

    CreateCourseEntity entity = CreateCourseEntity(
        courseName: value(AddCourseFormField.courseName),
        courseCode: value(AddCourseFormField.courseCode),
        community: state.community,
        programId: value(AddCourseFormField.programId),
        semester: semester,
        image: state.image);

    emit(state.copyWith(status: AddCourseStatus.loading));

    var result = await _createCourseUseCase(entity);
    result.fold((error) {
      emit(state.copyWith(status: AddCourseStatus.error, error: error));
    }, (courseId) {
      emit(state.copyWith(status: AddCourseStatus.success, courseId: courseId));
    });
  }

  @override
  Future<String?> validateField(AddCourseFormField field, String? value) async {
    var form = {...state.form};

    value ??= this.value(field);
    var validator = mapValidation(field);
    var error = validator != null ? await validator(value) : null;

    form[field] =
        CustomFormFieldState(value: value, error: error, isLoading: false);

    form = {...state.form};

    form[field] =
        CustomFormFieldState(value: value, error: error, isLoading: false);

    emit(state.copyWith(form: form));

    return error;
  }

  Future<String?> validateProgramId(String? programId) async {
    return null;
  }

  @override
  Future<String?> Function(String?)? mapValidation(AddCourseFormField field) {
    return switch (field) {
      AddCourseFormField.programId => validateProgramId,
      _ => null
    };
  }

  @override
  AddCourseFormField? mapLocation(String location) {
    return switch (location) {
      'course_name' => AddCourseFormField.courseName,
      'course_code' => AddCourseFormField.courseCode,
      _ => null
    };
  }
}
