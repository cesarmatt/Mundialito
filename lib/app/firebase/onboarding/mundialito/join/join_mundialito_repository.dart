import 'package:mundialito/app/firebase/onboarding/mundialito/join/join_mundialito_remote_data_source.dart';

class JoinMundialitoRepository {
  JoinMundialitoRemoteDataSource _remoteDataSource = JoinMundialitoRemoteDataSource();

  Future<bool> joinMundialito(String joinCode) async {
    var response = await _remoteDataSource.joinMundialito(joinCode);
    return response;
  }
}