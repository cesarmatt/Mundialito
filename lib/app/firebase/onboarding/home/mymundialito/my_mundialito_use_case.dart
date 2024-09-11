import 'package:mundialito/app/firebase/onboarding/home/home_repository.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

class MyMundialitoUseCase {
  final HomeRepository _repository = HomeRepository();

  Future<List<MundialitoFirebaseObject>> getMyMundialitos() async {
    var response = await _repository.getMyMundialitos();
    return response;
  }
}