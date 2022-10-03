import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/onboarding/submodules/login/login_view_model.dart';
import 'package:mundialito/app/shared/widgets/buttons/clickable_text_widget.dart';
import 'package:mundialito/app/shared/widgets/buttons/primary_button_widget.dart';
import 'package:mundialito/app/shared/widgets/input/input_text_password_widget.dart';
import 'package:mundialito/app/shared/widgets/input/primary_text_input_widget.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
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
                    inputTextEditingController: TextEditingController(),
                    hint: "Enter username"),
                const SizedBox(
                  height: 16,
                ),
                InputTextPasswordWidget(
                    inputTextEditingController: TextEditingController(),
                    hint: "Password"),
                const SizedBox(
                  height: 16,
                ),
                ClickableTextWidget(
                    onTextClicked: () {
                      print("clickô");
                    },
                    text: "Recover password"),
                const SizedBox(
                  height: 24,
                ),
                PrimaryButtonWidget(
                  onPressed: () {
                    print("clickô");
                  },
                  label: "Sign in",
                  horizontalPadding: 0,
                  verticalPadding: 0,
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
