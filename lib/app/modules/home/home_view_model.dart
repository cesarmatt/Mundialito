import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/home/home_repository.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/mundialito_home_view_object.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {

  final HomeRepository _homeRepository = HomeRepository();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  List<MundialitoHomeViewObject> mundialitos = [];

  @action
  Future<void> getMundialitos() async {
    isLoading = true;
    var response = await _homeRepository.getMundialitos();
    if (response.isNotEmpty) {
      mundialitos = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }
}