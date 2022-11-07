// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ended_result_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EndedResultViewModel on _EndedResultViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_EndedResultViewModelBase.isLoading', context: context);

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
      Atom(name: '_EndedResultViewModelBase.isError', context: context);

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

  late final _$endedResultsAtom =
      Atom(name: '_EndedResultViewModelBase.endedResults', context: context);

  @override
  EndedResultViewObject? get endedResults {
    _$endedResultsAtom.reportRead();
    return super.endedResults;
  }

  @override
  set endedResults(EndedResultViewObject? value) {
    _$endedResultsAtom.reportWrite(value, super.endedResults, () {
      super.endedResults = value;
    });
  }

  late final _$podiumAtom =
      Atom(name: '_EndedResultViewModelBase.podium', context: context);

  @override
  List<Contender>? get podium {
    _$podiumAtom.reportRead();
    return super.podium;
  }

  @override
  set podium(List<Contender>? value) {
    _$podiumAtom.reportWrite(value, super.podium, () {
      super.podium = value;
    });
  }

  late final _$getMundialitoAsyncAction =
      AsyncAction('_EndedResultViewModelBase.getMundialito', context: context);

  @override
  Future<void> getMundialito(String mundialitoId) {
    return _$getMundialitoAsyncAction
        .run(() => super.getMundialito(mundialitoId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
endedResults: ${endedResults},
podium: ${podium}
    ''';
  }
}
