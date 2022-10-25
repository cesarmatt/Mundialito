// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OverviewViewModel on _OverviewViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_OverviewViewModelBase.isLoading', context: context);

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
      Atom(name: '_OverviewViewModelBase.isError', context: context);

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

  late final _$mundialitoOverviewAtom =
      Atom(name: '_OverviewViewModelBase.mundialitoOverview', context: context);

  @override
  MundialitoOverviewViewObject? get mundialitoOverview {
    _$mundialitoOverviewAtom.reportRead();
    return super.mundialitoOverview;
  }

  @override
  set mundialitoOverview(MundialitoOverviewViewObject? value) {
    _$mundialitoOverviewAtom.reportWrite(value, super.mundialitoOverview, () {
      super.mundialitoOverview = value;
    });
  }

  late final _$getMundialitoOverviewAsyncAction = AsyncAction(
      '_OverviewViewModelBase.getMundialitoOverview',
      context: context);

  @override
  Future<void> getMundialitoOverview(String mundialitoId) {
    return _$getMundialitoOverviewAsyncAction
        .run(() => super.getMundialitoOverview(mundialitoId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
mundialitoOverview: ${mundialitoOverview}
    ''';
  }
}
