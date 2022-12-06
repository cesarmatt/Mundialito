import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/onboarding/onboarding_view_model.dart';
import 'package:mundialito/app/shared/widgets/buttons/primary_button_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final OnboardingViewModel viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PrimaryButtonWidget(
            onPressed: _onRegisterPressed,
            label: "Register",
            width: 160,
            horizontalPadding: 0,
            verticalPadding: 16,
          ),
          const SizedBox(width: 16),
          PrimaryButtonWidget(
            onPressed: _onLoginPressed,
            label: "Login",
            width: 160,
            horizontalPadding: 0,
            verticalPadding: 16,
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  const SizedBox(
                    width: double.infinity,
                  ),
                  Text(
                    "Welcome to ",
                    style: textTheme.headline1?.copyWith(),
                  ),
                  Text(
                    "Mundialito!",
                    style: textTheme.headline2?.copyWith(),
                  ),
                ],
              ),
              const Image(
                width: double.infinity,
                image: AssetImage('assets/win.png'),
              ),
              Column(
                children: [
                  Text(
                    "You can start your tournament right away",
                    style: textTheme.headline4?.copyWith(),
                  ),
                  Text(
                    "or join an existing mundialito.",
                    style: textTheme.headline4?.copyWith(),
                  )
                ],
              ),
            ],
          )),
    );
  }

  void _onRegisterPressed() {
    Modular.to.pushNamed('/register/');
  }

  void _onLoginPressed() {
    Modular.to.pushNamed('/login/');
  }
}
