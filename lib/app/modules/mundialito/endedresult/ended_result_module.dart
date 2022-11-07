import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/endedresult/ended_result_page.dart';
import 'package:mundialito/app/modules/mundialito/endedresult/ended_result_view_model.dart';

class EndedResultModule extends Module {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EndedResultViewModel())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/:id", child: (_, args) => EndedResultPage(mundialitoId: args.params["id"]))
  ];
}