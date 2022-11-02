import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_remote_data_source.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';

class MundialitoDetailRepository {
  final MundialitoDetailRemoteDataSource _remoteDataSource = MundialitoDetailRemoteDataSource();

  Future<Mundialito?> getMundialitoById(String mundialitoId) async {
    var response = await _remoteDataSource.getMundialitoById(mundialitoId);
    return response;
  }

}