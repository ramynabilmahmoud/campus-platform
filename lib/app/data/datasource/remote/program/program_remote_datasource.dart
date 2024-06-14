import 'package:main_platform/app/data/model/program/program_model.dart';

abstract interface class ProgramRemoteDataSource {
  Future<List<ProgramModel>> getProgramList();
}
