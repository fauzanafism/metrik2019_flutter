part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  final User? user;
  const UserEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class LoginEvent extends UserEvent {
  LoginEvent(User user) : super(user);
}
