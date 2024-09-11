import 'package:firebase_auth/firebase_auth.dart';
import 'package:mundialito/app/models/onboarding/register/register_status.dart';

class RegisterResponse {
  RegisterResponse(this.registerStatus, this.userCredential);

  RegisterStatus registerStatus;
  UserCredential? userCredential;
}