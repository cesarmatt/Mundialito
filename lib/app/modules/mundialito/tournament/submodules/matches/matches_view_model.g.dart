// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matches_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatchesViewModel on _MatchesViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MatchesViewModelBase.isLoading', context: context);

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
      Atom(name: '_MatchesViewModelBase.isError', context: context);

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

  late final _$mundialitoMatchesAtom =
      Atom(name: '_MatchesViewModelBase.mundialitoMatches', context: context);

  @override
  MundialitoMatchesViewObject? get mundialitoMatches {
    _$mundialitoMatchesAtom.reportRead();
    return super.mundialitoMatches;
  }

  @override
  set mundialitoMatches(MundialitoMatchesViewObject? value) {
    _$mundialitoMatchesAtom.reportWrite(value, super.mundialitoMatches, () {
      super.mundialitoMatches = value;
    });
  }

  late final _$getMundialitoMatchesAsyncAction = AsyncAction(
      '_MatchesViewModelBase.getMundialitoMatches',
      context: context);

  @override
  Future<void> getMundialitoMatches(String mundialitoId) {
    return _$getMundialitoMatchesAsyncAction
        .run(() => super.getMundialitoMatches(mundialitoId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
mundialitoMatches: ${mundialitoMatches}
    ''';
  }
}
