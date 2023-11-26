import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_list_demo/core/theme/app_theme.dart';
import 'package:users_list_demo/features/user/repositories/dio_user_repository.dart';
import 'package:users_list_demo/features/user/views/user_listing_screen.dart';
import 'bloc/user/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserBloc(DioUserRepository()),
        child: MaterialApp(
            title: 'User App',
            theme: AppTheme.appTheme,
            home: const UserListingScreen()
        )
    );
  }
}
