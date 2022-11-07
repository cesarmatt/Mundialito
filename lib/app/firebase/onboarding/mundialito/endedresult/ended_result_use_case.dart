import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/models/mundialito/endedresult/ended_result_view_object.dart';
import 'package:mundialito/app/models/mundialito/mundialito.dart';
import 'package:mundialito/app/models/mundialito/overview/table/result_for_contender.dart';

class EndedResultUseCase {
  final MundialitoDetailRepository _repository = MundialitoDetailRepository();

  Future<EndedResultViewObject> getEndedResultViewObject(
      String mundialitoId) async {
    Mundialito? mundialito = await _repository.getMundialitoById(mundialitoId);
    List<ResultForContender> podium = _makePodium(
        mundialito?.contenders ?? [],
        mundialito?.matches ?? []
    );
    return EndedResultViewObject(
        mundialitoName: mundialito?.name ?? "",
        endDate: mundialito?.endDate ?? Timestamp.now(),
        podium: podium,
        results: mundialito?.matches ?? <Match>[]
    );
  }

  List<ResultForContender> _makePodium(List<Contender> contenders, List<Match> matches) {
    List<ResultForContender> podium = [];
    List<ResultForContender> results =
        ResultForContender.makeResultsList(matches, contenders);
    for (ResultForContender result in results) {
      if (podium.isEmpty) {
        podium.add(result);
      } else {
        podium.mapIndexed((index, podiumResult) => {
              if (result.wins > podiumResult.wins)
                {podium.insert(index - 1, result)}
              else
                {podium.add(result)}
            });
        for (ResultForContender podiumResult in podium) {
          if (result.wins > podiumResult.wins) {
            podium.insert(0, result);
          } else {
            podium.add(result);
          }
        }
      }
    }

    return podium;
  }
}
