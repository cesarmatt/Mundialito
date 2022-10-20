import 'package:mundialito/app/models/mundialito/mundialito_home_view_object.dart';

abstract class HomeService {
  Future<List<MundialitoHomeViewObject>?> getMundialitos();
}