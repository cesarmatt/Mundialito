import 'package:flutter/cupertino.dart';
import 'package:mundialito/app/models/mundialito/overview/table/result_for_contender.dart';

class TableContendersItemWidget extends StatelessWidget {
  const TableContendersItemWidget({Key? key, required this.result})
      : super(key: key);

  final ResultForContender result;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 80, child: Text(result.contender.name)),
            const SizedBox(width: 72),
            Text(result.wins.toString()),
            const SizedBox(width: 80),
            Text(result.losses.toString())
          ],
        ),
        const SizedBox(height: 8)
      ],
    );
  }
}
