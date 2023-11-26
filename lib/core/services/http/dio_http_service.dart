import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../exceptions/failure.dart';
import '../../model/server_response.dart';
import 'http_service.dart';

class DioHttpService implements HttpService {
  late final Dio apiClient;

  DioHttpService() {
    initialize();
  }

  @override
  String get baseUrl => '';

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  BaseOptions get baseOptions =>
      BaseOptions(baseUrl: baseUrl, headers: headers);

  Failure handleError(dynamic data) {
    if (data is Map) {
      if (data['message'] is String) {
        return Failure(1, 1, data['message']);
      }

      // final err = (data['detail'] as List).firstOrNull;
      // if (err != null) {
      //   return Failure(1, 1, err['msg']);
      // }
    }
    return const Failure(1, 1, "Something went wrong");
  }

  void initialize() {
    apiClient = Dio(baseOptions);

    if (kDebugMode) {
      apiClient.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ));
    }
  }

  @override
  Future<Either<Failure, ServerResponse>> get(
    String url, {
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await apiClient.get(url,
          queryParameters: queryParams, options: Options(headers: headers));
      return Right(ServerResponse(
          status: true,
          data: response.data,
          responseHeaders: response.headers));
    } on DioException catch (error, st) {
      print("ERROR::::::::: $error $st");
      return Left(handleError(error.response?.data));
    } catch (error, st) {
      print("ERROR::::::::: $error $st");
      return Left(handleError(error));
    }
  }

  @override
  Future<Either<Failure, ServerResponse>> post({
    required String url,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await apiClient.post(url,
          data: data, options: Options(headers: headers));
      return Right(ServerResponse(
          status: true,
          data: response.data,
          responseHeaders: response.headers));
    } on DioException catch (error) {
      return Left(handleError(error.response?.data));
    } catch (error) {
      return Left(handleError(error));
    }
  }

  @override
  Future<Either<Failure, ServerResponse>> patch({
    required String url,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await apiClient.patch(url,
          data: data, options: Options(headers: headers));
      return Right(ServerResponse(
          status: true,
          data: response.data,
          responseHeaders: response.headers));
    } on DioException catch (error) {
      return Left(handleError(error.response?.data));
    } catch (error) {
      return Left(handleError(error));
    }
  }

  @override
  Future<Either<Failure, ServerResponse>> put({
    required String url,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await apiClient.put(url,
          data: data, options: Options(headers: headers));
      return Right(ServerResponse(
          status: true,
          data: response.data,
          responseHeaders: response.headers));
    } on DioException catch (error) {
      return Left(handleError(error.response?.data));
    } catch (error) {
      return Left(handleError(error));
    }
  }

  @override
  Future<Either<Failure, ServerResponse>> delete(
    String url, {
    Object? body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final Response response = await apiClient.delete(url,
          data: body, options: Options(headers: headers));
      if (response.statusCode == 204) {
        return Right(ServerResponse(status: true, data: {}));
      } else {
        return Right(ServerResponse(status: false, data: response.data ?? {}));
      }
    } on DioException catch (error) {
      throw Left(handleError(error.response?.data));
    } catch (error) {
      throw Left(handleError(error));
    }
  }
}
