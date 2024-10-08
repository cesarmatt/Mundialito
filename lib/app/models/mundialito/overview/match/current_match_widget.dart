import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/theme/mundialito_theme.dart';

class CurrentMatchWidget extends StatelessWidget {
  const CurrentMatchWidget(
      {Key? key,
      required this.currentMatch,
      required this.onCurrentMatchPressed})
      : super(key: key);

  final Match? currentMatch;
  final Function(String) onCurrentMatchPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onCurrentMatchPressed(currentMatch?.uid ?? ""),
      child: Card(
        color: MundialitoTheme.getPrimaryColor(),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              Text(currentMatch?.contenderH ?? ""),
              const Spacer(),
              Text(" ${currentMatch?.scoreContenderH} x ${currentMatch?.scoreContenderA} "),
              const Spacer(),
              Text(currentMatch?.contenderA ?? ""),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
