import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/core/services/dio/dio_service.dart';

@module
abstract class DioInjection {
  @lazySingleton
  Dio dio() => initDioClient();
}
