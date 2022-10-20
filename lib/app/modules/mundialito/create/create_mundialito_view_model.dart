import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/create/create_mundialito_repository.dart';
import 'package:mundialito/app/models/match/match_factory.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';
import 'package:mundialito/app/models/user/current_user.dart';
import 'package:mundialito/app/utils/date_time_utils.dart';
import '../../../models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';

import '../../../models/match/match_firebase_object.dart';

part 'create_mundialito_view_model.g.dart';

class CreateMundialitoViewModel = _CreateMundialitoViewModelBase
    with _$CreateMundialitoViewModel;

abstract class _CreateMundialitoViewModelBase with Store {
  final mundialitoNameTextEditingController = TextEditingController();
  final mundialitoStartDateTextEditingController = TextEditingController();
  final mundialitoEndDateTextEditingController = TextEditingController();
  final contenderNameTextEditingController = TextEditingController();
  final _createMundialitoRepository = CreateMundialitoRepository();

  @observable
  bool hasEndDate = false;

  @observable
  List<bool> mundialitoEndDateToggle = [false, false];

  @observable
  ObservableList<String> contendersList = ObservableList<String>.of([]);

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
    var contender = contenderNameTextEditingController.text;
    contendersList.add(contender);
    contenderNameTextEditingController.text = "";
  }

  @action
  void onDeleteContenderClicked(String? toDeleteContender) {
    contendersList.remove(toDeleteContender);
  }

  @action
  void onStartDateSelected(DateTime? selectedDate) {
    if (selectedDate != null) {
      startDate = selectedDate;
      mundialitoStartDateTextEditingController.text =
          DateTimeUtils.formatDDmmYY(selectedDate);
    }
  }

  @action
  void onEndDateSelected(DateTime? selectedDate) {
    if (selectedDate != null) {
      endDate = selectedDate;
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

  void onStartMundialitoClicked() async {
    var mundialito = makeMundialitoFromInput();
    if (mundialito != null) {
      var response =
          await _createMundialitoRepository.createMundialito(mundialito);
      if (response) {
        Modular.to.popAndPushNamed('/tournament/');
      } else {
        error = true;
      }
    }
  }

  MundialitoFirebaseObject? makeMundialitoFromInput() {
    String owner = CurrentUser.getCurrentUser().uid;
    MatchFactory matchFactory = MatchFactory();
    Timestamp mundialitoStartDate =
        Timestamp.fromDate(startDate ?? DateTime.now());
    Timestamp mundialitoEndDate = Timestamp.fromDate(endDate ?? DateTime.now());
    var rawContendersList = <String>[];
    rawContendersList.addAll(contendersList);
    List<MatchFirebaseObject> matches =
        matchFactory.shuffledFromContenderList(rawContendersList);
    if (matches.isNotEmpty) {
      return MundialitoFirebaseObject(
          name: mundialitoNameTextEditingController.text,
          startDate: mundialitoStartDate,
          endDate: mundialitoEndDate,
          contenders: contendersList,
          owner: owner,
          matches: matches,
          isCompleted: false);
    } else {
      return null;
    }
  }
}
