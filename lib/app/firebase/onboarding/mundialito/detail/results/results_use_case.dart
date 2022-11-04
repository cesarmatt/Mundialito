import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/models/mundialito/results/mundialito_results_view_object.dart';
import 'package:mundialito/app/models/match/match.dart';

class ResultsUseCase {
  final MundialitoDetailRepository _repository = MundialitoDetailRepository();

  Future<MundialitoResultsViewObject> getMundialitoResultsViewObject(String mundialitoId) async {
    var mundialito = await _repository.getMundialitoById(mundialitoId);
    var finishedMatches = mundialito?.matches.where((match) => match.isFinished == true).toList();
    return MundialitoResultsViewObject(matches: finishedMatches ?? <Match>[]);
  }
}