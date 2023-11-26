import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:users_list_demo/core/exceptions/failure.dart';
import 'package:users_list_demo/features/user/db/user.dart';

abstract class UserRepository {
  String get basePath;

  Future<Either<Failure, List<UserData>>> getUsers();

  Future<Either<Failure, List<UserData>>> getLocalUsers();
}