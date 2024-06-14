import 'package:dio/dio.dart';

class Failure implements Exception {
  final String message;

  final String? location;

  final int? code;

  final int? statusCode;

  final Map<String, dynamic>? raw;

  final DioException? exception;

  const Failure(this.message,
      {this.exception, this.location, this.code, this.raw, this.statusCode})
      : super();

  Failure copyWith({
    String? message,
    DioException? exception,
    String? location,
    int? statusCode,
    int? code,
    Map<String, dynamic>? raw,
  }) =>
      Failure(
        message ?? this.message,
        exception: exception ?? this.exception,
        location: location ?? this.location,
        code: code ?? this.code,
        statusCode: statusCode ?? this.statusCode,
        raw: raw ?? this.raw,
      );
}
