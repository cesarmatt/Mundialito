import '../contender/contender.dart';
import '../match/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Mundialito {
  Mundialito(this.name, this.startDate, this.endDate, this.contenders,
      this.owner, this.matches, this.isCompleted);

  String name;
  Timestamp startDate;
  Timestamp? endDate;
  List<Contender> contenders;
  Contender owner;
  List<Match> matches;
  bool isCompleted;
}
