import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/join/join_mundialito_page.dart';
import 'package:mundialito/app/modules/mundialito/join/join_mundialito_view_model.dart';

class JoinMundialitoModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => JoinMundialitoViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => JoinMundialitoPage())
  ];

}