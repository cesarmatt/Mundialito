import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/join/join_mundialito_service.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';
import 'package:mundialito/app/models/user/current_user.dart';

class JoinMundialitoRemoteDataSource implements JoinMundialitoService {
  final _firebaseFirestoreMundialitoRef = FirebaseFirestore.instance
      .collection('mundialitos')
      .withConverter<MundialitoFirebaseObject>(
          fromFirestore: ((snapshot, _) =>
              MundialitoFirebaseObject.fromJson(snapshot.data()!)),
          toFirestore: ((mundialito, _) => mundialito.toJson()));

  @override
  Future<bool> joinMundialito(String joinCode) async {
    late bool response;
    MundialitoFirebaseObject? mundialitoWithJoinCode =
        await _getMundialitoWithJoinCode(joinCode);
    if (mundialitoWithJoinCode != null) {
      response = await _updateJoinedMundialito(mundialitoWithJoinCode);
    } else {
      response = false;
    }

    return response;
  }

  Future<bool> _updateJoinedMundialito(
      MundialitoFirebaseObject mundialitoWithJoinCode) async {
    late bool response;
    var joinedUsers = mundialitoWithJoinCode.joinedUsers ?? [];
    joinedUsers.add(CurrentUser.getCurrentUser().uid);
    await _firebaseFirestoreMundialitoRef
        .doc(mundialitoWithJoinCode.uid)
        .update({'joinedUsers': joinedUsers})
        .then((value) => response = true)
        .catchError((error) => response = false);

    return response;
  }

  Future<MundialitoFirebaseObject?> _getMundialitoWithJoinCode(
      String joinCode) async {
    var snapshot = await _firebaseFirestoreMundialitoRef
        .where('joinCode', isEqualTo: joinCode)
        .get()
        .then((snapshot) => snapshot.docs);
    List<MundialitoFirebaseObject>? mundialitos = _makeMundialitoList(snapshot);
    return mundialitos?.first;
  }

  List<MundialitoFirebaseObject>? _makeMundialitoList(
      List<QueryDocumentSnapshot<MundialitoFirebaseObject>> snapshot) {
    var mundialitoList = <MundialitoFirebaseObject>[];
    for (var item in snapshot) {
      MundialitoFirebaseObject mundialitoFirebaseObject = item.data();
      mundialitoFirebaseObject.uid = item.id;
      mundialitoList.add(mundialitoFirebaseObject);
    }
    return mundialitoList;
  }
}
