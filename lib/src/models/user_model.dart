import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}
