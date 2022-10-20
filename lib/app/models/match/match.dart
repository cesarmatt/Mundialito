import 'package:mundialito/app/models/contender/contender.dart';

class Match {
  Match(
      {required this.contenderH,
      required this.contenderA,
      required this.scoreContenderH,
      required this.scoreContenderA,
      required this.isFinished});

  Contender contenderH;
  Contender contenderA;
  int scoreContenderH = 0;
  int scoreContenderA = 0;
  bool isFinished = false;

  Match.fromJson(Map<String, Object?> json) : this(
      contenderH: json['contenderH']! as Contender,
      contenderA: json['contenderA']! as Contender,
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
