import 'dart:math';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';

class MatchFactory {

  List<Match> shuffledFromContenderList(List<Contender> contenders) {
    List<Match> matches = _getShuffledList(contenders);
    return matches;
  }

  List<Match> _getShuffledList(List<Contender> contenders) {
    List<Match> matches = [];

    if (contenders.length % 2 > 0) {
      return [];
    }

    while (contenders.isNotEmpty) {
      var contenderH = _getRandomContender(contenders);
      contenders.remove(contenderH);
      var contenderA = _getRandomContender(contenders);
      contenders.remove(contenderA);
      Match toCreateMatch = Match(contenderH, contenderA, 0, 0, false);
      matches.add(toCreateMatch);
    }

    return matches.toSet().toList();
  }

  Contender _getRandomContender(List<Contender> contenders) {
    var randomIndex = Random().nextInt(contenders.length);
    return contenders[randomIndex];
  }
}
