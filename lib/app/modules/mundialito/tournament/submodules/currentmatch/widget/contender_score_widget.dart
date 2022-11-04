import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/shared/widgets/buttons/secondary_button_widget.dart';

class ContenderScoreWidget extends StatelessWidget {
  const ContenderScoreWidget(
      {Key? key,
      required this.onAddButtonClicked,
      required this.onRemoveButtonClicked,
      required this.contender,
      required this.score})
      : super(key: key);

  final void Function() onAddButtonClicked;
  final void Function() onRemoveButtonClicked;
  final String contender;
  final int score;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(contender),
        const SizedBox(height: 16),
        Text(
          score.toString(),
          style: textTheme.headline1?.copyWith(),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            SecondaryButtonWidget(
                onPressed: () => onAddButtonClicked(), icon: const Icon(Icons.add)),
            SecondaryButtonWidget(
                onPressed: () => onRemoveButtonClicked(), icon: const Icon(Icons.remove)),
          ],
        )
      ],
    );
  }
}
