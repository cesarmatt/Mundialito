
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/models/onboarding/register/register_status.dart';
import 'package:mundialito/app/modules/onboarding/submodules/register/register_view_model.dart';
import 'package:mundialito/app/shared/widgets/buttons/clickable_text_widget.dart';
import 'package:mundialito/app/shared/widgets/buttons/primary_button_widget.dart';
import 'package:mundialito/app/shared/widgets/input/input_text_password_widget.dart';
import 'package:mundialito/app/shared/widgets/input/primary_text_input_widget.dart';
import 'package:mundialito/app/shared/widgets/snackbar/snackbar_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final RegisterViewModel _viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: PrimaryButtonWidget(
        onPressed: () {
          _onRegisterPressed();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                    ),
                    Text(
                      "Welcome!",
                      style: textTheme.headline1?.copyWith(),
                    ),
                    Column(
                      children: [
                        Text(
                          "Register to start",
                          style: textTheme.headline5?.copyWith(),
                        ),
                        Text(
                          " using Mundialito.",
                          style: textTheme.headline5?.copyWith(),
                        )
                      ],
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
                        _viewModel.emailTextEditingController,
                        hint: "Enter email"),
                    const SizedBox(
                      height: 16,
                    ),
                    InputTextPasswordWidget(
                        inputTextEditingController:
                        _viewModel.passwordTextEditingController,
                        hint: "Password"),
                  ],
                )
              ],
            );
          })),
    );
  }

  void _onRegisterPressed() async {
    await _viewModel.doRegister();
    _makeSnackBar();
  }

  void _makeSnackBar() async {
    if (_viewModel.registerStatus == RegisterStatus.success) {
      _goToHome();
    } else if (_viewModel.registerStatus == RegisterStatus.failed) {
      await _showSnackBar(makeErrorSnackBar("Something went wrong."));
    } else if (_viewModel.registerStatus == RegisterStatus.weakPassword) {
      await _showSnackBar(
          makeErrorSnackBar("Your password seems weak, please try again!"));
    } else if (_viewModel.registerStatus == RegisterStatus.existingEmail) {
      await _showSnackBar(makeErrorSnackBar(
          "This email is already on use"));
    }
  }

  Future<void> _showSnackBar(SnackBar snackBar) async {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _goToHome() {
    Modular.to.navigate('/home/');
  }
}