import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mundialito/app/models/contender/contender.dart';
import 'package:mundialito/app/models/match/match_factory.dart';

void main() {
  late final MatchFactory sut;
  final contenderMock = Contender("Contender");

  setUpAll(() {
    sut = MatchFactory();
  });

  test("When contenders list size equals to 10 shuffledFromContenderList method should return a match list with size 5", () {
    var contendersList = List.generate(10, (index) => contenderMock);
    var matchList = sut.shuffledFromContenderList(contendersList);

    expect(matchList.length, 5);
  });

  test("When contenders list size equals to 11 shuffledFromContenderList method should return an empty list", () {
    var contendersList = List.generate(11, (index) => contenderMock);
    var matchList = sut.shuffledFromContenderList(contendersList);

    expect(matchList.length, 0);
  });
}
