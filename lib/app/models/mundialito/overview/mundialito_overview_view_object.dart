import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/match/match.dart';

class MundialitoOverviewViewObject {
  MundialitoOverviewViewObject(
      {required this.mundialitoTile,
      required this.mundialitoDate,
      required this.contenders,
      required this.matches,
      required this.joinCode});

  final String mundialitoTile;
  final Timestamp mundialitoDate;
  final List<Contender> contenders;
  final List<Match> matches;
  final String joinCode;
}
