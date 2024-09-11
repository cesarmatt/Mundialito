// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterViewModel on _RegisterViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_RegisterViewModelBase.isLoading', context: context);

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
      Atom(name: '_RegisterViewModelBase.isError', context: context);

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

  late final _$registerStatusAtom =
      Atom(name: '_RegisterViewModelBase.registerStatus', context: context);

  @override
  RegisterStatus get registerStatus {
    _$registerStatusAtom.reportRead();
    return super.registerStatus;
  }

  @override
  set registerStatus(RegisterStatus value) {
    _$registerStatusAtom.reportWrite(value, super.registerStatus, () {
      super.registerStatus = value;
    });
  }

  late final _$doRegisterAsyncAction =
      AsyncAction('_RegisterViewModelBase.doRegister', context: context);

  @override
  Future<void> doRegister() {
    return _$doRegisterAsyncAction.run(() => super.doRegister());
  }

  late final _$_RegisterViewModelBaseActionController =
      ActionController(name: '_RegisterViewModelBase', context: context);

  @override
  void setRegisterStatus(RegisterStatus newRegisterStatus) {
    final _$actionInfo = _$_RegisterViewModelBaseActionController.startAction(
        name: '_RegisterViewModelBase.setRegisterStatus');
    try {
      return super.setRegisterStatus(newRegisterStatus);
    } finally {
      _$_RegisterViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isError: ${isError},
registerStatus: ${registerStatus}
    ''';
  }
}
