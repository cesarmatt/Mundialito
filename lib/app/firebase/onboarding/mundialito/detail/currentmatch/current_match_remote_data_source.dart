import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:mundialito/app/models/match/match_firebase_object.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'current_match_service.dart';

class CurrentMatchRemoteDataSource implements CurrentMatchService {
  final _firebaseFirestoreMatchRef = FirebaseFirestore.instance
      .collection('matches')
      .withConverter<MatchFirebaseObject>(
          fromFirestore: ((snapshot, _) =>
              MatchFirebaseObject.fromJson(snapshot.data()!)),
          toFirestore: ((match, _) => match.toJson()));

  @override
  Future<bool> cancelMatch(String matchId) async {
    late bool response;
    await _firebaseFirestoreMatchRef
        .doc(matchId)
        .update(
            {'scoreContenderH': 0, 'scoreContenderA': 0, 'isFinished': false})
        .then((value) => response = true)
        .catchError((error) => response = false);
    return response;
  }

  @override
  Future<bool> finishMatch(String matchId) async {
    late bool response;
    await _firebaseFirestoreMatchRef
        .doc(matchId)
        .update({'isFinished': true})
        .then((value) => response = true)
        .catchError((error) => response = false);
    return response;
  }

  @override
  Future<Match> getMatchById(String matchId) async {
    var snapshot = await _firebaseFirestoreMatchRef.doc(matchId).get();
    Match match = _makeMatch(snapshot);
    return match;
  }

  @override
  Future<bool> updateNextStageForWinner(int currentMatchIdentifier, String contender) async {
    late bool response;
    var querySnapshotList = await _firebaseFirestoreMatchRef
        .where('cameFrom', arrayContains: currentMatchIdentifier)
        .get()
        .then((snapshot) => snapshot.docs);
    var match = await _makeMatchFromQuerySnapshot(querySnapshotList, currentMatchIdentifier);
    if (match?.contenderH.contains("Winner #$currentMatchIdentifier") == true) {
      await _firebaseFirestoreMatchRef
          .doc(match?.uid ?? "")
          .update({'contenderH': contender})
          .then((value) => response = true)
          .catchError((error) => response = false);
    } else if (match?.contenderA.contains("Winner #$currentMatchIdentifier") == true) {
      await _firebaseFirestoreMatchRef
          .doc(match?.uid ?? "")
          .update({'contenderA': contender})
          .then((value) => response = true)
          .catchError((error) => response = false);
    } else {
      response = false;
    }

    return response;
  }

  @override
  Future<bool> updateAwayScore(String matchId, int score) async {
    late bool response;
    var awayScore = score;
    await _firebaseFirestoreMatchRef
        .doc(matchId)
        .update({'scoreContenderA': awayScore})
        .then((value) => response = true)
        .catchError((error) => response = false);
    return response;
  }

  @override
  Future<bool> updateHomeScore(String matchId, int score) async {
    late bool response;
    var homeScore = score;
    await _firebaseFirestoreMatchRef
        .doc(matchId)
        .update({'scoreContenderH': homeScore})
        .then((value) => response = true)
        .catchError((error) => response = false);
    return response;
  }

  Match _makeMatch(DocumentSnapshot<MatchFirebaseObject> snapshot) {
    var matchFirebase = snapshot.data();
    return Match(
        uid: snapshot.id,
        matchIdentifier: matchFirebase?.matchIdentifier ?? 0,
        contenderH: matchFirebase?.contenderH ?? "",
        contenderA: matchFirebase?.contenderA ?? "",
        scoreContenderH: matchFirebase?.scoreContenderH ?? 0,
        scoreContenderA: matchFirebase?.scoreContenderA ?? 0,
        isFinished: matchFirebase?.isFinished ?? false,
        cameFrom: matchFirebase?.cameFrom ?? []);
  }

  Future<Match?> _makeMatchFromQuerySnapshot(List<QueryDocumentSnapshot<MatchFirebaseObject>> querySnapshot, int cameFrom) async {
    var futureMatchId = querySnapshot.firstWhereOrNull((match) => match.data().cameFrom.contains(cameFrom))?.id;
    if (futureMatchId != null) {
      var match = await getMatchById(futureMatchId);
      return match;
    } else {
      return null;
    }
  }
}
