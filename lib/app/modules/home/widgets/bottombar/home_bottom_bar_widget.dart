import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mundialito/app/theme/mundialito_theme.dart';

class HomeBottomBarWidget extends StatelessWidget {
  const HomeBottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, right: 16, left: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MundialitoTheme.getPrimaryColor(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () { print("Go to create player"); },
                icon: SvgPicture.asset(
                  'assets/person_add_black_24dp.svg',
                  color: Colors.white,
                  width: 40,
                  height: 40,
                )
            ),
            const Spacer(),
            IconButton(
                onPressed: () { Modular.to.pushNamed('/mundialito/'); },
                icon: SvgPicture.asset('assets/flag_circle_black_24dp.svg',
                    color: Colors.white, width: 40, height: 40)
            ),
            const Spacer(),
            IconButton(
                onPressed: () { print("Go to create team"); },
                icon: SvgPicture.asset('assets/group_add_black_24dp.svg',
                    color: Colors.white, width: 40, height: 40)
            ),
          ],
        ),
      ),
    );
  }
}
