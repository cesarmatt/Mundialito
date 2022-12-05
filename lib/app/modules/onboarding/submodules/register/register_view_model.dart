import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/register/register_repository.dart';
import 'package:mundialito/app/models/onboarding/register/register_payload.dart';
import 'package:mundialito/app/models/onboarding/register/register_status.dart';

part 'register_view_model.g.dart';

class RegisterViewModel = _RegisterViewModelBase with _$RegisterViewModel;

abstract class _RegisterViewModelBase with Store {
  final RegisterRepository _registerRepository = RegisterRepository();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  RegisterStatus registerStatus = RegisterStatus.idle;

  @action
  Future<void> doRegister() async {
    setRegisterStatus(RegisterStatus.loading);
    String email = emailTextEditingController.text;
    String password = passwordTextEditingController.text;
    RegisterPayload registerPayload = RegisterPayload(email, password);
    var registerResponse =
        await _registerRepository.doRegister(registerPayload);
    if (registerResponse.registerStatus == RegisterStatus.success) {
      setRegisterStatus(RegisterStatus.success);
    } else if (registerResponse.registerStatus == RegisterStatus.failed) {
      setRegisterStatus(RegisterStatus.failed);
    } else if (registerResponse.registerStatus == RegisterStatus.weakPassword) {
      setRegisterStatus(RegisterStatus.weakPassword);
    } else if (registerResponse.registerStatus ==
        RegisterStatus.existingEmail) {
      setRegisterStatus(RegisterStatus.existingEmail);
    }
  }

  @action
  void setRegisterStatus(RegisterStatus newRegisterStatus) {
    registerStatus = newRegisterStatus;
  }
}
