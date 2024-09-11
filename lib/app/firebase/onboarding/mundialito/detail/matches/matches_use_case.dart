import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/models/mundialito/matches/mundialito_matches_view_object.dart';
import 'package:mundialito/app/models/match/match.dart';

class MatchesUseCase {
  final MundialitoDetailRepository _repository = MundialitoDetailRepository();

  Future<MundialitoMatchesViewObject> getMundialitoMatchesViewObject(String mundialitoId) async {
    var mundialito = await _repository.getMundialitoById(mundialitoId);
    var notFinishedMatches = mundialito?.matches.where((match) => match.isFinished == false).toList();
    return MundialitoMatchesViewObject(
        matches: notFinishedMatches ?? <Match>[]
    );
  }
}