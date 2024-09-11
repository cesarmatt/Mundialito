import 'package:firebase_auth/firebase_auth.dart';
import 'package:mundialito/app/firebase/onboarding/register/register_service.dart';
import 'package:mundialito/app/models/onboarding/register/register_payload.dart';
import 'package:mundialito/app/models/onboarding/register/register_response.dart';
import 'package:mundialito/app/models/onboarding/register/register_status.dart';

class RegisterRemoteDataSource implements RegisterService {
  @override
  Future<RegisterResponse> doRegister(RegisterPayload registerPayload) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
          email: registerPayload.emailAddress, password: registerPayload.password);
      return RegisterResponse(RegisterStatus.success, credential);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'weak-password') {
        return RegisterResponse(RegisterStatus.weakPassword, null);
      } else if (exception.code == 'email-already-in-use') {
        return RegisterResponse(RegisterStatus.existingEmail, null);
      }
    }

    return RegisterResponse(RegisterStatus.failed, null);
  }

}