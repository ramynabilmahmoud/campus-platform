// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i31;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:main_platform/app/data/datasource/local/auth/auth_local_data_source_impl.dart'
    as _i72;
import 'package:main_platform/app/data/datasource/local/auth/auth_local_data_srouce.dart'
    as _i71;
import 'package:main_platform/app/data/datasource/local/main/app_prefs_local_data_source.dart'
    as _i46;
import 'package:main_platform/app/data/datasource/local/main/app_prefs_local_data_source_impl.dart'
    as _i47;
import 'package:main_platform/app/data/datasource/local/user/user_local_data_source.dart'
    as _i69;
import 'package:main_platform/app/data/datasource/local/user/user_local_data_source_impl.dart'
    as _i70;
import 'package:main_platform/app/data/datasource/remote/auth/auth_remote_data_source.dart'
    as _i67;
import 'package:main_platform/app/data/datasource/remote/auth/auth_remote_data_source_impl.dart'
    as _i68;
import 'package:main_platform/app/data/datasource/remote/community/community_remote_datasource.dart'
    as _i58;
import 'package:main_platform/app/data/datasource/remote/community/community_remote_datasource_impl.dart'
    as _i59;
import 'package:main_platform/app/data/datasource/remote/course/course_remote_datasource.dart'
    as _i44;
import 'package:main_platform/app/data/datasource/remote/course/course_remote_datasource_impl.dart'
    as _i45;
import 'package:main_platform/app/data/datasource/remote/edit_profile/edit_profile_remote_datasource.dart'
    as _i41;
import 'package:main_platform/app/data/datasource/remote/edit_profile/edit_profile_remote_datasource_impl.dart'
    as _i42;
import 'package:main_platform/app/data/datasource/remote/profile/remote_profile_datasource.dart'
    as _i43;
import 'package:main_platform/app/data/datasource/remote/program/program_remote_datasource.dart'
    as _i37;
import 'package:main_platform/app/data/datasource/remote/program/program_remote_datasource_impl.dart'
    as _i38;
import 'package:main_platform/app/data/datasource/remote/user/user_remote_data_source.dart'
    as _i61;
import 'package:main_platform/app/data/datasource/remote/user/user_remote_data_source_impl.dart'
    as _i62;
import 'package:main_platform/app/data/repository/auth/auth_repository_impl.dart'
    as _i57;
import 'package:main_platform/app/data/repository/community/create_community_repository_impl.dart'
    as _i66;
import 'package:main_platform/app/data/repository/course/course_repository_impl.dart'
    as _i53;
import 'package:main_platform/app/data/repository/edit_profile/edit_profile_repository_impl.dart'
    as _i64;
import 'package:main_platform/app/data/repository/main/app_prefs_repository_impl.dart'
    as _i55;
import 'package:main_platform/app/data/repository/profile/profile_info_repository_imlpl.dart'
    as _i51;
import 'package:main_platform/app/data/repository/program/program_repository_impl.dart'
    as _i40;
import 'package:main_platform/app/data/repository/user/user_repository_impl.dart'
    as _i49;
import 'package:main_platform/app/domain/repository/auth/auth_repository.dart'
    as _i56;
import 'package:main_platform/app/domain/repository/community/create_community_repository.dart'
    as _i65;
import 'package:main_platform/app/domain/repository/course/course_repository.dart'
    as _i52;
import 'package:main_platform/app/domain/repository/edit_profile/edit_profile_repository.dart'
    as _i63;
import 'package:main_platform/app/domain/repository/main/app_prefs_repository.dart'
    as _i54;
import 'package:main_platform/app/domain/repository/profile/profile_info_repository.dart'
    as _i50;
import 'package:main_platform/app/domain/repository/program/program_repository.dart'
    as _i39;
import 'package:main_platform/app/domain/repository/user/user_repository.dart'
    as _i48;
import 'package:main_platform/app/domain/usecase/auth/load_access_token_usecase.dart'
    as _i9;
import 'package:main_platform/app/domain/usecase/auth/load_auth_user_usecase.dart'
    as _i10;
import 'package:main_platform/app/domain/usecase/auth/load_refresh_token_usecase.dart'
    as _i11;
import 'package:main_platform/app/domain/usecase/auth/login_usecase.dart'
    as _i12;
import 'package:main_platform/app/domain/usecase/auth/logout_usecase.dart'
    as _i13;
import 'package:main_platform/app/domain/usecase/auth/set_auth_tokens_usecase.dart'
    as _i14;
import 'package:main_platform/app/domain/usecase/auth/signup_usecase.dart'
    as _i15;
import 'package:main_platform/app/domain/usecase/auth/user_exists_usecase.dart'
    as _i16;
import 'package:main_platform/app/domain/usecase/course/create_course_usecase.dart'
    as _i17;
import 'package:main_platform/app/domain/usecase/edit_profile/edit_profile_usecase.dart'
    as _i18;
import 'package:main_platform/app/domain/usecase/main/get_dark_mode_usecase.dart'
    as _i19;
