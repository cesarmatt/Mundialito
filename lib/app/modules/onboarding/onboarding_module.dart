import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/onboarding/onboarding_view_model.dart';

import 'onboarding_page.dart';

class OnboardingModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OnboardingViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => OnboardingPage())
  ];

}