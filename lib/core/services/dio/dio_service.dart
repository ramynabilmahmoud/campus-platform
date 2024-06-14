import 'package:dio/dio.dart';
import 'package:main_platform/core/constants/api_constants.dart';
import 'package:main_platform/core/services/dio/interceptors/auth_interceptor.dart';
import 'package:main_platform/core/utils/build_mode.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio initDioClient() {
  final dio = Dio();
  dio.options.baseUrl = ApiConstants.endpointUrl;
  dio.options.headers['Accept-Language'] = 'en-US';
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 10);

  dio.interceptors.add(AuthInterceptor());

  if (BuildMode.isDebugMode) {
    dio.interceptors
        .add(PrettyDioLogger(requestBody: true, requestHeader: true));
  }

  return dio;
}
