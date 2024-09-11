import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/onboarding/submodules/register/register_page.dart';
import 'package:mundialito/app/modules/onboarding/submodules/register/register_view_model.dart';

class RegisterModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => RegisterPage())
  ];

}