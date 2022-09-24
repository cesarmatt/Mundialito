import 'package:flutter_modular/flutter_modular.dart';
import 'create_mundialito_page.dart';
import 'create_mundialito_view_model.dart';

class CreateMundialitoModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CreateMundialitoViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => CreateMundialitoPage())
  ];

}