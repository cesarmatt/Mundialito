import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/endedresult/ended_result_use_case.dart';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/mundialito/endedresult/ended_result_view_object.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/overview/table/result_for_contender.dart';

part 'ended_result_view_model.g.dart';

class EndedResultViewModel = _EndedResultViewModelBase with _$EndedResultViewModel;

abstract class _EndedResultViewModelBase with Store {
  final EndedResultUseCase _useCase = EndedResultUseCase();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  EndedResultViewObject? endedResults;

  @observable
  List<Contender>? podium;

  @action
  Future<void> getMundialito(String mundialitoId) async {
    isLoading = true;
    var response = await _useCase.getEndedResultViewObject(mundialitoId);
    if (response != null) {
      endedResults = response;
      podium = _getContendersForPodium(endedResults?.podium ?? []);
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }

  List<Contender> _getContendersForPodium(List<ResultForContender> results) {
    List<Contender> podium = [];
    podium.add(results[0].contender);
    podium.add(results[1].contender);
    podium.add(results[2].contender);
    return podium;
  }
}