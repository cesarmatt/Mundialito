import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/mundialito_view_model.dart';
import 'package:mundialito/app/shared/widgets/buttons/button_with_icon_widget.dart';
import 'package:mundialito/app/shared/widgets/input/primary_text_input_widget.dart';

class MundialitoPage extends StatefulWidget {
  const MundialitoPage({Key? key}) : super(key: key);

  @override
  MundialitoPageState createState() => MundialitoPageState();
}

class MundialitoPageState extends State<MundialitoPage> {
  final MundialitoViewModel viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's configure",
                    style: textTheme.headline1?.copyWith(),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "your ",
                    style: textTheme.headline1?.copyWith(),
                  ),
                  Text(
                    "mundialito",
                    style: textTheme.headline2?.copyWith(),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24,),
          Column(
            children: [
              PrimaryTextInputWidget(
                  inputTextEditingController: TextEditingController(),
                  hint: "Give your mundialito a name"
              ),
              const SizedBox(height: 16,),
              PrimaryTextInputWidget(
                  inputTextEditingController: TextEditingController(),
                  hint: "Select a start date for your mundialito"
              ),
            ],
          )
        ],
      ),
    ));
  }
}
