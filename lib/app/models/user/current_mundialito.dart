class CurrentMundialito {

  late String joinCode = "";

  static final CurrentMundialito _currentMundialito = CurrentMundialito._internal();

  CurrentMundialito._internal();

  factory CurrentMundialito({required String joinCode}) {
    _currentMundialito.joinCode = joinCode;
    return _currentMundialito;
  }

  static CurrentMundialito getCurrentMundialito() {
    return _currentMundialito;
  }
}