import 'package:injectable/injectable.dart';
import 'package:main_platform/app/domain/entity/auth/user_entity.dart';

@lazySingleton
class AuthCache {
  String? accessToken;
  String? refreshToken;
  AuthUserEntity? user;

  String get displayName {
    return user!.englishName != null ? user!.englishName! : user!.fullName!;
  }

  // String get profilePicture {
  //   return user.profilePicture;
  // }

  String get shortenDisplayName {
    return displayName.split(' ')[0];
  }
}
