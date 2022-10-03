import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/create/create_mundialito_module.dart';
import 'package:mundialito/app/modules/mundialito/tournament/tournament_module.dart';
import 'package:mundialito/app/modules/onboarding/onboarding_module.dart';
import 'package:mundialito/app/modules/onboarding/submodules/login/login_module.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: OnboardingModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/mundialito', module: CreateMundialitoModule()),
    ModuleRoute('/tournament', module: TournamentModule())
  ];

}