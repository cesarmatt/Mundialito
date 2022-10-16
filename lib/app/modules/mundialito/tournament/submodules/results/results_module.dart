import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/results/results_page.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/results/results_view_model.dart';

class ResultsModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ResultsViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => ResultsPage())
  ];

}