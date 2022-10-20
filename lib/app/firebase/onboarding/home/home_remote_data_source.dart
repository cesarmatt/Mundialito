import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/firebase/onboarding/home/home_service.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/mundialito_home_view_object.dart';
import 'package:mundialito/app/models/user/current_user.dart';
import 'package:mundialito/app/models/match/match.dart';

class HomeRemoteDataSource implements HomeService {
  final _firebaseFirestoreMundialitoRef = FirebaseFirestore.instance
  .collection('mundialitos')
  .withConverter<MundialitoHomeViewObject>(
      fromFirestore: ((snapshot, _) => MundialitoHomeViewObject.fromJson(snapshot.data()!)),
      toFirestore: ((mundialito, _) => mundialito.toJson())
  );


  @override
  Future<List<MundialitoHomeViewObject>?> getMundialitos() async {
    var snapshot = await _firebaseFirestoreMundialitoRef
        .where('owner', isEqualTo: CurrentUser.getCurrentUser().uid)
        .get()
        .then((snapshot) => snapshot.docs);
    List<MundialitoHomeViewObject>? mundialitos = _makeMundialitoList(snapshot);
    return mundialitos ?? [];
  }

  List<MundialitoHomeViewObject>? _makeMundialitoList(List<QueryDocumentSnapshot<MundialitoHomeViewObject>> snapshot) {
    return snapshot.map((mundialito) => mundialito.data()).toList();
  }

}