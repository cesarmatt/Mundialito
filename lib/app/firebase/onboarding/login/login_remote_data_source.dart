import 'package:firebase_auth/firebase_auth.dart';
import 'package:mundialito/app/firebase/onboarding/login/login_service.dart';
import 'package:mundialito/app/models/onboarding/login/login_payload.dart';
import 'package:mundialito/app/models/onboarding/login/login_response.dart';
import 'package:mundialito/app/models/onboarding/login/login_status.dart';

class LoginRemoteDataSource implements LoginService {
  @override
  Future<LoginResponse> doLogin(LoginPayload loginPayload) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginPayload.emailAddress, password: loginPayload.password);
      return LoginResponse(
          LoginStatus.success,
          credential
      );
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        return LoginResponse(
            LoginStatus.noUser,
            null
        );
      } else if (exception.code == 'wrong-password') {
        return LoginResponse(
            LoginStatus.wrongPassword,
            null
        );
      }
    }

    return LoginResponse(LoginStatus.failed, null);
  }
}
