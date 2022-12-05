import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

abstract class HomeService {
  Future<List<MundialitoFirebaseObject>?> getMyMundialitos();
  Future<List<MundialitoFirebaseObject>?> getInvitedMundialitos();
}