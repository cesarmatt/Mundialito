import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/matches/matches_page.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/matches/matches_view_model.dart';

class MatchesModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MatchesViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/:id", child: (_, args) => MatchesPage(mundialitoId: args.params["id"]))
  ];
}