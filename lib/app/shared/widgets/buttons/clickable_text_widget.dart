import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClickableTextWidget extends StatelessWidget {
  const ClickableTextWidget(
      {Key? key, required this.onTextClicked, required this.text})
      : super(key: key);

  final Function() onTextClicked;
  final String text;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            onTextClicked();
          },
          child: Text(
            text,
            style: textTheme.caption?.copyWith(),
          ),
        )
      ],
    );
  }
}
