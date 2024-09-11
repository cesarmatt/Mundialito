import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputTextPasswordWidget extends StatefulWidget {

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
  InputTextPasswordWidgetState createState() => InputTextPasswordWidgetState();
}

class InputTextPasswordWidgetState extends State<InputTextPasswordWidget> {
  var showPassword = false;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.inputTextEditingController,
          initialValue: widget.initialValue,
          style: textTheme.bodyText1?.copyWith(),
          maxLines: 1,
          obscureText: !showPassword,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: IconButton(
              icon: showPassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
            )
          ),
        )
      ],
    );
  }

}