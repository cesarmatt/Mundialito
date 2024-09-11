import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/results/results_use_case.dart';
import 'package:mundialito/app/models/mundialito/results/mundialito_results_view_object.dart';

part 'results_view_model.g.dart';

class ResultsViewModel = _ResultsViewModelBase with _$ResultsViewModel;

abstract class _ResultsViewModelBase with Store {
  final ResultsUseCase _useCase = ResultsUseCase();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  MundialitoResultsViewObject? mundialitoFinishedMatches;

  @action
  Future<void> getMundialitoFinishedMatches(String mundialitoId) async {
    isLoading = true;
    var response = await _useCase.getMundialitoResultsViewObject(mundialitoId);
    if (response != null) {
      mundialitoFinishedMatches = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }
}