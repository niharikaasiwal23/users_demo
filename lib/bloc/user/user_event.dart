part of 'user_bloc.dart';

abstract class UserEvent {}

class LoadUsersEvent extends UserEvent {}

class LoadLocalUsersEvent extends UserEvent {}