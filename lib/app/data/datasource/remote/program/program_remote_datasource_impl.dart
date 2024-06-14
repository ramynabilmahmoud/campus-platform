import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/program/program_remote_datasource.dart';
import 'package:main_platform/app/data/model/program/program_model.dart';
import 'package:main_platform/core/di/di.dart';

@LazySingleton(as: ProgramRemoteDataSource)
class ProgramRemoteDataSourceImpl implements ProgramRemoteDataSource {
  @override
  Future<List<ProgramModel>> getProgramList() async {
    try {
      final resp = await getIt<Dio>().get('/program');
      var model =
          (resp.data as List).map((e) => ProgramModel.fromJson(e)).toList();
      return model;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
