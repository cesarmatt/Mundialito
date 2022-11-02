import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/shared/widgets/matchlist/matches_list_item_widget.dart';

class MatchesListWidget extends StatelessWidget {
  const MatchesListWidget({Key? key, required this.matches}) : super(key: key);

  final List<Match> matches;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView.builder(
            itemCount: matches.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var match = matches[index];
              return MatchesListItemWidget(match: match);
            }),
      ),
    );
  }
}
