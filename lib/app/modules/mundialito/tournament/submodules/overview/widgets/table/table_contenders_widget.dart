import 'package:flutter/cupertino.dart';
import 'package:mundialito/app/models/mundialito/overview/table/result_for_contender.dart';
import 'package:mundialito/app/modules/mundialito/tournament/submodules/overview/widgets/table/table_contenders_item_widget.dart';

class TableContendersWidget extends StatelessWidget {
  const TableContendersWidget({Key? key, required this.results})
      : super(key: key);

  final List<ResultForContender> results;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: results.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var result = results[index];
          return TableContendersItemWidget(result: result);
        });
  }
}
