import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/home/invitedmundialito/invited_mundialito_use_case.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

part 'invited_mundialitos_view_model.g.dart';

class InvitedMundialitosViewModel = _InvitedMundialitosViewModelBase
    with _$InvitedMundialitosViewModel;

abstract class _InvitedMundialitosViewModelBase with Store {
  final InvitedMundialitoUseCase _useCase = InvitedMundialitoUseCase();

  @observable
  bool isLoading = true;

  @observable
  bool isError = false;

  @observable
  List<MundialitoFirebaseObject> mundialitos = [];

  @action
  Future<void> getMundialitos() async {
    isLoading = true;
    var response = await _useCase.getInvitedMundialitos();
    if (response.isNotEmpty) {
      mundialitos = response;
      isLoading = false;
    } else {
      isLoading = false;
      isError = true;
    }
  }
}