import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextPasswordWidget extends StatelessWidget {
  const InputTextPasswordWidget({
    Key? key,
    required this.inputTextEditingController,
    required this.hint,
    this.initialValue
  }) : super(key: key);

  final TextEditingController inputTextEditingController;
  final String hint;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    var showPassword = false;
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
          obscureText: showPassword,
          decoration: InputDecoration(
            hintText: hint,
            suffixIcon: IconButton(
              icon: Icon(Icons.remove_red_eye),
              onPressed: () {
                showPassword = !showPassword;
              },
            )
          ),
        )
      ],
    );
  }

}