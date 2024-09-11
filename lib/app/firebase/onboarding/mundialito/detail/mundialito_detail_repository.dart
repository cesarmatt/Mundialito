import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_remote_data_source.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';

class MundialitoDetailRepository {
  final MundialitoDetailRemoteDataSource _remoteDataSource = MundialitoDetailRemoteDataSource();

  Future<Mundialito?> getMundialitoById(String mundialitoId) async {
    var response = await _remoteDataSource.getMundialitoById(mundialitoId);
    return response;
  }

  Future<bool> finishMundialito(String mundialitoId) async {
    var response = await _remoteDataSource.finishMundialito(mundialitoId);
    return response;
  }

  Future<bool> cancelMundialito(String mundialitoId) async {
    var response = await _remoteDataSource.cancelMundialito(mundialitoId);
    return response;
  }

}