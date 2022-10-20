import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/models/contender/contender.dart';

class ContenderListItemWidget extends StatelessWidget {
  const ContenderListItemWidget(
      {Key? key, required this.contender, required this.onDeleteClicked})
      : super(key: key);

  final String? contender;
  final Function(String?) onDeleteClicked;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(contender ?? ""),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      onDeleteClicked(contender);
                    },
                    icon: const Icon(Icons.delete))
              ],
            ),
            const Divider(height: 2, color: Colors.white,)
          ],
        )
      ),
    );
  }
}
