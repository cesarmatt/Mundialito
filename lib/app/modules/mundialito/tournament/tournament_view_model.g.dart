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

  late final _$mundialitoAtom =
      Atom(name: '_TournamentViewModelBase.mundialito', context: context);

  @override
  Mundialito? get mundialito {
    _$mundialitoAtom.reportRead();
    return super.mundialito;
  }

  @override
  set mundialito(Mundialito? value) {
    _$mundialitoAtom.reportWrite(value, super.mundialito, () {
      super.mundialito = value;
    });
  }

  late final _$getMundialitoAsyncAction =
      AsyncAction('_TournamentViewModelBase.getMundialito', context: context);

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
currentIndex: ${currentIndex},
mundialito: ${mundialito}
    ''';
  }
}
