import 'package:jwt_decoder/jwt_decoder.dart';

bool hasTokenExpired(String? token) {
  if (token == null) {
    return true;
  }
  return JwtDecoder.isExpired(token);
}

String? getUserId(String? token) {
  if (token == null) {
    return null;
  }

  var payload = JwtDecoder.decode(token);
  return payload.containsKey("sub") ? payload["sub"] : null;
}
