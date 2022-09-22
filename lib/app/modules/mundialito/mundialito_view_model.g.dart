// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mundialito_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MundialitoViewModel on _MundialitoViewModelBase, Store {
  late final _$hasEndDateAtom =
      Atom(name: '_MundialitoViewModelBase.hasEndDate', context: context);

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
      name: '_MundialitoViewModelBase.mundialitoEndDateToggle',
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

  late final _$contendersListAtom =
      Atom(name: '_MundialitoViewModelBase.contendersList', context: context);

  @override
  List<Contender> get contendersList {
    _$contendersListAtom.reportRead();
    return super.contendersList;
  }

  @override
  set contendersList(List<Contender> value) {
    _$contendersListAtom.reportWrite(value, super.contendersList, () {
      super.contendersList = value;
    });
  }

  late final _$_MundialitoViewModelBaseActionController =
      ActionController(name: '_MundialitoViewModelBase', context: context);

  @override
  void onMundialitoEndDateDefined(bool mundialitoHasEndDate) {
    final _$actionInfo = _$_MundialitoViewModelBaseActionController.startAction(
        name: '_MundialitoViewModelBase.onMundialitoEndDateDefined');
    try {
      return super.onMundialitoEndDateDefined(mundialitoHasEndDate);
    } finally {
      _$_MundialitoViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onAddContenderClicked() {
    final _$actionInfo = _$_MundialitoViewModelBaseActionController.startAction(
        name: '_MundialitoViewModelBase.onAddContenderClicked');
    try {
      return super.onAddContenderClicked();
    } finally {
      _$_MundialitoViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDeleteContenderClicked(Contender? toDeleteContender) {
    final _$actionInfo = _$_MundialitoViewModelBaseActionController.startAction(
        name: '_MundialitoViewModelBase.onDeleteContenderClicked');
    try {
      return super.onDeleteContenderClicked(toDeleteContender);
    } finally {
      _$_MundialitoViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasEndDate: ${hasEndDate},
mundialitoEndDateToggle: ${mundialitoEndDateToggle},
contendersList: ${contendersList}
    ''';
  }
}
