import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mundialito/app/theme/mundialito_theme.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: SvgPicture.asset('assets/playing-games.svg',
                      width: 40, height: 40, color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "It's time to",
                      style: textTheme.bodyText2?.copyWith(),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          "start your first ",
                          style: textTheme.bodyText2?.copyWith(),
                        ),
                        Text(
                          "mundialito!",
                          style: textTheme.bodyText2?.copyWith(
                              color: MundialitoTheme.getPrimaryColor()),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
