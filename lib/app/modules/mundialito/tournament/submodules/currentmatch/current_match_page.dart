import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/currentmatch/current_match_view_model.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/currentmatch/widget/scoreboard_widget.dart';
import 'package:mundialito/app/shared/widgets/buttons/primary_button_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';
import 'package:mundialito/app/shared/widgets/snackbar/snackbar_widget.dart';

class CurrentMatchPage extends StatefulWidget {
  const CurrentMatchPage({Key? key, required this.matchId}) : super(key: key);

  final String matchId;

  @override
  CurrentMatchPageState createState() => CurrentMatchPageState();
}

class CurrentMatchPageState extends State<CurrentMatchPage> {
  final CurrentMatchViewModel viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    viewModel.getMatch(widget.matchId);
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Observer(builder: (_) {
        if (viewModel.isLoading) {
          return const PrimaryLoaderWidget();
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 24),
                ScoreboardWidget(
                    onHomeContenderScoreUpdated: (int score) {
                      viewModel.onHomeContenderScoreUpdated(score);
                    },
                    onAwayContenderScoreUpdated: (int score) {
                      viewModel.onAwayContenderScoreUpdated(score);
                    },
                    match: viewModel.match,
                    homeScore: viewModel.homeScore,
                    awayScore: viewModel.awayScore),
                const Spacer(),
                Column(
                  children: [
                    PrimaryButtonWidget(
                        onPressed: () {
                          _onCancelMatchPressed();
                        },
                        horizontalPadding: 0,
                        label: "Cancel match"),
                    PrimaryButtonWidget(
                        onPressed: () {
                          _onFinishMatchPressed();
                        },
                        horizontalPadding: 0,
                        label: "Finish match"),
                  ],
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  void _onCancelMatchPressed() async {
    await viewModel.onCancelMatchPressed();
    Modular.to.pop();
  }

  void _onFinishMatchPressed() async {
    await viewModel.onFinishMatchPressed();
    if (viewModel.isDraw) {
      await _showSnackBar(makeErrorSnackBar("Your match can't end with a draw"));
    } else {
      await _showSnackBar(makeSuccessSnackBar("Your match has ended!"));
      Modular.to.pop();
    }
  }

  Future<void> _showSnackBar(SnackBar snackBar) async {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
