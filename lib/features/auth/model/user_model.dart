class UserModel {
  static final UserModel _instance = UserModel._internal();

  String phoneNumber = '';

  factory UserModel() {
    return _instance;
  }

  UserModel._internal();
}
