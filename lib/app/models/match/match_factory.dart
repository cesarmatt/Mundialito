import 'dart:math';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/models/match/match_firebase_object.dart';

class MatchFactory {
  List<MatchFirebaseObject> shuffledFromContenderList(List<String> contenders) {
    List<MatchFirebaseObject> matches = _getShuffledList(contenders);
    return matches;
  }

  List<MatchFirebaseObject> _getShuffledList(List<String> contenders) {
    List<MatchFirebaseObject> matches = [];

    if (contenders.length % 2 > 0) {
      return [];
    }

    while (contenders.isNotEmpty) {
      var contenderH = _getRandomContender(contenders);
      contenders.remove(contenderH);
      var contenderA = _getRandomContender(contenders);
      contenders.remove(contenderA);
      MatchFirebaseObject toCreateMatch = _makeToCreateMatchObject(
          matches.length + 1,
          contenderH,
          contenderA,
          0,
          0,
          [0, 0]
      );
      matches.add(toCreateMatch);
    }

    var numberOfFutureMatches = matches.length / 2;

    if (numberOfFutureMatches == 1) {
      MatchFirebaseObject futureMatch = _makeToCreateMatchObject(
          matches.length + 1,
          'Winner #1',
          'Winner #2',
          0,
          0,
          [1, 2]
      );
      matches.add(futureMatch);
    } else {
      for (var index = 0, matchNumber = 1; index <= numberOfFutureMatches; index++) {
        var winner1 = matchNumber;
        var winner2 = matchNumber + 1;
        List<int> cameFrom = [winner1, winner2];
        MatchFirebaseObject futureMatch = _makeToCreateMatchObject(
            matches.length + 1,
            'Winner #$winner1',
            'Winner #$winner2',
            0,
            0,
            cameFrom
        );
        matchNumber = matchNumber + 2;
        matches.add(futureMatch);
      }
    }

    return matches.toSet().toList();
  }

  String _getRandomContender(List<String> contenders) {
    var randomIndex = Random().nextInt(contenders.length);
    return contenders[randomIndex];
  }

  MatchFirebaseObject _makeToCreateMatchObject(
      int matchIdentifier,
      String contenderH,
      String contenderA,
      int scoreContenderH,
      int scoreContenderA,
      List<int> cameFrom) {
    return MatchFirebaseObject(
        matchIdentifier: matchIdentifier,
        contenderH: contenderH,
        contenderA: contenderA,
        scoreContenderH: scoreContenderH,
        scoreContenderA: scoreContenderA,
        isFinished: false,
        cameFrom: cameFrom);
  }
}
