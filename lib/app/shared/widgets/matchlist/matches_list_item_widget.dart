import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/models/match/match.dart';

class MatchesListItemWidget extends StatelessWidget {
  const MatchesListItemWidget({Key? key, required this.match})
      : super(key: key);

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          children: [
            Text("#${match.matchIdentifier.toString()}"),
            const SizedBox(
              width: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(match.contenderH),
                Text(" ${match.scoreContenderH} x ${match.scoreContenderA} "),
                Text(match.contenderA),
              ],
            )
          ],
        ),
      ),
    );
  }
}
