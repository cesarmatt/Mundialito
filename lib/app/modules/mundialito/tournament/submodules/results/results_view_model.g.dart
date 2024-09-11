// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ResultsViewModel on _ResultsViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ResultsViewModelBase.isLoading', context: context);

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
      Atom(name: '_ResultsViewModelBase.isError', context: context);

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

  late final _$mundialitoFinishedMatchesAtom = Atom(
      name: '_ResultsViewModelBase.mundialitoFinishedMatches',
      context: context);

  @override
  MundialitoResultsViewObject? get mundialitoFinishedMatches {
    _$mundialitoFinishedMatchesAtom.reportRead();
    return super.mundialitoFinishedMatches;
  }

  @override
  set mundialitoFinishedMatches(MundialitoResultsViewObject? value) {
    _$mundialitoFinishedMatchesAtom
        .reportWrite(value, super.mundialitoFinishedMatches, () {
      super.mundialitoFinishedMatches = value;
    });
  }

  late final _$getMundialitoFinishedMatchesAsyncAction = AsyncAction(
      '_ResultsViewModelBase.getMundialitoFinishedMatches',
      context: context);

  @override
  Future<void> getMundialitoFinishedMatches(String mundialitoId) {
    return _$getMundialitoFinishedMatchesAsyncAction
        .run(() => super.getMundialitoFinishedMatches(mundialitoId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
mundialitoFinishedMatches: ${mundialitoFinishedMatches}
    ''';
  }
}
