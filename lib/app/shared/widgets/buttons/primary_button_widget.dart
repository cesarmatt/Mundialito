import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.width,
      this.height})
      : super(key: key);

  final void Function() onPressed;
  final String label;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SizedBox(
        width: width ?? double.infinity,
        height: height ?? 50,
        child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              label,
              style: textTheme.button?.copyWith(),
            )),
      ),
    );
  }
}
