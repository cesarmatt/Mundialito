import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
  final OverviewViewModel viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    viewModel.getMundialitoOverview(widget.mundialitoId);
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Observer(builder: (_) {
        if (viewModel.isLoading) {
          return const PrimaryLoaderWidget();
        } else {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.mundialitoOverview?.mundialitoTile ?? "",
                      style: textTheme.headline1?.copyWith(),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(DateTimeUtils.getFormattedDate(
                            viewModel.mundialitoOverview?.mundialitoDate)),
                        Text(" - "),
                        Text(
                            "${viewModel.mundialitoOverview?.contenders.length.toString()} contenders" ??
                                ""),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TableWidget(
                      results: viewModel.results ?? [],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Current match"),
                        const SizedBox(height: 4),
                        CurrentMatchWidget(
                            currentMatch: viewModel.currentMatch,
                            onCurrentMatchPressed: (String matchId) {
                              _onCurrentMatchPressed(matchId);
                            })
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  void _onCurrentMatchPressed(String matchId) {
    Modular.to.pushNamed('/tournament/currentmatch/$matchId', arguments: matchId, forRoot: true);
  }
}
