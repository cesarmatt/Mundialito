import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/home/home_page.dart';
import 'package:mundialito/app/modules/home/home_view_model.dart';

class HomeModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => HomePage())
  ];

}