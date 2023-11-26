import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list_demo/features/user/db/user.dart';
import 'package:users_list_demo/features/user/models/user_response.dart';
import 'package:users_list_demo/features/user/repositories/user_repository.dart';
import 'package:users_list_demo/features/user/widgets/user_card.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(LoadingUsersState()) {
    on<LoadUsersEvent>(loadUsers);
    on<LoadLocalUsersEvent>(loadLocalUsers);
  }

  Future<void> loadUsers(LoadUsersEvent event, Emitter<UserState> emit) async {
    emit(LoadingUsersState());
    try {
      final res = await userRepository.getUsers();
      List<UserData> users = [];
      res.fold((l) => Left(l), (r) {
        users = r;
      });
      emit(UsersLoadedState(users: users));
    } catch (e, st) {
      debugPrint('$e, $st');
      emit(UserErrorState("error"));
    }
  }

  Future<void> loadLocalUsers(LoadLocalUsersEvent event, Emitter<UserState> emit) async {
    emit(LoadingUsersState());
    try {
      final res = await userRepository.getLocalUsers();
      List<UserData> users = [];
      res.fold((l) => Left(l), (r) {
        users = r;
      });
      emit(UsersLoadedState(users: users));
    } catch (e, st) {
      debugPrint('$e, $st');
      emit(UserErrorState("error"));
    }
  }
}
