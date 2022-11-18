import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/models/mundialito/tournament/tournament_view_object.dart';

class TournamentUseCase {
  final MundialitoDetailRepository _repository = MundialitoDetailRepository();

  Future<TournamentViewObject> getMundialitoTournamentViewObject(String mundialitoId) async {
    var mundialito = await _repository.getMundialitoById(mundialitoId);
    return TournamentViewObject(joinCode: mundialito?.joinCode ?? "");
  }

  Future<bool> finishMundialito(String mundialitoId) async {
    var response = await _repository.finishMundialito(mundialitoId);
    return response;
  }

  Future<bool> cancelMundialito(String mundialitoId) async {
    var response = await _repository.cancelMundialito(mundialitoId);
    return response;
  }
}