import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleButtonWithLabelWidget extends StatefulWidget {
  ToggleButtonWithLabelWidget({Key? key,
    required this.onOptionSelected,
    required this.label,
    required this.options,
    required this.selectedOptions})
      : super(key: key);

  final Function(bool) onOptionSelected;
  final String label;
  final List<Widget> options;
  final List<bool> selectedOptions;

  @override
  ToggleButtonWithLabelState createState() => ToggleButtonWithLabelState();
}

class ToggleButtonWithLabelState extends State<ToggleButtonWithLabelWidget> {

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 168,
          child: Text(
              widget.label,
            style: textTheme.headline3?.copyWith(),
          ),
        ),
        const Spacer(),
        ToggleButtons(
            onPressed: (int index) {
              setState(() {
                if (widget.selectedOptions[0] == true) {
                  widget.onOptionSelected(true);
                } else {
                  widget.onOptionSelected(false);
                }
                for (int i = 0; i < widget.selectedOptions.length; i++) {
                  widget.selectedOptions[i] = i == index;
                }
              });
            },
            direction: Axis.horizontal,
            isSelected: widget.selectedOptions,
            children: widget.options
        )
      ],
    );
  }
}
