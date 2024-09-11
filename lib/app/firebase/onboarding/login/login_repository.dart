import 'package:mundialito/app/firebase/onboarding/login/login_remote_data_source.dart';
import 'package:mundialito/app/models/onboarding/login/login_payload.dart';
import '../../../models/onboarding/login/login_response.dart';

class LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource = LoginRemoteDataSource();

  Future<LoginResponse> doLogin(LoginPayload loginPayload) async {
    return await loginRemoteDataSource.doLogin(loginPayload);
  }
}