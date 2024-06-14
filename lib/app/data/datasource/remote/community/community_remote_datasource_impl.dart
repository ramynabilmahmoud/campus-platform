import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/community/community_remote_datasource.dart';
import 'package:main_platform/app/data/model/community/request/create_community_request_model.dart';
import 'package:main_platform/app/data/model/community/response/create_community_response_model.dart';
import 'package:main_platform/app/domain/entity/community/create_community_entity.dart';
import 'package:main_platform/core/di/di.dart';

@LazySingleton(as: CommunityRemoteDataSource)
class CommunityRemoteDataSourceImpl implements CommunityRemoteDataSource {
  @override
  Future<String> createCommunity(CreateCommunityEntity community) async {
    try {
      final model = CreateCommunityRequestModel().fromEntity(community);
      final payload = model.toJson();
      if (community.imageId != null) {
        var ext = community.imageId!.path.split('.').last;
        var name = '${md5.convert(utf8.encode(community.imageId!.path))}.$ext';
        if (kIsWeb) {
          var bytes = await community.imageId!.readAsBytes();
          payload['image'] = MultipartFile.fromBytes(bytes, filename: name);
        } else {
          payload['image'] = await MultipartFile.fromFile(
              community.imageId!.name,
              filename: name);
        }
      }
      final dio = getIt<Dio>();
      final response = await dio.post<Map<String, dynamic>>(
        '/community',
        data: CreateCommunityRequestModel.fromEntity(community).toJson(),
      );
      final respModel = CreateCommunityResponseModel.fromJson(response.data!);
      return respModel.communityId;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
