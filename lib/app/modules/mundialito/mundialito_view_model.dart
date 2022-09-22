import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mundialito/app/models/mundialito.dart';
import '../../models/contender/contender.dart';
part 'mundialito_view_model.g.dart';

class MundialitoViewModel = _MundialitoViewModelBase with _$MundialitoViewModel;

abstract class _MundialitoViewModelBase with Store {

  final mundialitoNameTextEditingController = TextEditingController();
  final mundialitoStartDateTextEditingController = TextEditingController();
  final mundialitoEndDateTextEditingController = TextEditingController();
  final contenderNameTextEditingController = TextEditingController();

  @observable
  bool hasEndDate = false;

  @observable
  List<bool> mundialitoEndDateToggle = [false, false];

  @observable
  List<Contender> contendersList = [];


  @action
  void onMundialitoEndDateDefined(bool mundialitoHasEndDate) {
    hasEndDate = mundialitoHasEndDate;
  }

  bool mundialitoHasEndDate() {
    if (mundialitoEndDateToggle[0] == true) {
      return true;
    } else {
      return false;
    }
  }

  @action
  void onAddContenderClicked() {
    var contenderName = contenderNameTextEditingController.text;
    var contender = Contender(contenderName);
    contendersList.add(contender);
    contenderNameTextEditingController.text = "";
  }

  @action
  void onDeleteContenderClicked(Contender? toDeleteContender) {
    contendersList.remove(toDeleteContender);
  }

  void onStartMundialitoClicked() {
    var mundialito = makeMundialitoFromInput();
    print(mundialito.name);
    print(mundialito.startDate);
    print(mundialito.endDate);
    print(mundialito.contenders);
  }

  Mundialito makeMundialitoFromInput() {
    return Mundialito(
        mundialitoNameTextEditingController.text,
        mundialitoStartDateTextEditingController.text,
        mundialitoEndDateTextEditingController.text,
        contendersList
    );
  }
}