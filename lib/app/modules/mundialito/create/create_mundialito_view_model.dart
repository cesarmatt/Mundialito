import 'dart:math';

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
  final contenderNameTextEditingController = TextEditingController();
  final _createMundialitoRepository = CreateMundialitoRepository();

  @observable
  bool hasEndDate = false;

  @observable
  List<bool> mundialitoEndDateToggle = [false, false];

  @observable
  ObservableList<String> contendersList = ObservableList<String>.of([]);

  @observable
  bool error = false;

  @observable
  String? createdMundialitoId;

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

  Future<void> onStartMundialitoClicked() async {
    var mundialito = makeMundialitoFromInput();
    if (mundialito != null) {
      var response = await _createMundialitoRepository.createMundialito(mundialito);
      if (response.isNotEmpty) {
        createdMundialitoId = response;
      } else {
        error = true;
      }
    }
  }

  MundialitoFirebaseObject? makeMundialitoFromInput() {
    String owner = CurrentUser.getCurrentUser().uid;
    MatchFactory matchFactory = MatchFactory();
    var rawContendersList = <String>[];
    rawContendersList.addAll(contendersList);
    List<MatchFirebaseObject> matches =
        matchFactory.shuffledFromContenderList(rawContendersList);
    if (matches.isNotEmpty) {
      return MundialitoFirebaseObject(
          name: mundialitoNameTextEditingController.text,
          startDate: Timestamp.fromDate(DateTime.now()),
          contenders: contendersList,
          owner: owner,
          matches: matches,
          isCompleted: false,
          joinCode: _generateJoinCode(),
          joinedUsers: []);
    } else {
      return null;
    }
  }

  String _generateJoinCode() {
    var rng = Random();
    String code = "";
    for (var i = 0; i < 5; i++) {
      var nextNumber = rng.nextInt(9);
      code = code + nextNumber.toString();
    }
    return code;
  }
}
