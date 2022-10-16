import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:mundialito/app/firebase/onboarding/login/login_repository.dart';
import 'package:mundialito/app/models/onboarding/login/login_payload.dart';
import 'package:mundialito/app/models/onboarding/login/login_status.dart';

part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final LoginRepository _loginRepository = LoginRepository();

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @observable
  bool isLoading = false;

  @observable
  bool isError = false;

  @observable
  LoginStatus loginStatus = LoginStatus.idle;

  @action
  Future<void> doLogin() async {
    setLoginStatus(LoginStatus.loading);
    String email = emailTextEditingController.text;
    String password = passwordTextEditingController.text;
    LoginPayload loginPayload = LoginPayload(email, password);
    var loginResponse = await _loginRepository.doLogin(loginPayload);

    if (loginResponse.loginStatus == LoginStatus.success) {
      setLoginStatus(LoginStatus.success);
    } else if (loginResponse.loginStatus == LoginStatus.failed) {
      setLoginStatus(LoginStatus.failed);
    } else if (loginResponse.loginStatus == LoginStatus.wrongPassword) {
      setLoginStatus(LoginStatus.wrongPassword);
    } else if (loginResponse.loginStatus == LoginStatus.noUser) {
      setLoginStatus(LoginStatus.noUser);
    }
  }

  @action
  void setLoginStatus(LoginStatus newLoginStatus) {
    loginStatus = newLoginStatus;
  }
}