// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TournamentViewModel on _TournamentViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_TournamentViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_TournamentViewModelBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$currentIndexAtom =
      Atom(name: '_TournamentViewModelBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$tournamentAtom =
      Atom(name: '_TournamentViewModelBase.tournament', context: context);

  @override
  TournamentViewObject? get tournament {
    _$tournamentAtom.reportRead();
    return super.tournament;
  }

  @override
  set tournament(TournamentViewObject? value) {
    _$tournamentAtom.reportWrite(value, super.tournament, () {
      super.tournament = value;
    });
  }

  late final _$getTournamentViewObjectAsyncAction = AsyncAction(
      '_TournamentViewModelBase.getTournamentViewObject',
      context: context);

  @override
  Future<void> getTournamentViewObject(String mundialitoId) {
    return _$getTournamentViewObjectAsyncAction
        .run(() => super.getTournamentViewObject(mundialitoId));
  }

  late final _$finishMundialitoAsyncAction = AsyncAction(
      '_TournamentViewModelBase.finishMundialito',
      context: context);

  @override
  Future<void> finishMundialito(String mundialitoId) {
    return _$finishMundialitoAsyncAction
        .run(() => super.finishMundialito(mundialitoId));
  }

  late final _$cancelMundialitoAsyncAction = AsyncAction(
      '_TournamentViewModelBase.cancelMundialito',
      context: context);

  @override
  Future<void> cancelMundialito(String mundialitoId) {
    return _$cancelMundialitoAsyncAction
        .run(() => super.cancelMundialito(mundialitoId));
  }

  late final _$_TournamentViewModelBaseActionController =
      ActionController(name: '_TournamentViewModelBase', context: context);

  @override
  void setInitialRoute(String mundialitoId) {
    final _$actionInfo = _$_TournamentViewModelBaseActionController.startAction(
        name: '_TournamentViewModelBase.setInitialRoute');
    try {
      return super.setInitialRoute(mundialitoId);
    } finally {
      _$_TournamentViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
currentIndex: ${currentIndex},
tournament: ${tournament}
    ''';
  }
}
