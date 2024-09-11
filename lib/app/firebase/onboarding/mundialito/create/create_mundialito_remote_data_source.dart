import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/create/create_mundialito_service.dart';
import 'package:mundialito/app/models/match/match_firebase_object.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

class CreateMundialitoRemoteDataSource implements CreateMundialitoService {
  final _firebaseFirestoreMundialitoRef = FirebaseFirestore.instance
      .collection('mundialitos')
      .withConverter<MundialitoFirebaseObject>(
      fromFirestore: ((snapshot, _) =>
          MundialitoFirebaseObject.fromJson(snapshot.data()!)),
      toFirestore: ((mundialito, _) => mundialito.toJson())
  );

  final _firebaseFirestoreMatchRef = FirebaseFirestore.instance
      .collection('matches')
      .withConverter<MatchFirebaseObject>(
      fromFirestore: ((snapshot, _) => MatchFirebaseObject.fromJson(snapshot.data()!)),
      toFirestore: ((match, _) => match.toJson())
  );

  @override
  Future<String> createMundialito(MundialitoFirebaseObject mundialito) async {
    var matches = [];
    for (var match in mundialito.matches) {
      var matchReference = await saveMatch(match);
      matches.add(matchReference.id);
    }
    mundialito.matches = matches;
    var response = await _firebaseFirestoreMundialitoRef.add(mundialito);
    return response.id;
  }

  @override
  Future<DocumentReference<MatchFirebaseObject>> saveMatch(MatchFirebaseObject match) async {
    var response = await _firebaseFirestoreMatchRef.add(match);
    return response;
  }

}