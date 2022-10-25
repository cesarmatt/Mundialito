import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/overview/overview_use_case.dart';
import 'package:mundialito/app/models/mundialito/overview/mundialito_overview_view_object.dart';

part 'overview_view_model.g.dart';

class OverviewViewModel = _OverviewViewModelBase with _$OverviewViewModel;

abstract class _OverviewViewModelBase with Store {
  OverviewUseCase _useCase = OverviewUseCase();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  MundialitoOverviewViewObject? mundialitoOverview;

  @action
  Future<void> getMundialitoOverview(String mundialitoId) async {
    isLoading = true;
    var response = await _useCase.getMundialitoOverviewViewObject(mundialitoId);
    if (response != null) {
      mundialitoOverview = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }
}