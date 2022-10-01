import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mundialito/app/models/match/match_factory.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/utils/date_time_utils.dart';
import '../../../models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';

part 'create_mundialito_view_model.g.dart';

class CreateMundialitoViewModel = _CreateMundialitoViewModelBase
    with _$CreateMundialitoViewModel;

abstract class _CreateMundialitoViewModelBase with Store {
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

  @observable
  DateTime? startDate;

  @observable
  DateTime? endDate;

  @observable
  bool error = false;

  @action
  void onMundialitoEndDateDefined(bool mundialitoHasEndDate) {
    hasEndDate = mundialitoHasEndDate;
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

  @action
  void onStartDateSelected(DateTime? selectedDate) {
    if (selectedDate != null) {
      mundialitoStartDateTextEditingController.text =
          DateTimeUtils.formatDDmmYY(selectedDate);
    }
  }

  @action
  void onEndDateSelected(DateTime? selectedDate) {
    if (selectedDate != null) {
      mundialitoEndDateTextEditingController.text =
          DateTimeUtils.formatDDmmYY(selectedDate);
    }
  }

  bool mundialitoHasEndDate() {
    if (mundialitoEndDateToggle[0] == true) {
      mundialitoEndDateTextEditingController.text = "";
      return true;
    } else {
      return false;
    }
  }

  void onStartMundialitoClicked() {
    var mundialito = makeMundialitoFromInput();
    if (mundialito != null) {
      Modular.to.popAndPushNamed('/tournament/');
    } else {
      error = true;
    }
  }

  Mundialito? makeMundialitoFromInput() {
    Contender owner = Contender("owner");
    MatchFactory matchFactory = MatchFactory();
    List<Match> matches = matchFactory.shuffledFromContenderList(contendersList);
    if (matches.isNotEmpty) {
      return Mundialito(
          mundialitoNameTextEditingController.text,
          mundialitoStartDateTextEditingController.text,
          mundialitoEndDateTextEditingController.text,
          contendersList,
          owner,
          matches
      );
    } else {
      return null;
    }
  }
}
