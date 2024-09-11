import 'package:mobx/mobx.dart';
import 'package:mundialito/app/models/mundialito/mundialito_firebase_object.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {

  @observable
  int currentIndex = 0;

}