import 'package:mundialito/app/models/contender/contender.dart';

class Match {
  Match(this.contenderH, this.contenderA, this.scoreContenderH,
      this.scoreContenderA, this.isFinished);

  Contender contenderH;
  Contender contenderA;
  int scoreContenderH = 0;
  int scoreContenderA = 0;
  bool isFinished = false;
}
