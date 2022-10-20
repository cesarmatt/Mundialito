import 'package:mundialito/app/models/contender/contender.dart';

class MatchFirebaseObject {
  MatchFirebaseObject(
      {required this.contenderH,
        required this.contenderA,
        required this.scoreContenderH,
        required this.scoreContenderA,
        required this.isFinished});

  String contenderH;
  String contenderA;
  int scoreContenderH = 0;
  int scoreContenderA = 0;
  bool isFinished = false;

  MatchFirebaseObject.fromJson(Map<String, Object?> json) : this(
    contenderH: json['contenderH']! as String,
    contenderA: json['contenderA']! as String,
    scoreContenderH: json['scoreContenderH']! as int,
    scoreContenderA: json['scoreContenderA']! as int,
    isFinished: json['isFinished']! as bool,
  );

  Map<String, Object?> toJson() {
    return {
      'contenderH': contenderH,
      'contenderA': contenderA,
      'scoreContenderH': scoreContenderH,
      'scoreContenderA': scoreContenderA,
      'isFinished': isFinished,
    };
  }
}
