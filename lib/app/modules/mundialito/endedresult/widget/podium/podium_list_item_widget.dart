import 'package:flutter/cupertino.dart';
import 'package:mundialito/app/models/contender/contender.dart';

class PodiumListItemWidget extends StatelessWidget {
  const PodiumListItemWidget({Key? key, required this.contender, required this.index})
      : super(key: key);

  final Contender contender;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(_getPlacement(index)),
          Text(contender.name)
        ],
      ),
    );
  }

  String _getPlacement(int index) {
    if (index == 0) {
      return "1st place: ";
    } else if (index == 1) {
      return "2nd place: ";
    } else {
      return "3rd place: ";
    }
  }
}
