import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/firebase/onboarding/home/home_service.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';
import 'package:mundialito/app/models/user/current_user.dart';
import 'package:mundialito/app/models/match/match.dart';

class HomeRemoteDataSource implements HomeService {
  final _firebaseFirestoreMundialitoRef = FirebaseFirestore.instance
  .collection('mundialitos')
  .withConverter<MundialitoFirebaseObject>(
      fromFirestore: ((snapshot, _) => MundialitoFirebaseObject.fromJson(snapshot.data()!)),
      toFirestore: ((mundialito, _) => mundialito.toJson())
  );


  @override
  Future<List<MundialitoFirebaseObject>?> getMyMundialitos() async {
    var snapshot = await _firebaseFirestoreMundialitoRef
        .where('owner', isEqualTo: CurrentUser.getCurrentUser().uid)
        .get()
        .then((snapshot) => snapshot.docs);
    List<MundialitoFirebaseObject>? mundialitos = _makeMundialitoList(snapshot);
    return mundialitos ?? [];
  }

  List<MundialitoFirebaseObject>? _makeMundialitoList(List<QueryDocumentSnapshot<MundialitoFirebaseObject>> snapshot) {
    var mundialitoList = <MundialitoFirebaseObject>[];
    for (var item in snapshot) {
      MundialitoFirebaseObject mundialitoFirebaseObject = item.data();
      mundialitoFirebaseObject.uid = item.id;
      mundialitoList.add(mundialitoFirebaseObject);
    }
    return mundialitoList;
  }

  @override
  Future<List<MundialitoFirebaseObject>?> getInvitedMundialitos() async {
    var snapshot = await _firebaseFirestoreMundialitoRef
        .where('joinedUsers', arrayContains: CurrentUser.getCurrentUser().uid)
        .get()
        .then((snapshot) => snapshot.docs);
    List<MundialitoFirebaseObject>? mundialitos = _makeMundialitoList(snapshot);
    return mundialitos ?? [];
  }

}