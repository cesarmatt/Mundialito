// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_mundialitos_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyMundialitosViewModel on _MyMundialitosViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_MyMundialitosViewModelBase.isLoading', context: context);

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
      Atom(name: '_MyMundialitosViewModelBase.isError', context: context);

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

  late final _$mundialitosAtom =
      Atom(name: '_MyMundialitosViewModelBase.mundialitos', context: context);

  @override
  List<MundialitoFirebaseObject> get mundialitos {
    _$mundialitosAtom.reportRead();
    return super.mundialitos;
  }

  @override
  set mundialitos(List<MundialitoFirebaseObject> value) {
    _$mundialitosAtom.reportWrite(value, super.mundialitos, () {
      super.mundialitos = value;
    });
  }

  late final _$getMundialitosAsyncAction = AsyncAction(
      '_MyMundialitosViewModelBase.getMundialitos',
      context: context);

  @override
  Future<void> getMundialitos() {
    return _$getMundialitosAsyncAction.run(() => super.getMundialitos());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
mundialitos: ${mundialitos}
    ''';
  }
}
