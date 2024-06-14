import 'package:fpdart/fpdart.dart';
import 'package:main_platform/app/domain/entity/community/create_community_entity.dart';
import 'package:main_platform/core/error/failure.dart';

abstract interface class CreateCommunityRepository {
  Future<Either<Failure, String>> createCommunity(CreateCommunityEntity entity);
}
