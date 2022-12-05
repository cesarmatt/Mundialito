import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/results/results_view_model.dart';
import 'package:mundialito/app/shared/widgets/liststate/empty_state_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';
import 'package:mundialito/app/shared/widgets/matchlist/matches_list_widget.dart';
import 'package:mundialito/app/models/match/match.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({Key? key, required this.mundialitoId}) : super(key: key);

  final String mundialitoId;

  @override
  ResultsPageState createState() => ResultsPageState();
}

class ResultsPageState extends State<ResultsPage> {
  final ResultsViewModel viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    viewModel.getMundialitoFinishedMatches(widget.mundialitoId);
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Observer(builder: (_) {
        if (viewModel.isLoading) {
          return const PrimaryLoaderWidget();
        } else if (viewModel.mundialitoFinishedMatches?.matches.isEmpty ==
            true) {
          return const EmptyStateWidget(
            message: "No match has ended yet.",
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Finished matches",
                style: textTheme.headline1?.copyWith(),
              ),
              const SizedBox(height: 16),
              MatchesListWidget(
                  matches: viewModel.mundialitoFinishedMatches?.matches ??
                      <Match>[])
            ],
          );
        }
      }),
    );
  }
}
