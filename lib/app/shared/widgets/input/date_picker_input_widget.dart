import 'package:flutter/material.dart';

class DatePickerInputWidget extends StatelessWidget {
  const DatePickerInputWidget(
      {Key? key,
        this.inputTextEditingController,
        required this.hint,
        required this.onPressed,
        this.initialValue,
        this.isReadOnly,
        this.formValidation})
      : super(key: key);

  final void Function() onPressed;
  final TextEditingController? inputTextEditingController;
  final String hint;
  final String? initialValue;
  final bool? isReadOnly;
  final FormFieldValidator<String>? formValidation;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: inputTextEditingController,
          initialValue: initialValue,
          style: textTheme.bodyText1?.copyWith(fontSize: 16),
          readOnly: true,
          validator: formValidation,
          maxLines: 1,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.calendar_month),
            hintText: hint,
          ),
          onTap: () {
            onPressed();
          },
        )
      ],
    );
  }
}