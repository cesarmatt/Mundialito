import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWithIconWidget extends StatelessWidget {
  const ButtonWithIconWidget(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.label,
      this.backgroundColor,
      this.width,
      this.height});

  final void Function() onPressed;
  final Widget icon;
  final String label;
  final Color? backgroundColor;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          children: [
            icon,
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 68),
              child: Text(
                label,
                style: textTheme.button?.copyWith(fontSize: 16),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
