import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/matches/matches_module.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/overview/overview_module.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/results/results_module.dart';
import 'package:mundialito/app/modules/mundialito/tournament/tournament_page.dart';
import 'package:mundialito/app/modules/mundialito/tournament/tournament_view_model.dart';

class TournamentModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TournamentViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => TournamentPage(mundialitoId: args.data), children: [
      ModuleRoute('/matches', module: MatchesModule()),
      ModuleRoute('/overview', module: OverviewModule()),
      ModuleRoute('/results', module: ResultsModule()),
    ]),
  ];

}