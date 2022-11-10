import 'package:mundialito/app/firebase/onboarding/mundialito/detail/currentmatch/current_match_remote_data_source.dart';
import 'package:mundialito/app/models/match/match.dart';

class CurrentMatchRepository {
  final CurrentMatchRemoteDataSource _remoteDataSource = CurrentMatchRemoteDataSource();

  Future<Match?> getMatchById(String matchId) async {
    var response = await _remoteDataSource.getMatchById(matchId);
    return response;
  }

  Future<bool> updateNextStageForWinner(int currentMatchIdentifier, String contender) async {
    var response = await _remoteDataSource.updateNextStageForWinner(currentMatchIdentifier, contender);
    return response;
  }

  Future<bool> cancelMatch(String matchId) async {
    var response = await _remoteDataSource.cancelMatch(matchId);
    return response;
  }

  Future<bool> finishMatch(String matchId) async {
    var response = await _remoteDataSource.finishMatch(matchId);
    return response;
  }

  Future<bool> updateAwayScore(String matchId, int score) async {
    var response = await _remoteDataSource.updateAwayScore(matchId, score);
    return response;
  }

  Future<bool> updateHomeScore(String matchId, int score) async {
    var response = await _remoteDataSource.updateHomeScore(matchId, score);
    return response;
  }
}