import 'package:mundialito/app/firebase/onboarding/home/home_remote_data_source.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

class HomeRepository {
  final HomeRemoteDataSource _remoteDataSource = HomeRemoteDataSource();

  Future<List<MundialitoFirebaseObject>> getMyMundialitos() async {
    var response = await _remoteDataSource.getMyMundialitos();
    return response ?? [];
  }

  Future<List<MundialitoFirebaseObject>> getInvitedMundialitos() async {
    var response = await _remoteDataSource.getInvitedMundialitos();
    return response ?? [];
  }
}