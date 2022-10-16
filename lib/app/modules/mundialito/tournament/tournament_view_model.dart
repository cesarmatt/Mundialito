import 'package:mobx/mobx.dart';

part 'tournament_view_model.g.dart';

class TournamentViewModel = _TournamentViewModelBase with _$TournamentViewModel;

abstract class _TournamentViewModelBase with Store {
  @observable
  int currentIndex = 1;
}