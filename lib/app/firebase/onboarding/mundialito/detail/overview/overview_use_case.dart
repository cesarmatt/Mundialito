import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/firebase/onboarding/mundialito/detail/mundialito_detail_repository.dart';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';
import 'package:mundialito/app/models/mundialito/overview/mundialito_overview_view_object.dart';

class OverviewUseCase {
  final MundialitoDetailRepository _repository = MundialitoDetailRepository();

  Future<MundialitoOverviewViewObject> getMundialitoOverviewViewObject(String mundialitoId) async {
    var mundialito = await _repository.getMundialitoById(mundialitoId);
    return MundialitoOverviewViewObject(
        mundialitoTile: mundialito?.name ?? "",
        mundialitoDate: mundialito?.startDate ?? Timestamp.now(),
        contenders: mundialito?.contenders ?? <Contender>[],
        matches: mundialito?.matches ?? <Match>[],
        joinCode: mundialito?.joinCode ?? ""
    );
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