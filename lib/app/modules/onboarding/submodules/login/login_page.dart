import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/models/onboarding/login/login_status.dart';
import 'package:mundialito/app/modules/onboarding/submodules/login/login_view_model.dart';
import 'package:mundialito/app/shared/widgets/buttons/clickable_text_widget.dart';
import 'package:mundialito/app/shared/widgets/buttons/primary_button_widget.dart';
import 'package:mundialito/app/shared/widgets/input/input_text_password_widget.dart';
import 'package:mundialito/app/shared/widgets/input/primary_text_input_widget.dart';
import 'package:mundialito/app/shared/widgets/snackbar/snackbar_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginViewModel viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: PrimaryButtonWidget(
        onPressed: () {
          _onSignInPressed();
        },
        label: "Sign in",
        horizontalPadding: 16,
        verticalPadding: 16,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Observer(builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Hello again!",
                      style: textTheme.headline1?.copyWith(),
                    ),
                    Text(
                      "Is good to have you back!",
                      style: textTheme.headline5?.copyWith(),
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: [
                    PrimaryTextInputWidget(
                        inputTextEditingController:
                            viewModel.emailTextEditingController,
                        hint: "Enter email"),
                    const SizedBox(
                      height: 16,
                    ),
                    InputTextPasswordWidget(
                        inputTextEditingController:
                            viewModel.passwordTextEditingController,
                        hint: "Password"),
                    const SizedBox(
                      height: 16,
                    ),
                    ClickableTextWidget(
                        onTextClicked: () {
                          print("clickô");
                        },
                        text: "Recover password"),
                  ],
                )
              ],
            );
          })),
    );
  }

  void _onSignInPressed() async {
    await viewModel.doLogin();
    _makeSnackBar();
  }

  void _makeSnackBar() async {
    if (viewModel.loginStatus == LoginStatus.success) {
      await _showSnackBar(makeSuccessSnackBar("Login successful!"));
      _goToHome();
    } else if (viewModel.loginStatus == LoginStatus.failed) {
      await _showSnackBar(makeErrorSnackBar("Something went wrong."));
    } else if (viewModel.loginStatus == LoginStatus.wrongPassword) {
      await _showSnackBar(makeErrorSnackBar("Your password seems wrong, please try again!"));
    } else if (viewModel.loginStatus == LoginStatus.noUser) {
      await _showSnackBar(makeErrorSnackBar("Couldn't find your user, have you registered to Mundialito?"));
    }
  }

  Future<void> _showSnackBar(SnackBar snackBar) async {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _goToHome() {
    Modular.to.navigate('/home/');
  }
}
