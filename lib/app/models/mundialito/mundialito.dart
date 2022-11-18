import '../contender/contender.dart';
import '../match/match.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Mundialito {
  Mundialito(
      {required this.name,
      required this.startDate,
      required this.contenders,
      required this.owner,
      required this.matches,
      required this.isCompleted,
      required this.joinCode,
      this.endDate,
      this.uid});

  String? uid = "";
  String name;
  Timestamp startDate;
  Timestamp? endDate;
  List<Contender> contenders;
  String owner;
  List<Match> matches;
  bool isCompleted;
  String joinCode;

  Mundialito.fromJson(Map<String, Object?> json)
      : this(
            uid: json['uid']! as String,
            name: json['name']! as String,
            startDate: json['startDate']! as Timestamp,
            endDate: json['endDate']! as Timestamp?,
            contenders: json['contenders']! as List<Contender>,
            owner: json['owner']! as String,
            matches: json['matches']! as List<Match>,
            isCompleted: json['isCompleted']! as bool,
            joinCode: json['joinCode']! as String);

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'name': name,
      'startDate': startDate,
      'endDate': endDate,
      'contenders': contenders,
      'owner': owner,
      'matches': matches,
      'isCompleted': isCompleted,
      'joinCode': joinCode,
    };
  }
}
