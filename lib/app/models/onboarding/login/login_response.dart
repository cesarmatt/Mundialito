import 'package:firebase_auth/firebase_auth.dart';
import 'package:mundialito/app/models/onboarding/login/login_status.dart';

class LoginResponse {
  LoginResponse(this.loginStatus, this.userCredential);

  LoginStatus loginStatus;
  UserCredential? userCredential;
}
