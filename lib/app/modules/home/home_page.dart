import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mundialito/app/modules/home/home_view_model.dart';
import 'package:mundialito/app/modules/home/list/mundialito_list_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mundialito/app/modules/home/widgets/floatingactionbutton/action_button_widget.dart';
import 'package:mundialito/app/modules/home/widgets/floatingactionbutton/home_expandable_floating_action_button_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/empty_state_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    _viewModel.getMundialitos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        body: Observer(builder: (_) {
          if (_viewModel.isLoading) {
            return const PrimaryLoaderWidget();
          } else if (_viewModel.mundialitos.isEmpty) {
            return const EmptyStateWidget(
              message: "You don't have any mundialitos yet.",);
          } else {
            return SingleChildScrollView(
              child: MundialitoListWidget(
                  onItemPressed: (mundialitoId) {
                    _onMundialitoPressed(mundialitoId);
                  },
                  mundialitos: _viewModel.mundialitos
              ),
            );
          }
        })
    );
  }

  Future<void> _onMundialitoPressed(String mundialitoId) async {
    await Modular.to.pushNamed('/tournament/', arguments: mundialitoId);
    await _viewModel.getMundialitos();
  }

  Future<void> _onCreatePressed() async {
    await Modular.to.pushNamed('/mundialito/');
    await _viewModel.getMundialitos();
  }

  Future<void> _onJoinPressed() async {
    print("Join pressed!");
  }
}
