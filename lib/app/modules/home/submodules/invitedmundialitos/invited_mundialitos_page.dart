import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/home/list/mundialito_list_widget.dart';
import 'package:mundialito/app/modules/home/submodules/invitedmundialitos/invited_mundialitos_view_model.dart';
import 'package:mundialito/app/shared/widgets/liststate/empty_state_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';

class InvitedMundialitosPage extends StatefulWidget {
  const InvitedMundialitosPage({Key? key}) : super(key: key);

  @override
  InvitedMundialitosPageState createState() => InvitedMundialitosPageState();
}

class InvitedMundialitosPageState extends State<InvitedMundialitosPage> {
  final InvitedMundialitosViewModel _viewModel = Modular.get();

  @override
  void initState() {
    super.initState();
    _viewModel.getMundialitos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (_viewModel.isLoading) {
          return const PrimaryLoaderWidget();
        } else if (_viewModel.mundialitos.isEmpty) {
          return const EmptyStateWidget(
            message: "You haven't joined any mundialitos.",);
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
      }),
    );
  }

  Future<void> _onMundialitoPressed(String mundialitoId) async {
    await Modular.to.pushNamed('/tournament/', arguments: mundialitoId);
    await _viewModel.getMundialitos();
  }

}