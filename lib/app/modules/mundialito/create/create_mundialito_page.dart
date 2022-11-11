import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/mundialito/create/create_mundialito_view_model.dart';
import 'package:mundialito/app/modules/mundialito/create/widgets/contenders_list/contenders_list_widget.dart';
import 'package:mundialito/app/shared/widgets/buttons/primary_button_widget.dart';
import 'package:mundialito/app/shared/widgets/input/date_picker_input_widget.dart';
import 'package:mundialito/app/shared/widgets/input/input_text_with_action_button_widget.dart';
import 'package:mundialito/app/shared/widgets/input/primary_text_input_widget.dart';
import 'package:mundialito/app/shared/widgets/radio/toggle_button_with_label_widget.dart';
import 'package:mundialito/app/shared/widgets/text/form_title_with_subtitle_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mundialito/app/theme/mundialito_theme.dart';
import '../../../models/contender/contender.dart';
import 'data/date_input_target.dart';


class CreateMundialitoPage extends StatefulWidget {
  const CreateMundialitoPage({Key? key}) : super(key: key);

  @override
  CreateMundialitoPageState createState() => CreateMundialitoPageState();
}

class CreateMundialitoPageState extends State<CreateMundialitoPage> {
  final CreateMundialitoViewModel _viewModel = Modular.get();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: PrimaryButtonWidget(
          onPressed: () {
            _onCreatePressed();
          },
          label: "Start mundialito!"),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Observer(
            builder: (_) {
              return SingleChildScrollView(
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
                    const SizedBox(
                      height: 24,
                    ),
                    Column(
                      children: [
                        PrimaryTextInputWidget(
                            inputTextEditingController:
                                _viewModel.mundialitoNameTextEditingController,
                            hint: "Give your mundialito a name"),
                        const SizedBox(
                          height: 16,
                        ),
                        DatePickerInputWidget(
                          inputTextEditingController: _viewModel
                              .mundialitoStartDateTextEditingController,
                          hint: "Select a start date for your mundialito",
                          onPressed: () {
                            _onDatePickerClicked(
                                DateInputTarget.startDate, context);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const FormTitleWithSubtitleWidget(
                            title:
                                "Now, let us know who will be the contenders",
                            subtitle:
                                "You need an even number of contenders"),
                        const SizedBox(
                          height: 16,
                        ),
                        InputTextWithActionButtonWidget(
                          onPressed: () {
                            setState(() {
                              _viewModel.onAddContenderClicked();
                            });
                          },
                          inputTextEditingController:
                              _viewModel.contenderNameTextEditingController,
                          hint: "Contender name",
                          icon: const Icon(Icons.add),
                        ),
                        ContendersListWidget(
                            contenders: _viewModel.contendersList,
                            onItemDeleted: (String? contender) {
                              setState(() {
                                _viewModel.onDeleteContenderClicked(contender);
                              });
                            })
                      ],
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  Future<void> _onDatePickerClicked(
      DateInputTarget inputTarget, BuildContext context) async {
    final DateTime? selectedDate = await _buildDatePicker(context);
    switch (inputTarget) {
      case DateInputTarget.startDate:
        _viewModel.onStartDateSelected(selectedDate);
        break;
      case DateInputTarget.endDate:
        _viewModel.onEndDateSelected(selectedDate);
        break;
    }
  }

  Future<DateTime?> _buildDatePicker(BuildContext context) async {
    var textTheme = Theme.of(context).textTheme;
    final DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022, 1),
        lastDate: DateTime(2025, 1),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                      primary: MundialitoTheme.getPrimaryColor(),
                      onPrimary: MundialitoTheme.getOnPrimaryColor(),
                      onSurface: MundialitoTheme.getOnSurfaceColor()),
                  textTheme: textTheme),
              child: child!);
        });

    return selectedDate;
  }

  Future<void> _onCreatePressed() async {
    await _viewModel.onStartMundialitoClicked();
    await Modular.to.pushNamed('/tournament/', arguments: _viewModel.createdMundialitoId);
  }
}
