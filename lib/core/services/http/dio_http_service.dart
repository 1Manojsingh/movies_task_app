import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../config/config.dart';
import '../../exceptions/failure.dart';
import '../../model/server_response.dart';
import 'dio-interceptors/auth_interceptor.dart';
import 'http_service.dart';

final dioHttpServiceProvider = Provider<DioHttpService>((ref) {
  return DioHttpService(ref);
});

class DioHttpService implements HttpService {
  late final Dio apiClient;
  final Ref ref;

  DioHttpService(this.ref) {
    initialize();
  }

  @override
  String get baseUrl => Config.apiBaseUrl;

  @override
  Map<String, String> headers = {
    'accept': 'application/json',
    'content-type': 'application/json'
  };

  BaseOptions get baseOptions =>
      BaseOptions(baseUrl: baseUrl, headers: headers);

  Failure handleError(dynamic data) {
    if (data is Map) {
      if (data['error'] is String) {
        return Failure(data[ 'error'], 1);
      }
      if (data['detail'] is String) {
        return Failure( data['detail'], 1);
      }

      if (data['detail'] is List) {
        final err = (data['detail'] as List).firstOrNull;
        if (err != null) {
          return Failure(err['msg'], 1);
        }
      }
      
      if (data['message'] is String) {
        return Failure(data['message'], 1);
      }
    }
    return const Failure( "Something went wrong",1);
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
    apiClient.interceptors.add(ref.read(authInterceptorProvider));
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
    } on DioError catch (error) {
      return Left(handleError(error.response?.data));
    } catch (error) {
      return Left(handleError(error));
    }
  }

  @override
  Future<Either<Failure, ServerResponse>> post({
    required String url,
    Object? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await apiClient.post(url,
          data: data,
          queryParameters: queryParameters,
          options: Options(headers: headers));
      return Right(ServerResponse(
          status: true,
          data: response.data,
          responseHeaders: response.headers));
    } on DioError catch (error) {
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
    } on DioError catch (error) {
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
    } on DioError catch (error) {
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
    } on DioError catch (error) {
      return Left(handleError(error.response?.data));
    } catch (error) {
      return Left(handleError(error));
    }
  }

  @override
  Future<Either<Failure, ResponseBody>> streamGet(String url,
      {Map<String, dynamic>? headers, CancelToken? cancelToken}) async {
    try {
      final res = await apiClient.get<ResponseBody>(
        url,
        cancelToken: cancelToken,
        options: Options(
          headers: {
            "Accept": "text/event-stream",
            "Cache-Control": "no-cache",
          },
          responseType: ResponseType.stream,
        ),
      );

      return Right(res.data!);
    } on DioError catch (error) {
      throw Left(handleError(error.response?.data));
    } catch (error) {
      throw Left(handleError(error));
    }
  }
}
