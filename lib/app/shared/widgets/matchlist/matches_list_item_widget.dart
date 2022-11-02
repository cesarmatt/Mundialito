import 'package:flutter/cupertino.dart';
import 'package:mundialito/app/models/match/match.dart';

class MatchesListItemWidget extends StatelessWidget {
  const MatchesListItemWidget({Key? key, required this.match})
      : super(key: key);

  final Match match;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(match.contenderH),
          Text(" ${match.scoreContenderH} x ${match.scoreContenderA} "),
          Text(match.contenderA),
        ],
      ),
    );
  }
}
