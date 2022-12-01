import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_service.dart';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/models/match/match_firebase_object.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';
import 'package:mundialito/app/models/user/current_mundialito.dart';

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
    _setCurrentMundialito(mundialito.joinCode);
    return mundialito;
  }

  @override
  Future<Match> getMatchById(String matchId) async {
    var snapshot = await _firebaseFirestoreMatchRef.doc(matchId).get();
    Match match = _makeMatch(snapshot);
    return match;
  }

  @override
  Future<bool> cancelMundialito(String mundialitoId) async {
    var snapshot = await _firebaseFirestoreMundialitoRef.doc(mundialitoId).get();
    Mundialito mundialito = await _makeMundialito(snapshot);
    bool matchResponse = await _deleteMatches(mundialito.matches);
    bool mundialitoResponse = await _deleteMundialito(mundialitoId);
    return mundialitoResponse && matchResponse;
  }

  Future<bool> _deleteMatches(List<Match> matches) async {
    late bool matchResponse;
    for (Match match in matches) {
      await _firebaseFirestoreMatchRef
          .doc(match.uid)
          .delete()
          .then((value) => matchResponse = true)
          .catchError((error) => matchResponse = false);
    }

    return matchResponse;
  }

  Future<bool> _deleteMundialito(String mundialitoId) async {
    late bool mundialitoResponse;
    await _firebaseFirestoreMundialitoRef
        .doc(mundialitoId)
        .delete()
        .then((value) => mundialitoResponse = true)
        .catchError((error) => mundialitoResponse = false);
    return mundialitoResponse;
  }

  @override
  Future<bool> finishMundialito(String mundialitoId) async {
    late bool response;
    await _firebaseFirestoreMundialitoRef
        .doc(mundialitoId)
        .update({'isCompleted': true})
        .then((value) => response = true)
        .catchError((error) => response = false);
    return response;
  }

  Future<Mundialito> _makeMundialito(DocumentSnapshot<MundialitoFirebaseObject> snapshot) async {
    var mundialitoFirebase = snapshot.data();
    var fromFirebaseMatches = mundialitoFirebase?.matches ?? [];
    var matches = <Match>[];
    var contenders = <Contender>[];
    for (String firebaseMatch in fromFirebaseMatches) {
      var match = await getMatchById(firebaseMatch);
      matches.add(match);
    }
    for (dynamic firebaseContender in mundialitoFirebase?.contenders ?? []) {
      var contender = _makeContender(firebaseContender);
      contenders.add(contender);
    }
    return Mundialito(
        uid: snapshot.id,
        name: mundialitoFirebase?.name ?? "",
        startDate: mundialitoFirebase?.startDate ?? Timestamp.now(),
        endDate: mundialitoFirebase?.endDate ?? Timestamp.now(),
        contenders: contenders,
        owner: mundialitoFirebase?.owner ?? "",
        matches: matches,
        isCompleted: mundialitoFirebase?.isCompleted ?? false,
        joinCode: mundialitoFirebase?.joinCode ?? "",
        joinedUsers: []
    );
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

  Contender _makeContender(dynamic contender) {
    return Contender(name: contender);
  }

  void _setCurrentMundialito(String joinCode) {
    CurrentMundialito(joinCode: joinCode);
  }

}
