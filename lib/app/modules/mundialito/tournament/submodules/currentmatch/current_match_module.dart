import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/currentmatch/current_match_page.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/currentmatch/current_match_view_model.dart';

class CurrentMatchModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CurrentMatchViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/:id", child: (_, args) => CurrentMatchPage(matchId: args.params["id"]))
  ];

}