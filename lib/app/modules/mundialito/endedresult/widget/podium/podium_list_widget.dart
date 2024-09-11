import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/modules/mundialito/endedresult/widget/podium/podium_list_item_widget.dart';

class PodiumListWidget extends StatelessWidget {
  const PodiumListWidget({Key? key, required this.topContenders})
      : super(key: key);

  final List<Contender> topContenders;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: ListView.builder(
            itemCount: topContenders.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var contender = topContenders[index];
              return PodiumListItemWidget(contender: contender, index: index);
            }),
      ),
    );
  }
}
