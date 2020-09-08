import 'package:BlueGame/src/helpers/secure_storage.dart';
import 'package:BlueGame/src/models/models.dart';

class UserRepository {
  User _user;

  // here we get the hardCoded values now from the
  // 9898989898 / 9876543210
  // this value only valid user not other for this app

  Future<User> getUser() async {
    final _secureStorage = SecureStorage();
    final isLoginUser = await _secureStorage.getSecureStorageKey('user');
    _user = User(isLoginUser);
    if (_user != null) return _user;

    return Future.delayed(
      Duration(microseconds: 400),
      () => _user = User(''),
    );
  }
}
