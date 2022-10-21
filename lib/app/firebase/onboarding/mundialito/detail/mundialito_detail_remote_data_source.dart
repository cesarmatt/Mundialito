import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_service.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/models/match/match_firebase_object.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

class MundialitoDetailRemoteDataSource implements MundialitoDetailService {
  final _firebaseFirestoreMundialitoRef = FirebaseFirestore.instance
      .collection('mundialitos')
      .withConverter<MundialitoFirebaseObject>(
          fromFirestore: ((snapshot, _) =>
              MundialitoFirebaseObject.fromJson(snapshot.data()!)),
          toFirestore: ((mundialito, _) => mundialito.toJson()));

  final _firebaseFirestoreMatchRef = FirebaseFirestore.instance
      .collection('matches')
      .withConverter<MatchFirebaseObject>(
          fromFirestore: ((snapshot, _) =>
              MatchFirebaseObject.fromJson(snapshot.data()!)),
          toFirestore: ((match, _) => match.toJson()));

  @override
  Future<Mundialito> getMundialitoById(String mundialitoId) async {
    var snapshot = await _firebaseFirestoreMundialitoRef
        .doc(mundialitoId)
        .get();
    Mundialito mundialito = await _makeMundialito(snapshot);
    return mundialito;
  }

  @override
  Future<Match> getMatchById(String matchId) async {
    var snapshot = await _firebaseFirestoreMatchRef.doc(matchId).get();
    Match match = _makeMatch(snapshot);
    return match;
  }

  Future<Mundialito> _makeMundialito(DocumentSnapshot<MundialitoFirebaseObject> snapshot) async {
    var mundialitoFirebase = snapshot.data();
    var fromFirebaseMatches = mundialitoFirebase?.matches ?? [];
    var matches = <Match>[];
    for (String firebaseMatch in fromFirebaseMatches) {
      var match = await getMatchById(firebaseMatch);
      matches.add(match);
    }
    return Mundialito(
        uid: snapshot.id,
        name: mundialitoFirebase?.name ?? "",
        startDate: mundialitoFirebase?.startDate ?? Timestamp.now(),
        endDate: mundialitoFirebase?.endDate ?? Timestamp.now(),
        contenders: mundialitoFirebase?.contenders as List<dynamic>,
        owner: mundialitoFirebase?.owner ?? "",
        matches: matches,
        isCompleted: mundialitoFirebase?.isCompleted ?? false
    );
  }

  Match _makeMatch(DocumentSnapshot<MatchFirebaseObject> snapshot) {
    var matchFirebase = snapshot.data();
    return Match(
        uid: snapshot.id,
        contenderH: matchFirebase?.contenderH ?? "",
        contenderA: matchFirebase?.contenderA ?? "",
        scoreContenderH: matchFirebase?.scoreContenderH ?? 0,
        scoreContenderA: matchFirebase?.scoreContenderA ?? 0,
        isFinished: matchFirebase?.isFinished ?? false);
  }
}
