import 'package:dio/dio.dart';
import 'package:fpdart/src/either.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/community/community_remote_datasource.dart';
import 'package:main_platform/app/domain/entity/community/create_community_entity.dart';
import 'package:main_platform/app/domain/repository/community/create_community_repository.dart';
import 'package:main_platform/core/di/di.dart';
import 'package:main_platform/core/error/dio_error_handler.dart';
import 'package:main_platform/core/error/failure.dart';

@LazySingleton(as: CreateCommunityRepository)
class CreateCommunityRepositoryImpl implements CreateCommunityRepository{
  final CommunityRemoteDataSource _courseRemoteDataSource =
      getIt<CommunityRemoteDataSource>();

  @override
  Future<Either<Failure, String>> createCommunity(
      CreateCommunityEntity community) async {
    try {
      String communityId = await _courseRemoteDataSource.createCommunity(community);
      return right(communityId);
    } on DioException catch (exc) {
      return left(getServerException(exc));
    }
  }
}
