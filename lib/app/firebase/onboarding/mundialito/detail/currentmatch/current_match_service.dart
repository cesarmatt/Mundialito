import 'package:mundialito/app/models/match/match.dart';

abstract class CurrentMatchService {
  Future<Match> getMatchById(String matchId);
  Future<bool> finishMatch(String matchId);
  Future<bool> cancelMatch(String matchId);
  Future<bool> updateHomeScore(String matchId, int score);
  Future<bool> updateAwayScore(String matchId, int score);
  Future<bool> updateNextStageForWinner(int currentMatchIdentifier, String contender);
}