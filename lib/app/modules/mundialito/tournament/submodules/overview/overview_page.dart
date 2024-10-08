import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/models/mundialito/overview/end/ended_mundialito_widget.dart';
import 'package:mundialito/app/models/mundialito/overview/match/current_match_widget.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/overview/overview_view_model.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/overview/widgets/table/table_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';
import 'package:mundialito/app/utils/date_time_utils.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key, required this.mundialitoId}) : super(key: key);

  final String mundialitoId;

  @override
  OverviewPageState createState() => OverviewPageState();
}

class OverviewPageState extends State<OverviewPage> {
  final OverviewViewModel _viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    _viewModel.getMundialitoOverview(widget.mundialitoId);
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Observer(builder: (_) {
        if (_viewModel.isLoading) {
          return const PrimaryLoaderWidget();
        } else {
          return Column(
            children: [
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _viewModel.mundialitoOverview?.mundialitoTile ?? "",
                        style: textTheme.headline1?.copyWith(),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(DateTimeUtils.getFormattedDate(
                              _viewModel.mundialitoOverview?.mundialitoDate)),
                          Text(" - "),
                          Text(
                              "${_viewModel.mundialitoOverview?.contenders.length.toString()} contenders" ??
                                  ""),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TableWidget(
                        results: _viewModel.results ?? [],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      _viewModel.currentMatch != null
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Current match"),
                          const SizedBox(height: 8),
                          CurrentMatchWidget(
                              currentMatch: _viewModel.currentMatch,
                              onCurrentMatchPressed: (String matchId) {
                                _onCurrentMatchPressed(matchId);
                              })
                        ],
                      )
                          : EndedMundialitoWidget(onPressed: () {
                        _onEndedMundialitoPressed();
                      })
                    ],
                  )
                ],
              ),
            ],
          );
        }
      }),
    );
  }

  Future<void> _onCurrentMatchPressed(String matchId) async {
    await Modular.to.pushNamed('/tournament/currentmatch/$matchId',
        arguments: matchId, forRoot: true);
    await _viewModel.getMundialitoOverview(widget.mundialitoId);
  }

  void _onEndedMundialitoPressed() {
    Modular.to.pushNamed('/tournament/endedresult/${widget.mundialitoId}');
  }

}