import 'package:main_platform/app/domain/usecase/main/get_locale_usecase.dart'
    as _i20;
import 'package:main_platform/app/domain/usecase/main/set_dark_mode_usecase.dart'
    as _i21;
import 'package:main_platform/app/domain/usecase/main/set_locale_usecase.dart'
    as _i22;
import 'package:main_platform/app/domain/usecase/profile/get_profile_info_usecase.dart'
    as _i60;
import 'package:main_platform/app/domain/usecase/program/get_programs_usecase.dart'
    as _i23;
import 'package:main_platform/app/domain/usecase/user/fill_student_info_usecase.dart'
    as _i24;
import 'package:main_platform/app/domain/usecase/user/get_privacy_settings_usecase.dart'
    as _i25;
import 'package:main_platform/app/domain/usecase/user/set_privacy_settings_usecase.dart'
    as _i26;
import 'package:main_platform/app/presentation/bloc/add_course/add_course_cubit.dart'
    as _i3;
import 'package:main_platform/app/presentation/bloc/auth/auth_cubit.dart'
    as _i27;
import 'package:main_platform/app/presentation/bloc/find_student_code/find_student_code_cubit.dart'
    as _i73;
import 'package:main_platform/app/presentation/bloc/find_student_code/find_student_code_state.dart'
    as _i74;
import 'package:main_platform/app/presentation/bloc/login/login_cubit.dart'
    as _i4;
import 'package:main_platform/app/presentation/bloc/main/app_prefs_cubit.dart'
    as _i28;
import 'package:main_platform/app/presentation/bloc/main/custom_form/custom_form_state.dart'
    as _i76;
import 'package:main_platform/app/presentation/bloc/privacy_settings/privacy_settings_cubit.dart'
    as _i5;
import 'package:main_platform/app/presentation/bloc/signup/fill_student_info_cubit.dart'
    as _i6;
import 'package:main_platform/app/presentation/bloc/signup/signup_cubit.dart'
    as _i7;
import 'package:main_platform/app/presentation/bloc/signup/verify_email_cubit.dart'
    as _i8;
import 'package:main_platform/core/cache/auth_cache.dart' as _i29;
import 'package:main_platform/core/cache/user_cache.dart' as _i30;
import 'package:main_platform/core/di/modules/dio_client.dart' as _i77;
import 'package:main_platform/core/di/modules/shared_prefs.dart' as _i78;
import 'package:main_platform/core/error/failure.dart' as _i75;
import 'package:main_platform/core/router/router.dart' as _i33;
import 'package:main_platform/core/services/dio/interceptors/auth_interceptor.dart'
    as _i34;
