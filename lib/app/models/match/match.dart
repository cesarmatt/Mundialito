import 'package:mundialito/app/models/contender/contender.dart';

class Match {
  Match(
      {required this.contenderH,
      required this.contenderA,
      required this.scoreContenderH,
      required this.scoreContenderA,
      required this.isFinished,
      this.uid});

  String? uid = "";
  String contenderH;
  String contenderA;
  int scoreContenderH = 0;
  int scoreContenderA = 0;
  bool isFinished = false;

  Match.fromJson(Map<String, Object?> json)
      : this(
          uid: json['uid']! as String,
          contenderH: json['contenderH']! as String,
          contenderA: json['contenderA']! as String,
          scoreContenderH: json['scoreContenderH']! as int,
          scoreContenderA: json['scoreContenderA']! as int,
          isFinished: json['isFinished']! as bool,
        );

  Map<String, Object?> toJson() {
    return {
      'uid': uid,
      'contenderH': contenderH,
      'contenderA': contenderA,
      'scoreContenderH': scoreContenderH,
      'scoreContenderA': scoreContenderA,
      'isFinished': isFinished,
    };
  }
}
