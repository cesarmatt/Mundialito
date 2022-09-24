import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryTextInputWidget extends StatelessWidget {
  const PrimaryTextInputWidget(
      {Key? key,
      required this.inputTextEditingController,
      required this.hint,
      this.initialValue,
      this.isReadOnly})
      : super(key: key);

  final TextEditingController inputTextEditingController;
  final String hint;
  final String? initialValue;
  final bool? isReadOnly;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: inputTextEditingController,
      initialValue: initialValue,
      style: textTheme.bodyText1?.copyWith(),
      readOnly: isReadOnly ?? false,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: hint
      ),
    );
  }
}
