import 'package:flutter/material.dart';

class FormTitleWithSubtitleWidget extends StatelessWidget {
  const FormTitleWithSubtitleWidget(
      {Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          title,
          style: textTheme.headline3?.copyWith(),
        ),
        const SizedBox(height: 4,),
        Text(
          subtitle,
          style: textTheme.headline4?.copyWith(),
        ),
      ],
    );
  }
}
