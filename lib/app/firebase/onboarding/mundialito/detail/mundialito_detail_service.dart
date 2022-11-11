import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/match/match.dart';

abstract class MundialitoDetailService {
  Future<Mundialito> getMundialitoById(String mundialitoId);
  Future<Match> getMatchById(String matchId);
  Future<bool> finishMundialito(String mundialitoId);
  Future<bool> cancelMundialito(String mundialitoId);
}