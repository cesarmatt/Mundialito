import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextWithActionButtonWidget extends StatelessWidget {
  const InputTextWithActionButtonWidget({Key? key,
    required this.onPressed,
    required this.inputTextEditingController,
    required this.hint,
    required this.icon,
    this.initialValue})
      : super(key: key);

  final void Function() onPressed;
  final TextEditingController inputTextEditingController;
  final String hint;
  final String? initialValue;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: inputTextEditingController,
          initialValue: initialValue,
          style: textTheme.bodyText1?.copyWith(),
          maxLines: 1,
          decoration: InputDecoration(
              hintText: hint,
              suffixIcon: IconButton(
                icon: icon,
                onPressed: () {
                  onPressed();
                },
              )
          ),
        )
      ],
    );
  }
}
