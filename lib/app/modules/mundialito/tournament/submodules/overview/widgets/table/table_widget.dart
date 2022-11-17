import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/models/mundialito/overview/table/result_for_contender.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/overview/widgets/table/table_contenders_widget.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    Key? key,
    required this.results
  }) : super(key: key);

  final List<ResultForContender> results;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: const [
                Text("Contender"),
                SizedBox(width: 40),
                Text("Wins"),
                SizedBox(width: 40),
                Text("Defeats")
              ],
            ),
            const SizedBox(height: 8),
            TableContendersWidget(results: results)
          ],
        ),
      ),
    );
  }


}