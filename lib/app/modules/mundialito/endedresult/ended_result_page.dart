import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/endedresult/ended_result_view_model.dart';
import 'package:mundialito/app/modules/mundialito/endedresult/widget/podium/podium_list_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';
import 'package:mundialito/app/shared/widgets/matchlist/matches_list_widget.dart';

class EndedResultPage extends StatefulWidget {
  const EndedResultPage({Key? key, required this.mundialitoId})
      : super(key: key);

  final String mundialitoId;

  @override
  EndedResultPageState createState() => EndedResultPageState();
}

class EndedResultPageState extends State<EndedResultPage> {
  final EndedResultViewModel _viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    _viewModel.getMundialito(widget.mundialitoId);
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        if (_viewModel.isLoading) {
          return const PrimaryLoaderWidget();
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Text(
                  _viewModel.endedResults?.mundialitoName ?? "",
                  style: textTheme.headline1?.copyWith(),
                ),
                PodiumListWidget(topContenders: _viewModel.podium ?? []),
                MatchesListWidget(matches: _viewModel.endedResults?.results ?? [])
              ],
            ),
          );
        }
      }),
    );
  }

}