import 'package:main_platform/core/services/hive_service.dart' as _i35;
import 'package:main_platform/core/services/secure_storage.dart' as _i36;
import 'package:shared_preferences/shared_preferences.dart' as _i32;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioInjection = _$DioInjection();
    final sharedPrefsModule = _$SharedPrefsModule();
    gh.factory<_i3.AddCourseCubit>(() => _i3.AddCourseCubit());
    gh.factory<_i4.LoginCubit>(() => _i4.LoginCubit());
    gh.factory<_i5.PrivacySettingsCubit>(() => _i5.PrivacySettingsCubit());
    gh.factory<_i6.FillStudentInfoCubit>(() => _i6.FillStudentInfoCubit());
    gh.factory<_i7.SignUpCubit>(() => _i7.SignUpCubit());
    gh.factory<_i8.VerfiyEmailCubit>(() => _i8.VerfiyEmailCubit());
    gh.lazySingleton<_i9.LoadAccessTokenUseCase>(
        () => _i9.LoadAccessTokenUseCase());
    gh.lazySingleton<_i10.LoadAuthUserUseCase>(
        () => _i10.LoadAuthUserUseCase());
    gh.lazySingleton<_i11.LoadRefreshTokenUseCase>(
        () => _i11.LoadRefreshTokenUseCase());
    gh.lazySingleton<_i12.LoginUseCase>(() => _i12.LoginUseCase());
    gh.lazySingleton<_i13.LogoutUseCase>(() => _i13.LogoutUseCase());
    gh.lazySingleton<_i14.SetAuthTokensUseCase>(
        () => _i14.SetAuthTokensUseCase());
    gh.lazySingleton<_i15.SignUpUseCase>(() => _i15.SignUpUseCase());
    gh.lazySingleton<_i16.UserExistsUseCase>(() => _i16.UserExistsUseCase());
    gh.lazySingleton<_i17.CreateCourseUseCase>(
        () => _i17.CreateCourseUseCase());
    gh.lazySingleton<_i18.EditProfileUseCase>(() => _i18.EditProfileUseCase());
    gh.lazySingleton<_i19.GetDarkModeUseCase>(() => _i19.GetDarkModeUseCase());
    gh.lazySingleton<_i20.GetLocaleUseCase>(() => _i20.GetLocaleUseCase());
    gh.lazySingleton<_i21.SetDarkModeUseCase>(() => _i21.SetDarkModeUseCase());
    gh.lazySingleton<_i22.SetLocaleUseCase>(() => _i22.SetLocaleUseCase());
    gh.lazySingleton<_i23.GetProgramsUseCase>(() => _i23.GetProgramsUseCase());
    gh.lazySingleton<_i24.FillStudentInfoUseCase>(
        () => _i24.FillStudentInfoUseCase());
    gh.lazySingleton<_i25.GetPrivacySettingsUseCase>(
        () => _i25.GetPrivacySettingsUseCase());
    gh.lazySingleton<_i26.SetPrivacySettingsUseCase>(
        () => _i26.SetPrivacySettingsUseCase());
    gh.lazySingleton<_i27.AuthCubit>(() => _i27.AuthCubit());
    gh.lazySingleton<_i28.AppPreferencesCubit>(
        () => _i28.AppPreferencesCubit());
    gh.lazySingleton<_i29.AuthCache>(() => _i29.AuthCache());
    gh.lazySingleton<_i30.UserCache>(() => _i30.UserCache());
    gh.lazySingleton<_i31.Dio>(() => dioInjection.dio());
    gh.lazySingletonAsync<_i32.SharedPreferences>(
        () => sharedPrefsModule.preferences());
    gh.lazySingleton<_i33.AppRouter>(() => _i33.AppRouter());
    gh.lazySingleton<_i34.AuthInterceptor>(() => _i34.AuthInterceptor());
    await gh.lazySingletonAsync<_i35.HiveService>(
      () => _i35.HiveService.create(),
      preResolve: true,
    );
    gh.lazySingleton<_i36.CampusSecureStorage>(
        () => _i36.CampusSecureStorage());
    gh.lazySingleton<_i37.ProgramRemoteDataSource>(
        () => _i38.ProgramRemoteDataSourceImpl());
    gh.lazySingleton<_i39.ProgramRepository>(
        () => _i40.ProgramRepositoryImpl());
    gh.lazySingleton<_i41.EditProfileRemoteDataSource>(
        () => _i42.EditProfileRemoteDataSourceImpl());
    gh.factory<_i43.RemoteProfileDataSource>(
        () => _i43.RemoteProfileDataSourceImpl());
    gh.lazySingleton<_i44.CourseRemoteDataSource>(
        () => _i45.CourseRemoteDataSourceImpl());
    gh.lazySingleton<_i46.AppPreferencesLocalDataSource>(
        () => _i47.AppPreferencesLocalDataSourceImpl());
    gh.lazySingleton<_i48.UserRepository>(() => _i49.UserRepositoryImpl());
    gh.factory<_i50.ProfileInfoRepository>(() => _i51.ProfileInfoRepositoryImpl(
        datasource: gh<_i43.RemoteProfileDataSource>()));
    gh.lazySingleton<_i52.CourseRepository>(() => _i53.CourseRepositoryImpl());
    gh.lazySingleton<_i54.AppPreferencesRepository>(
        () => _i55.AppPreferencesRepositoryImpl());
    gh.lazySingleton<_i56.AuthRepository>(() => _i57.AuthRepositoryImpl());
    gh.lazySingleton<_i58.CommunityRemoteDataSource>(
        () => _i59.CommunityRemoteDataSourceImpl());
    gh.factory<_i60.GetProfileInfoUseCase>(() => _i60.GetProfileInfoUseCase(
        profileInfoRepository: gh<_i50.ProfileInfoRepository>()));
    gh.lazySingleton<_i61.UserRemoteDataSource>(
        () => _i62.UserRemoteDataSourceImpl());
    gh.lazySingleton<_i63.EditProfileRepository>(
        () => _i64.EditProfileRepositoryImpl());
    gh.lazySingleton<_i65.CreateCommunityRepository>(
        () => _i66.CreateCommunityRepositoryImpl());
    gh.lazySingleton<_i67.AuthRemoteDataSource>(
        () => _i68.AuthRemoteDataSourceImpl());
    gh.lazySingleton<_i69.UserLocalDataSoruce>(
        () => _i70.UserLocalDataSoruceImpl());
    gh.lazySingleton<_i71.AuthLocalDataSource>(
        () => _i72.AuthLocalDataSourceImpl());
    gh.factory<_i73.FindStudentCodeCubit>(() => _i73.FindStudentCodeCubit(
        gh<_i74.FindStudentCodeState<_i74.FindStudentCodeFormField>>()));
    gh.factory<_i74.FindStudentCodeState<dynamic>>(
        () => _i74.FindStudentCodeState<dynamic>(
              status: gh<_i74.FindStudentCodeStatus>(),
              code: gh<String>(),
              error: gh<_i75.Failure>(),
              form: gh<_i76.CustomForm<dynamic>>(),
            ));
    return this;
  }
}

class _$DioInjection extends _i77.DioInjection {}

class _$SharedPrefsModule extends _i78.SharedPrefsModule {}
