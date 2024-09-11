import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/currentmatch/widget/contender_score_widget.dart';

class ScoreboardWidget extends StatelessWidget {
  const ScoreboardWidget(
      {Key? key,
      required this.onHomeContenderScoreUpdated,
      required this.onAwayContenderScoreUpdated,
      required this.match,
      required this.homeScore,
      required this.awayScore})
      : super(key: key);

  final void Function(int) onHomeContenderScoreUpdated;
  final void Function(int) onAwayContenderScoreUpdated;
  final Match? match;
  final int homeScore;
  final int awayScore;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContenderScoreWidget(
                onAddButtonClicked: () => onHomeContenderScoreUpdated(1),
                onRemoveButtonClicked: () => onHomeContenderScoreUpdated(-1),
                contender: match?.contenderH ?? "",
                score: homeScore),
            ContenderScoreWidget(
                onAddButtonClicked: () => onAwayContenderScoreUpdated(1),
                onRemoveButtonClicked: () => onAwayContenderScoreUpdated(-1),
                contender: match?.contenderA ?? "",
                score: awayScore),
          ],
        ),
      ),
    );
  }
}
