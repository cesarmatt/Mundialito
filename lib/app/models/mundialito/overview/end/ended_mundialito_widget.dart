import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/theme/mundialito_theme.dart';

class EndedMundialitoWidget extends StatelessWidget {
  const EndedMundialitoWidget({Key? key, required this.onPressed})
      : super(key: key);

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: MundialitoTheme.getPrimaryColor(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Column(
            children: const [
              Text("Mundialito has ended!"),
              SizedBox(height: 8),
              Text("Click here to see the details.")
            ],
          ),
        ),
      ),
    );
  }
}
