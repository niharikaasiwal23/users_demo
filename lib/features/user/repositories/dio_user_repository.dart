import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:users_list_demo/core/config/config.dart';
import 'package:users_list_demo/core/exceptions/failure.dart';
import 'package:users_list_demo/core/services/http/dio_http_service.dart';
import 'package:users_list_demo/core/services/http/http_service.dart';
import 'package:users_list_demo/features/user/db/user.dart';
import 'package:users_list_demo/features/user/models/user_response.dart';
import 'package:users_list_demo/features/user/repositories/user_repository.dart';

class DioUserRepository implements UserRepository {
  late final HttpService httpService;

  DioUserRepository() {
    httpService = DioHttpService();
  }

  @override
  String get basePath => Configs.apiBaseUrl;

  @override
  Future<Either<Failure, List<UserData>>> getUsers() async {
    final database = AppDatabase();
    bool internetAvailable = await checkInternetAvailability();

    if (internetAvailable) {
      var response = await httpService.get('$basePath/?results=100');
      Either<Failure, dynamic> eitherResponse = response.fold((l) => Left(l), (r) => Right(r.data));

      if (eitherResponse.isRight()) {
        UserResponse userResponse = UserResponse.fromJson(eitherResponse.getOrElse(() => null));

        await database.transaction(() async {
          await database.delete(database.user).go();
          for (var user in userResponse.results ?? []) {
            await database.into(database.user).insert(
              UserCompanion.insert(
                first: user.name?.first ?? '',
                last: user.name?.last ?? '',
                email: user.email ?? '',
                gender: user.gender ?? '',
                cell: user.cell ?? '',
                picture: user.picture?.thumbnail ?? '',
              ),
            );
          }
        });
      }
    }

    List<UserData> users = await database.select(database.user).get();
    return Right(users);
  }

  @override
  Future<Either<Failure, List<UserData>>> getLocalUsers() async {
    final database = AppDatabase();
    List<UserData> users = await database.select(database.user).get();
    return Right(users);
  }

  Future<bool> checkInternetAvailability() async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();

      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Error checking internet availability: $e');
      return false;
    }
  }
}