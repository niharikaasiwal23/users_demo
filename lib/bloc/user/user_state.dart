part of 'user_bloc.dart';

abstract class UserState {}

class LoadingUsersState extends UserState {}

class UsersLoadedState extends UserState {
  final List<UserData> users;

  UsersLoadedState({required this.users});
}

class LocalUsersLoadedState extends UserState {
  final List<UserData> users;

  LocalUsersLoadedState({required this.users});
}

class UserErrorState extends UserState {
  final String error;
  UserErrorState(this.error);
}
