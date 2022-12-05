import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundialito/app/modules/home/submodules/mymundialitos/my_mundialitos_page.dart';
import 'package:mundialito/app/modules/home/submodules/mymundialitos/my_mundialitos_view_model.dart';

class MyMundialitosModule extends WidgetModule {

  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MyMundialitosViewModel())
  ];

  @override
  Widget get view => const MyMundialitosPage();
}