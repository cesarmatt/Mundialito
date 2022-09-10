import 'package:flutter_modular/flutter_modular.dart';
import 'mundialito_page.dart';
import 'mundialito_view_model.dart';

class MundialitoModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MundialitoViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => MundialitoPage())
  ];

}