// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_mundialito_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateMundialitoViewModel on _CreateMundialitoViewModelBase, Store {
  late final _$hasEndDateAtom =
      Atom(name: '_CreateMundialitoViewModelBase.hasEndDate', context: context);

  @override
  bool get hasEndDate {
    _$hasEndDateAtom.reportRead();
    return super.hasEndDate;
  }

  @override
  set hasEndDate(bool value) {
    _$hasEndDateAtom.reportWrite(value, super.hasEndDate, () {
      super.hasEndDate = value;
    });
  }

  late final _$mundialitoEndDateToggleAtom = Atom(
      name: '_CreateMundialitoViewModelBase.mundialitoEndDateToggle',
      context: context);

  @override
  List<bool> get mundialitoEndDateToggle {
    _$mundialitoEndDateToggleAtom.reportRead();
    return super.mundialitoEndDateToggle;
  }

  @override
  set mundialitoEndDateToggle(List<bool> value) {
    _$mundialitoEndDateToggleAtom
        .reportWrite(value, super.mundialitoEndDateToggle, () {
      super.mundialitoEndDateToggle = value;
    });
  }

  late final _$contendersListAtom = Atom(
      name: '_CreateMundialitoViewModelBase.contendersList', context: context);

  @override
  ObservableList<String> get contendersList {
    _$contendersListAtom.reportRead();
    return super.contendersList;
  }

  @override
  set contendersList(ObservableList<String> value) {
    _$contendersListAtom.reportWrite(value, super.contendersList, () {
      super.contendersList = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_CreateMundialitoViewModelBase.error', context: context);

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$createdMundialitoIdAtom = Atom(
      name: '_CreateMundialitoViewModelBase.createdMundialitoId',
      context: context);

  @override
  String? get createdMundialitoId {
    _$createdMundialitoIdAtom.reportRead();
    return super.createdMundialitoId;
  }

  @override
  set createdMundialitoId(String? value) {
    _$createdMundialitoIdAtom.reportWrite(value, super.createdMundialitoId, () {
      super.createdMundialitoId = value;
    });
  }

  late final _$_CreateMundialitoViewModelBaseActionController =
      ActionController(
          name: '_CreateMundialitoViewModelBase', context: context);

  @override
  void onMundialitoEndDateDefined(bool mundialitoHasEndDate) {
    final _$actionInfo =
        _$_CreateMundialitoViewModelBaseActionController.startAction(
            name: '_CreateMundialitoViewModelBase.onMundialitoEndDateDefined');
    try {
      return super.onMundialitoEndDateDefined(mundialitoHasEndDate);
    } finally {
      _$_CreateMundialitoViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onAddContenderClicked() {
    final _$actionInfo =
        _$_CreateMundialitoViewModelBaseActionController.startAction(
            name: '_CreateMundialitoViewModelBase.onAddContenderClicked');
    try {
      return super.onAddContenderClicked();
    } finally {
      _$_CreateMundialitoViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDeleteContenderClicked(String? toDeleteContender) {
    final _$actionInfo =
        _$_CreateMundialitoViewModelBaseActionController.startAction(
            name: '_CreateMundialitoViewModelBase.onDeleteContenderClicked');
    try {
      return super.onDeleteContenderClicked(toDeleteContender);
    } finally {
      _$_CreateMundialitoViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasEndDate: ${hasEndDate},
mundialitoEndDateToggle: ${mundialitoEndDateToggle},
contendersList: ${contendersList},
error: ${error},
createdMundialitoId: ${createdMundialitoId}
    ''';
  }
}
