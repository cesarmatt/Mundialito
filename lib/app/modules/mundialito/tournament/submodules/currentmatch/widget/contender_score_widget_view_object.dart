import 'package:mundialito/app/models/match/match.dart';

class ContenderScoreWidgetViewObject {
  ContenderScoreWidgetViewObject(
      {required this.onHomeContenderScoreUpdated,
      required this.onAwayContenderScoreUpdated,
      required this.match,
      required this.isReadOnly});

  final void Function(int) onHomeContenderScoreUpdated;
  final void Function(int) onAwayContenderScoreUpdated;
  final Match match;
  final bool isReadOnly;
}
