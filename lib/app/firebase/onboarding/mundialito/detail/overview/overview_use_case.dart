import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/models/mundialito/overview/mundialito_overview_view_object.dart';

class OverviewUseCase {
  final MundialitoDetailRepository _repository = MundialitoDetailRepository();

  Future<MundialitoOverviewViewObject> getMundialitoOverviewViewObject(String mundialitoId) async {
    var mundialito = await _repository.getMundialitoById(mundialitoId);
    return MundialitoOverviewViewObject(
        mundialitoTile: mundialito?.name ?? "",
        mundialitoDate: mundialito?.startDate ?? Timestamp.now(),
        numberOfContenders: mundialito?.contenders.length ?? 0,
        matches: mundialito?.matches ?? <Match>[]
    );
  }
}