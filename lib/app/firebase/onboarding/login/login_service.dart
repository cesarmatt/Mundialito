import 'package:mundialito/app/models/onboarding/login/login_payload.dart';
import 'package:mundialito/app/models/onboarding/login/login_response.dart';

abstract class LoginService {
  Future<LoginResponse> doLogin(LoginPayload loginPayload);
}