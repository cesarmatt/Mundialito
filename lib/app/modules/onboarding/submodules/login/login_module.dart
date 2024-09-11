import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/onboarding/submodules/login/login_page.dart';
import 'package:mundialito/app/modules/onboarding/submodules/login/login_view_model.dart';

class LoginModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => LoginPage())
  ];

}