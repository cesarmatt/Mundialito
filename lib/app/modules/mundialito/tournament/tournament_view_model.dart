import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/tournament/tournament_use_case.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/tournament/tournament_view_object.dart';

part 'tournament_view_model.g.dart';

class TournamentViewModel = _TournamentViewModelBase with _$TournamentViewModel;

abstract class _TournamentViewModelBase with Store {

  final TournamentUseCase _useCase = TournamentUseCase();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  int currentIndex = 1;

  @observable
  TournamentViewObject? tournament;

  @action
  Future<void> finishMundialito(String mundialitoId) async {
    isLoading = true;
    var response = await _useCase.finishMundialito(mundialitoId);
    if (response) {
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }


  @action
  Future<void> cancelMundialito(String mundialitoId) async {
    isLoading = true;
    var response = await _useCase.cancelMundialito(mundialitoId);
    if (response) {
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }

  @action
  void setInitialRoute(String mundialitoId) {
    currentIndex = 1;
    Modular.to.pushNamed('/tournament/overview/$mundialitoId');
  }
}