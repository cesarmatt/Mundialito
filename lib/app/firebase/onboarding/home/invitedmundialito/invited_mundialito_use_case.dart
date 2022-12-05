import 'package:mundialito/app/firebase/onboarding/home/home_repository.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

class InvitedMundialitoUseCase {
  final HomeRepository _repository = HomeRepository();

  Future<List<MundialitoFirebaseObject>> getInvitedMundialitos() async {
    var response = await _repository.getInvitedMundialitos();
    return response;
  }
}