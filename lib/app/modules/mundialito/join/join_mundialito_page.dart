import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/join/join_mundialito_view_model.dart';
import 'package:mundialito/app/shared/widgets/buttons/primary_button_widget.dart';
import 'package:mundialito/app/shared/widgets/input/primary_text_input_widget.dart';
import 'package:mundialito/app/shared/widgets/liststate/primary_loader_widget.dart';

class JoinMundialitoPage extends StatefulWidget {
  const JoinMundialitoPage({Key? key}) : super(key: key);

  @override
  JoinMundialitoPageState createState() => JoinMundialitoPageState();
}

class JoinMundialitoPageState extends State<JoinMundialitoPage> {
  final JoinMundialitoViewModel _viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: PrimaryButtonWidget(
          onPressed: () {
            _onJoinPressed();
          },
          label: "Join mundialito!"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Observer(builder: (_) {
          if (_viewModel.isLoading) {
            return const PrimaryLoaderWidget();
          } else {
            return Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Join an already",
                      style: textTheme.headline1?.copyWith(),
                    ),
                    Row(
                      children: [
                        Text(
                          "existing ",
                          style: textTheme.headline1?.copyWith(),
                        ),
                        Text(
                          "Mundialito",
                          style: textTheme.headline2?.copyWith(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimaryTextInputWidget(
                        inputTextEditingController:
                        _viewModel.mundialitoJoinCodeTextEditingController,
                        hint: "Code shared by the admin")
                  ],
                )
              ],
            );
          }
        }),
      ),
    );
  }

  Future<void> _onJoinPressed() async {
    await _viewModel.joinMundialito();
    Modular.to.pop();
  }
}
