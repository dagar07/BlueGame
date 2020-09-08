import 'package:BlueGame/src/Screens/Login/bloc/login_event.dart';
import 'package:BlueGame/src/Screens/Login/bloc/login_state.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/bloc.dart';
import 'package:BlueGame/src/bloc/authentication_bloc/event.dart';
import 'package:BlueGame/src/constants/enums.dart';
import 'package:BlueGame/src/repository/authentication/index.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    this.authenticationBloc,
    this.authenticationRepository,
  }) : super(null);

  // add as per your requirements;
  // this is maintaines user specific data;
  final AuthenticationRepository authenticationRepository;
  final AuthenticateBloc authenticationBloc;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final userLogedIn = await authenticationRepository.logIn(
          username: event.username,
          password: event.password,
        );
        if (userLogedIn['login'] == 'success') {
          authenticationBloc.add(
            AuthenticationStatusChanges(AuthenticationStatus.authLogin),
          );
          yield LoginInitiateState();
        } else {
          yield LoginFailure(error: 'User is  Unauthrised');
        }
      } catch (e) {}
    }
  }
}
