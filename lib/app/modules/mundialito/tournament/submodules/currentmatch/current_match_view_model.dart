import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/currentmatch/current_match_repository.dart';
import 'package:mundialito/app/models/match/match.dart';

part 'current_match_view_model.g.dart';

class CurrentMatchViewModel = _CurrentMatchViewModelBase with _$CurrentMatchViewModel;

abstract class _CurrentMatchViewModelBase with Store {
  final CurrentMatchRepository _repository = CurrentMatchRepository();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  bool isDraw = false;

  @observable
  Match? match;

  @observable
  int homeScore = 0;

  @observable
  int awayScore = 0;

  @action
  Future<void> getMatch(String matchId) async {
    isLoading = true;
    var response = await _repository.getMatchById(matchId);
    if (response != null) {
      match = response;
      homeScore = match?.scoreContenderH ?? 0;
      awayScore = match?.scoreContenderA ?? 0;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }

  @action
  Future<void> onHomeContenderScoreUpdated(int score) async {
    homeScore = homeScore + score;
    match?.scoreContenderH = match?.scoreContenderH ?? 0 + score;
    _repository.updateHomeScore(match?.uid ?? "", homeScore);
  }

  @action
  Future<void> onAwayContenderScoreUpdated(int score) async {
    awayScore = awayScore + score;
    match?.scoreContenderA = match?.scoreContenderA ?? 0 + score;
    _repository.updateAwayScore(match?.uid ?? "", awayScore);
  }

  @action
  Future<void> onCancelMatchPressed() async {
    _repository.cancelMatch(match?.uid ?? "");
  }

  @action
  Future<void> onFinishMatchPressed() async {
    if (matchEndedDraw()) {
      isDraw = true;
    } else {
      isDraw = false;
      _repository.finishMatch(match?.uid ?? "");
    }
  }

  bool matchEndedDraw() {
    return homeScore == awayScore;
  }
}