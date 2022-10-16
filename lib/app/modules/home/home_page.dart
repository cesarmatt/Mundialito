import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mundialito/app/modules/home/home_view_model.dart';
import 'package:mundialito/app/modules/home/widgets/bottombar/home_bottom_bar_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mundialito/app/theme/mundialito_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeViewModel viewModel = Modular.get();
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme
        .of(context)
        .textTheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () { Modular.to.pushNamed('/mundialito/'); },
        child: SvgPicture.asset('assets/flag_circle_black_24dp.svg',
            color: Colors.white, width: 40, height: 40),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sexo")
        ],
      ),
    );
  }
}
