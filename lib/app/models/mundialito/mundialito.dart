import '../contender/contender.dart';
import '../match/match.dart';

class Mundialito {
  Mundialito(this.name, this.startDate, this.endDate, this.contenders,
      this.owner, this.matches);

  String name;
  String startDate;
  String? endDate;
  List<Contender> contenders;
  Contender owner;
  List<Match> matches;
}
