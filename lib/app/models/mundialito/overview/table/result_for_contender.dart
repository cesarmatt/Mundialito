import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';

class ResultForContender {
  ResultForContender(
      {required this.contender, required this.wins, required this.losses});

  final Contender contender;
  final int wins;
  final int losses;

  static List<ResultForContender> makeResultsList(List<Match> matches,
      List<Contender> contenders) {
    // For each contender we must check
    // Which matches he played and when he won or lost
    var resultForContenderList = <ResultForContender>[];
    for (Contender contender in contenders) {
      var wins = 0;
      var losses = 0;
      for (Match match in matches) {
        if (match.contenderH == contender.name) {
          if (match.scoreContenderH > match.scoreContenderA) {
            wins++;
          } else if (match.scoreContenderH > match.scoreContenderA) {
            losses++;
          }
        } else if (match.contenderA == contender.name) {
          if (match.scoreContenderH > match.scoreContenderA) {
            wins++;
          } else if (match.scoreContenderH > match.scoreContenderA) {
            losses++;
          }
        }
      }
      ResultForContender result = ResultForContender(
          contender: contender,
          wins: wins,
          losses: losses
      );
      resultForContenderList.add(result);
    }
    return resultForContenderList;
  }
}
