import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:main_platform/core/constants/locale_keys.g.dart';
import 'package:main_platform/core/error/failure.dart';

Failure getServerException(DioException exc) {
  Failure error = Failure(exc.message ?? "", exception: exc);

  if (exc.response != null) {
    final data = exc.response!.data;
    var key = "error.status_code_${exc.response!.statusCode}";

    if (data["error_code"] != null) {
      key = "error.error_code_${data["error_code"]}";
      error = error.copyWith(code: data["error_code"]);
      if (key != key.tr()) {
        data['error'] = key;
      }
    }

    if (key == key.tr()) {
      key = "error.status_code_${exc.response!.statusCode}";
    }

    if (key != key.tr()) {
      data["error"] = key;
    }

    if (data["error"] != null) {
      error = Failure(data["error"], raw: data, exception: exc);
      if (data["location"] != null) {
        error = error.copyWith(location: data["location"]);
      }
      if (exc.response!.statusCode != null) {
        error = error.copyWith(statusCode: exc.response!.statusCode);
      }
    }
  } else {
    return error.copyWith(message: _getErrorMessage(exc));
  }
  return error;
}

String _getErrorMessage(DioException error) {
  switch (error.type) {
    case DioExceptionType.cancel:
      break;
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
      return LocaleKeys.error_connection_timeout;
    case DioExceptionType.connectionError:
      return LocaleKeys.error_connection_error;
    default:
      return LocaleKeys.error_unknown_error;
  }

  return LocaleKeys.error_unknown_error;
}
