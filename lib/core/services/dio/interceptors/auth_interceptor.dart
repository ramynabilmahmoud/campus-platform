import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/usecase/auth/load_access_token_usecase.dart';
import 'package:main_platform/app/domain/usecase/auth/load_refresh_token_usecase.dart';
import 'package:main_platform/app/domain/usecase/base.dart';
import 'package:main_platform/app/presentation/bloc/auth/auth_cubit.dart';
import 'package:main_platform/core/constants/error_codes.dart';
import 'package:main_platform/core/di/di.dart';

@lazySingleton
class AuthInterceptor extends Interceptor {
  final _loadAccessTokenUseCase = getIt<LoadAccessTokenUseCase>();
  final _loadRefershTokenUseCase = getIt<LoadRefreshTokenUseCase>();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['require-token'] == 'false') {
      options.headers.remove('require-token');
      if (options.headers['require-refresh-token'] == 'true') {
        options.headers.remove('require-refresh-token');
        var refreshToken = await _loadRefershTokenUseCase(NoParams());
        if (refreshToken != null) {
          options.headers.addAll({'x-campus-token': refreshToken});
        } else {
          return handler.reject(DioException(requestOptions: options));
        }
      }
      return handler.next(options);
    } else {
      var accessResult = await _loadAccessTokenUseCase(NoParams());
      accessResult.fold((error) {
        if (error.code == AuthErrorCodes.sessionExpired) {
          getIt<AuthCubit>().expire();
        }
        handler
            .reject(error.exception ?? DioException(requestOptions: options));
      }, (accessToken) {
        options.headers.addAll({'authorization': 'Bearer $accessToken'});
        handler.next(options);
      });
    }
  }
}
