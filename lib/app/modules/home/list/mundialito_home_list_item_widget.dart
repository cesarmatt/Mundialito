import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

class MundialitoHomeListItemWidget extends StatelessWidget {
  const MundialitoHomeListItemWidget(
      {Key? key, required this.mundialito, required this.onItemPressed})
      : super(key: key);

  final MundialitoFirebaseObject mundialito;
  final Function(String) onItemPressed;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
    return GestureDetector(
      onTap: () => onItemPressed(mundialito.uid ?? ""),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mundialito.name,
                    style: textTheme.bodyText2?.copyWith(),
                  ),
                  const SizedBox(height: 4),
                  mundialito.endDate != null
                      ? withEndDateMundialito(context)
                      : noEndDateMundialito(context),
                  const SizedBox(height: 4),
                  Text(
                    "${mundialito.contenders.length} players",
                    style: textTheme.caption?.copyWith(color: Colors.white),
                  )
                ],
              ),
              const Spacer(),
              Text(
                mundialito.isCompleted ? "ENDED" : "LIVE",
                style: mundialito.isCompleted
                    ? textTheme.caption?.copyWith(color: Colors.white)
                    : textTheme.caption?.copyWith(color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget noEndDateMundialito(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MundialitoFirebaseObject.getFormattedDate(mundialito.startDate),
            style: textTheme.caption?.copyWith(color: Colors.white),
          )
        ]);
  }

  Widget withEndDateMundialito(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          MundialitoFirebaseObject.getFormattedDate(mundialito.startDate),
          style: textTheme.caption?.copyWith(color: Colors.white),
        ),
        Text(
          " to ",
          style: textTheme.caption?.copyWith(color: Colors.white),
        ),
        Text(
          MundialitoFirebaseObject.getFormattedDate(mundialito.endDate),
          style: textTheme.caption?.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
