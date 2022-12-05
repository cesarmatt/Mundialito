import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/home/submodules/invitedmundialitos/invited_mundialitos_page.dart';
import 'package:mundialito/app/modules/home/submodules/invitedmundialitos/invited_mundialitos_view_model.dart';

class InvitedMundialitosModule extends WidgetModule {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => InvitedMundialitosViewModel())
  ];

  @override
  Widget get view => const InvitedMundialitosPage();

}