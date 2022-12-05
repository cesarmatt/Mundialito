import 'package:flutter/cupertino.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';
import 'package:mundialito/app/modules/home/widgets/list/mundialito_home_list_item_widget.dart';

class MundialitoListWidget extends StatelessWidget {
  const MundialitoListWidget(
      {Key? key, required this.onItemPressed, required this.mundialitos})
      : super(key: key);

  final void Function(String) onItemPressed;
  final List<MundialitoFirebaseObject> mundialitos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: mundialitos.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var mundialito = mundialitos[index];
          return MundialitoHomeListItemWidget(
              mundialito: mundialito, onItemPressed: onItemPressed);
        });
  }
}
