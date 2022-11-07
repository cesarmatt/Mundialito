import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mundialito/app/modules/home/home_view_model.dart';
import 'package:mundialito/app/modules/home/list/mundialito_list_widget.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mundialito/app/shared/widgets/liststate/empty_state_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final HomeViewModel viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    viewModel.getMundialitos();
  }

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
      body: Observer(builder: (_) {
        if (viewModel.isLoading) {
          return const PrimaryLoaderWidget();
        } else if (viewModel.mundialitos.isEmpty) {
          return const EmptyStateWidget();
        } else {
          return SingleChildScrollView(
            child: MundialitoListWidget(
                onItemPressed: (mundialitoId) { _onMundialitoPressed(mundialitoId); },
                mundialitos: viewModel.mundialitos
            ),
          );
        }
      })
    );
  }

  void _onMundialitoPressed(String mundialitoId) {
    bool isFinished = viewModel.isSelectedMundialitoFinished(mundialitoId);
    if (isFinished) {
      Modular.to.pushNamed('/tournament/endedresult/$mundialitoId');
    } else {
      Modular.to.pushNamed('/tournament/', arguments: mundialitoId);
    }
  }
}
