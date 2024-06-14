import 'package:main_platform/app/domain/entity/community/create_community_entity.dart';

abstract interface class CommunityRemoteDataSource {
  Future<String> createCommunity(CreateCommunityEntity course);
}
