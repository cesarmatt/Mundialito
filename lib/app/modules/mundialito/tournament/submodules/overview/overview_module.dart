import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/overview/overview_page.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/overview/overview_view_model.dart';

class OverviewModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => OverviewViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => OverviewPage())
  ];
}