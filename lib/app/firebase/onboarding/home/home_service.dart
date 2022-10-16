import 'package:mundialito/app/models/mundialito/mundialito.dart';

abstract class HomeService {
  Future<List<Mundialito>?> getMundialitos();
}