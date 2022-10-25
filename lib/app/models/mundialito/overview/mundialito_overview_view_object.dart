import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/models/match/match.dart';

class MundialitoOverviewViewObject {
  MundialitoOverviewViewObject(
      {required this.mundialitoTile,
      required this.mundialitoDate,
      required this.numberOfContenders,
      required this.matches});

  final String mundialitoTile;
  final Timestamp mundialitoDate;
  final int numberOfContenders;
  final List<Match> matches;
}
