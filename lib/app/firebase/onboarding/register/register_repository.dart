import 'package:mundialito/app/firebase/onboarding/register/register_remote_data_source.dart';
import 'package:mundialito/app/models/onboarding/register/register_payload.dart';
import 'package:mundialito/app/models/onboarding/register/register_response.dart';

class RegisterRepository {
  RegisterRemoteDataSource _remoteDataSource = RegisterRemoteDataSource();

  Future<RegisterResponse> doRegister(RegisterPayload registerPayload) async {
    return await _remoteDataSource.doRegister(registerPayload);
  }
}