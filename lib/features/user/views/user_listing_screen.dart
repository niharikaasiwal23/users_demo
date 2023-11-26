import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list_demo/bloc/user/user_bloc.dart';
import 'package:users_list_demo/features/user/db/user.dart';
import 'package:users_list_demo/features/user/widgets/user_card.dart';

class UserListingScreen extends StatefulWidget {
  const UserListingScreen({super.key});

  @override
  UserListingScreenState createState() => UserListingScreenState();
}

class UserListingScreenState extends State<UserListingScreen> {
  List<UserData> users = [];

  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = BlocProvider.of<UserBloc>(context);
    loadUsers();
  }

  Future<void> loadUsers() async {
    userBloc.add(LoadLocalUsersEvent());
    userBloc.add(LoadUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is LoadingUsersState) {
            return _buildLoadingIndicator();
          } else if (state is LocalUsersLoadedState) {
            if (state.users.isNotEmpty) {
              users = state.users.toList();
            }
            return _buildUserList(users);
          } else if (state is UsersLoadedState) {
            if (state.users.isNotEmpty) {
              users = state.users.toList();
            }
            return _buildUserList(users);
          } else if (state is UserErrorState) {
            return _buildErrorWidget(state.error);
          }
          return _buildLoadingIndicator();
        },
      ),
    );
  }

  Widget _buildUserList(List<UserData> userList) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
            return UserCard(userData: user);
        },
      );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorWidget(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
