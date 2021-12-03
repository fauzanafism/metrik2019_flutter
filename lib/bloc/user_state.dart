part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  final User? user;
  const UserState(this.user);

  @override
  List<Object?> get props => [user];
}

class UserInitial extends UserState {
  UserInitial() : super(null);
}

class UserInitialized extends UserState {
  UserInitialized(User user) : super(user);
}
