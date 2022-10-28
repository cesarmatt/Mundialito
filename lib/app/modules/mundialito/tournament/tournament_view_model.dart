import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';

part 'tournament_view_model.g.dart';

class TournamentViewModel = _TournamentViewModelBase with _$TournamentViewModel;

abstract class _TournamentViewModelBase with Store {
  final MundialitoDetailRepository _repository = MundialitoDetailRepository();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  int currentIndex = 1;

  @observable
  Mundialito? mundialito;

}