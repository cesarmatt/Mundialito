import 'package:mundialito/app/firebase/onboarding/mundialito/create/create_mundialito_remote_data_source.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

class CreateMundialitoRepository {
  final CreateMundialitoRemoteDataSource _remoteDataSource = CreateMundialitoRemoteDataSource();

  Future<bool> createMundialito(MundialitoFirebaseObject mundialito) async {
    var response = await _remoteDataSource.createMundialito(mundialito);
    return response != null;
  }
}