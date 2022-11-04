import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/matches/matches_use_case.dart';
import 'package:mundialito/app/models/mundialito/matches/mundialito_matches_view_object.dart';

part 'matches_view_model.g.dart';

class MatchesViewModel = _MatchesViewModelBase with _$MatchesViewModel;

abstract class _MatchesViewModelBase with Store {
  final MatchesUseCase _useCase = MatchesUseCase();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  MundialitoMatchesViewObject? mundialitoMatches;

  @action
  Future<void> getMundialitoMatches(String mundialitoId) async {
    isLoading = true;
    var response = await _useCase.getMundialitoMatchesViewObject(mundialitoId);
    if (response != null) {
      mundialitoMatches = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }
}