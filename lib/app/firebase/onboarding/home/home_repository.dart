import 'package:mundialito/app/firebase/onboarding/home/home_remote_data_source.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/mundialito_home_view_object.dart';

class HomeRepository {
  final HomeRemoteDataSource _remoteDataSource = HomeRemoteDataSource();

  Future<List<MundialitoHomeViewObject>> getMundialitos() async {
    var response = await _remoteDataSource.getMundialitos();
    return response ?? [];
  }
}