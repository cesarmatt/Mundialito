import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/onboarding/onboarding_view_model.dart';

import '../../shared/widgets/buttons/button_with_icon_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  OnboardingPageState createState() => OnboardingPageState();
}

class OnboardingPageState extends State<OnboardingPage> {
  final OnboardingViewModel viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWithIconWidget(
                onPressed: () {
                  _onStartMundialitoPressed();
                },
                icon: const Icon(Icons.fiber_new_rounded),
                label: "Start new Mundialito")
          ],
        ),
      ),
    );
  }

  void _onStartMundialitoPressed() {
    Modular.to.pushNamed('/mundialito/');
  }
}
