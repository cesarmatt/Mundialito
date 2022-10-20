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
      MatchFirebaseObject toCreateMatch = MatchFirebaseObject(
          contenderH: contenderH,
          contenderA: contenderA,
          scoreContenderH: 0,
          scoreContenderA: 0,
          isFinished: false
      );
      matches.add(toCreateMatch);
    }

    return matches.toSet().toList();
  }

  String _getRandomContender(List<String> contenders) {
    var randomIndex = Random().nextInt(contenders.length);
    return contenders[randomIndex];
  }
}
