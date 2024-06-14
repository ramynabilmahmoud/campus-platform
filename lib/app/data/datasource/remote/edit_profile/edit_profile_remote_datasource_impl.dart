import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:main_platform/app/data/datasource/remote/edit_profile/edit_profile_remote_datasource.dart';
import 'package:main_platform/app/data/model/edit_profile/request/edit_profile_request_model.dart';
import 'package:main_platform/app/data/model/edit_profile/response/edit_profile_response_model.dart';
import 'package:main_platform/app/domain/entity/edit_profile/edit_profile_entity.dart';
import 'package:main_platform/core/di/di.dart';

@LazySingleton(as: EditProfileRemoteDataSource)
class EditProfileRemoteDataSourceImpl implements EditProfileRemoteDataSource {
  @override
  Future<bool> editProfile(EditProfileEntity profile) async {
    final model = EditProfileRequestModel().fromEntity(profile);
    final payload = model.toJson();

    try {
      if (profile.profilePicture != null) {
        var ext = profile.profilePicture!.name.split('.').last;
        var name =
            '${md5.convert(utf8.encode(profile.profilePicture!.path))}.$ext';
        MultipartFile file;
        if (kIsWeb) {
          var bytes = await profile.profilePicture!.readAsBytes();
          file = MultipartFile.fromBytes(bytes, filename: name);
        } else {
          file = await MultipartFile.fromFile(profile.profilePicture!.path,
              filename: name);
        }
        payload['avatar'] = file;
      }

      final resp = await getIt<Dio>()
          .put('/user/me/profile', data: FormData.fromMap(payload));
      final respModel = EditProfileResponseModel.fromJson(resp.data);
      return respModel.success;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
