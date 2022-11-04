import 'package:flutter/cupertino.dart';
import 'package:mundialito/app/models/mundialito/overview/table/result_for_contender.dart';

class TableContendersItemWidget extends StatelessWidget {
  const TableContendersItemWidget({Key? key, required this.result})
      : super(key: key);

  final ResultForContender result;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(result.contender.name),
        const Spacer(),
        Text(result.wins.toString()),
        const Spacer(),
        Text(result.losses.toString())
      ],
    );
  }
}
