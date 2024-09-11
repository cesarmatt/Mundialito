import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/models/mundialito/overview/table/result_for_contender.dart';
import 'package:mundialito/app/models/match/match.dart';

class EndedResultViewObject {
  EndedResultViewObject(
      {required this.mundialitoName,
      required this.endDate,
      required this.podium,
      required this.results});

  String mundialitoName;
  Timestamp endDate;
  List<ResultForContender> podium;
  List<Match> results;
}
