import 'package:BlueGame/src/constants/enums.dart';
import 'package:BlueGame/src/models/models.dart';
import 'package:equatable/equatable.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.authStatus = AuthenticationStatus.unknown,
    this.user,
  });

  final AuthenticationStatus authStatus;
  final User user;

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authLogin(User user)
      : this._(authStatus: AuthenticationStatus.authLogin, user: user);

  const AuthenticationState.unauthenticated()
      : this._(authStatus: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [authStatus, user];
}
