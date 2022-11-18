import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mundialito/app/modules/home/submodules/invitedmundialitos/invited_mundialitos_module.dart';
import 'package:mundialito/app/modules/home/submodules/mymundialitos/my_mundialitos_module.dart';
import 'package:mundialito/app/modules/home/widgets/floatingactionbutton/action_button_widget.dart';
import 'package:mundialito/app/modules/home/widgets/floatingactionbutton/home_expandable_floating_action_button_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: HomeExpandableFloatingActionButtonWidget(
              distance: 90,
              children: [
                ActionButton(
                  icon: const Icon(Icons.add),
                  onPressed: _onCreatePressed,
                ),
                ActionButton(
                  icon: SvgPicture.asset('assets/flag_circle_black_24dp.svg', color: Colors.white, width: 40, height: 40),
                  onPressed: _onJoinPressed,
                ),
              ]
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const TabBar(
                tabs: [
                  Tab(text: "My mundialitos"),
                  Tab(text: "Invited mundialitos",)
                ]
            ),
          ),
          body: TabBarView(
              children: [
                MyMundialitosModule(),
                InvitedMundialitosModule()
              ]
          ),
        )
    );
  }

  Future<void> _onCreatePressed() async {
    await Modular.to.pushNamed('/mundialito/');
  }

  Future<void> _onJoinPressed() async {
    print("Join pressed!");
  }
}
