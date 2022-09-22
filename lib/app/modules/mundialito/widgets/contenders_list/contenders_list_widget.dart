import 'package:flutter/cupertino.dart';
import 'package:mundialito/app/modules/mundialito/widgets/contenders_list/contender_list_item_widget.dart';
import '../../../../models/contender/contender.dart';

class ContendersListWidget extends StatelessWidget {
  const ContendersListWidget(
      {Key? key, required this.contenders, required this.onItemDeleted})
      : super(key: key);

  final List<Contender>? contenders;
  final void Function(Contender?) onItemDeleted;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contenders?.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          if (contenders?.isNotEmpty == true) {
            var contender = contenders?[index];
            return ContenderListItemWidget(
              contender: contender,
              onDeleteClicked: (Contender? contender) {
                onItemDeleted(contender);
              },
            );
          } else {
            return const Text("No contenders yet :(");
          }
        });
  }
}
