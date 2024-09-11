class CurrentUser {

  late String name = "";
  late String email = "";
  late String uid = "";

  static final CurrentUser _currentUser = CurrentUser._internal();

  CurrentUser._internal();

  factory CurrentUser({required String name, required String email, required String uid}) {
    _currentUser.name = name;
    _currentUser.email = email;
    _currentUser.uid = uid;
    return _currentUser;
  }

  static CurrentUser getCurrentUser() {
    return _currentUser;
  }
}