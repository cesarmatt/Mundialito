import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondaryButtonWidget extends StatelessWidget {
  const SecondaryButtonWidget(
      {Key? key,
      required this.onPressed,
      required this.icon,
      this.width,
      this.height,
      this.horizontalPadding,
      this.verticalPadding});

  final void Function() onPressed;
  final Icon icon;
  final double? width;
  final double? height;
  final double? horizontalPadding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(40, 40),
        shape: const CircleBorder()
      ),
      child: icon,
    );
  }
}
