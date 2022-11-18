import 'package:collection/collection.dart';
import 'package:mobx/mobx.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/overview/overview_use_case.dart';
import 'package:mundialito/app/models/mundialito/overview/mundialito_overview_view_object.dart';
import 'package:mundialito/app/models/mundialito/overview/table/result_for_contender.dart';

part 'overview_view_model.g.dart';

class OverviewViewModel = _OverviewViewModelBase with _$OverviewViewModel;

abstract class _OverviewViewModelBase with Store {
  final OverviewUseCase _useCase = OverviewUseCase();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  MundialitoOverviewViewObject? mundialitoOverview;

  @observable
  List<ResultForContender>? results;

  @observable
  Match? currentMatch;

  @action
  Future<void> getMundialitoOverview(String mundialitoId) async {
    isLoading = true;
    var response = await _useCase.getMundialitoOverviewViewObject(mundialitoId);
    if (response != null) {
      mundialitoOverview = response;
      results = ResultForContender.makeResultsList(response.matches, response.contenders);
      _setCurrentMatch(mundialitoOverview?.matches ?? []);
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }

  @action
  Future<void> _setCurrentMatch(List<Match> matches) async {
    currentMatch = matches.firstWhereOrNull((match) => match.isFinished != true);
  }
}