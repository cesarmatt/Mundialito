// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_match_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentMatchViewModel on _CurrentMatchViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CurrentMatchViewModelBase.isLoading', context: context);

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
      Atom(name: '_CurrentMatchViewModelBase.isError', context: context);

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

  late final _$isDrawAtom =
      Atom(name: '_CurrentMatchViewModelBase.isDraw', context: context);

  @override
  bool get isDraw {
    _$isDrawAtom.reportRead();
    return super.isDraw;
  }

  @override
  set isDraw(bool value) {
    _$isDrawAtom.reportWrite(value, super.isDraw, () {
      super.isDraw = value;
    });
  }

  late final _$matchAtom =
      Atom(name: '_CurrentMatchViewModelBase.match', context: context);

  @override
  Match? get match {
    _$matchAtom.reportRead();
    return super.match;
  }

  @override
  set match(Match? value) {
    _$matchAtom.reportWrite(value, super.match, () {
      super.match = value;
    });
  }

  late final _$homeScoreAtom =
      Atom(name: '_CurrentMatchViewModelBase.homeScore', context: context);

  @override
  int get homeScore {
    _$homeScoreAtom.reportRead();
    return super.homeScore;
  }

  @override
  set homeScore(int value) {
    _$homeScoreAtom.reportWrite(value, super.homeScore, () {
      super.homeScore = value;
    });
  }

  late final _$awayScoreAtom =
      Atom(name: '_CurrentMatchViewModelBase.awayScore', context: context);

  @override
  int get awayScore {
    _$awayScoreAtom.reportRead();
    return super.awayScore;
  }

  @override
  set awayScore(int value) {
    _$awayScoreAtom.reportWrite(value, super.awayScore, () {
      super.awayScore = value;
    });
  }

  late final _$getMatchAsyncAction =
      AsyncAction('_CurrentMatchViewModelBase.getMatch', context: context);

  @override
  Future<void> getMatch(String matchId) {
    return _$getMatchAsyncAction.run(() => super.getMatch(matchId));
  }

  late final _$onHomeContenderScoreUpdatedAsyncAction = AsyncAction(
      '_CurrentMatchViewModelBase.onHomeContenderScoreUpdated',
      context: context);

  @override
  Future<void> onHomeContenderScoreUpdated(int score) {
    return _$onHomeContenderScoreUpdatedAsyncAction
        .run(() => super.onHomeContenderScoreUpdated(score));
  }

  late final _$onAwayContenderScoreUpdatedAsyncAction = AsyncAction(
      '_CurrentMatchViewModelBase.onAwayContenderScoreUpdated',
      context: context);

  @override
  Future<void> onAwayContenderScoreUpdated(int score) {
    return _$onAwayContenderScoreUpdatedAsyncAction
        .run(() => super.onAwayContenderScoreUpdated(score));
  }

  late final _$onCancelMatchPressedAsyncAction = AsyncAction(
      '_CurrentMatchViewModelBase.onCancelMatchPressed',
      context: context);

  @override
  Future<void> onCancelMatchPressed() {
    return _$onCancelMatchPressedAsyncAction
        .run(() => super.onCancelMatchPressed());
  }

  late final _$onFinishMatchPressedAsyncAction = AsyncAction(
      '_CurrentMatchViewModelBase.onFinishMatchPressed',
      context: context);

  @override
  Future<void> onFinishMatchPressed() {
    return _$onFinishMatchPressedAsyncAction
        .run(() => super.onFinishMatchPressed());
  }

  late final _$_updateNextMatchAsyncAction = AsyncAction(
      '_CurrentMatchViewModelBase._updateNextMatch',
      context: context);

  @override
  Future<void> _updateNextMatch() {
    return _$_updateNextMatchAsyncAction.run(() => super._updateNextMatch());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
isDraw: ${isDraw},
match: ${match},
homeScore: ${homeScore},
awayScore: ${awayScore}
    ''';
  }
}
