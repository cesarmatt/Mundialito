import 'package:firebase_auth/firebase_auth.dart';
import 'package:mundialito/app/firebase/onboarding/login/login_service.dart';
import 'package:mundialito/app/models/onboarding/login/login_payload.dart';
import 'package:mundialito/app/models/onboarding/login/login_response.dart';
import 'package:mundialito/app/models/onboarding/login/login_status.dart';
import 'package:mundialito/app/models/user/current_user.dart';

class LoginRemoteDataSource implements LoginService {
  @override
  Future<LoginResponse> doLogin(LoginPayload loginPayload) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginPayload.emailAddress, password: loginPayload.password);
      _setCurrentUser();
      return LoginResponse(LoginStatus.success, credential);
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        return LoginResponse(LoginStatus.noUser, null);
      } else if (exception.code == 'wrong-password') {
        return LoginResponse(LoginStatus.wrongPassword, null);
      }
    }

    return LoginResponse(LoginStatus.failed, null);
  }

  void _setCurrentUser() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CurrentUser(
          name: user.displayName ?? "", email: user.email ?? "", uid: user.uid);
    }
  }
}
