import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/home/home_module.dart';
import 'package:mundialito/app/modules/mundialito/create/create_mundialito_module.dart';
import 'package:mundialito/app/modules/mundialito/join/join_mundialito_module.dart';
import 'package:mundialito/app/modules/mundialito/tournament/tournament_module.dart';
import 'package:mundialito/app/modules/onboarding/onboarding_module.dart';
import 'package:mundialito/app/modules/onboarding/submodules/login/login_module.dart';
import 'package:mundialito/app/modules/onboarding/submodules/register/register_module.dart';

class AppModule extends Module {

  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    // ModuleRoute(Modular.initialRoute, module: OnboardingModule()),
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/mundialito', module: CreateMundialitoModule()),
    ModuleRoute('/tournament', module: TournamentModule()),
    ModuleRoute('/join', module: JoinMundialitoModule())
  ];

}