import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/home/mymundialito/my_mundialito_use_case.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

part 'my_mundialitos_view_model.g.dart';

class MyMundialitosViewModel = _MyMundialitosViewModelBase
    with _$MyMundialitosViewModel;

abstract class _MyMundialitosViewModelBase with Store {
  final MyMundialitoUseCase _useCase = MyMundialitoUseCase();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  List<MundialitoFirebaseObject> mundialitos = [];

  @action
  Future<void> getMundialitos() async {
    isLoading = true;
    var response = await _useCase.getMyMundialitos();
    if (response.isNotEmpty) {
      mundialitos = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }

  bool isSelectedMundialitoFinished(String mundialitoId) {
    MundialitoFirebaseObject selectedMundialito =
        mundialitos.firstWhere((mundialito) => mundialito.uid == mundialitoId);
    return selectedMundialito.isCompleted;
  }
}
