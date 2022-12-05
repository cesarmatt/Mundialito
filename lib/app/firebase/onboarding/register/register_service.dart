import 'package:mundialito/app/models/onboarding/register/register_payload.dart';
import 'package:mundialito/app/models/onboarding/register/register_response.dart';

abstract class RegisterService {
  Future<RegisterResponse> doRegister(RegisterPayload registerPayload);
}