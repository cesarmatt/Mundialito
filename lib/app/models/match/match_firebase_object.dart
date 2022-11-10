import 'package:mundialito/app/models/contender/contender.dart';

class MatchFirebaseObject {
  MatchFirebaseObject({required this.matchIdentifier,
    required this.contenderH,
    required this.contenderA,
    required this.scoreContenderH,
    required this.scoreContenderA,
    required this.isFinished,
    required this.cameFrom});

  int matchIdentifier;
  String contenderH;
  String contenderA;
  int scoreContenderH = 0;
  int scoreContenderA = 0;
  bool isFinished = false;
  List<dynamic> cameFrom;

  MatchFirebaseObject.fromJson(Map<String, Object?> json)
      : this(
      matchIdentifier: json['matchIdentifier']! as int,
      contenderH: json['contenderH']! as String,
      contenderA: json['contenderA']! as String,
      scoreContenderH: json['scoreContenderH']! as int,
      scoreContenderA: json['scoreContenderA']! as int,
      isFinished: json['isFinished']! as bool,
      cameFrom: json['cameFrom']! as List<dynamic>,
  );

  Map<String, Object?> toJson() {
    return {
      'matchIdentifier': matchIdentifier,
      'contenderH': contenderH,
      'contenderA': contenderA,
      'scoreContenderH': scoreContenderH,
      'scoreContenderA': scoreContenderA,
      'isFinished': isFinished,
      'cameFrom': cameFrom
    };
  }
}
