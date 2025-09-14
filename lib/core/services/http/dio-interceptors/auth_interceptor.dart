import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../config/config.dart';

final authInterceptorProvider = Provider<AuthInterceptor>((ref) {
  return AuthInterceptor(ref);
});

class AuthInterceptor implements Interceptor {
  AuthInterceptor(this.ref);

  final Ref ref;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      print('Unauthorized access to TMDB API');
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    options.queryParameters['api_key'] = Config.apiKey;
    
    if (options.headers['Authorization'] == null) {
      options.headers['Authorization'] = 'Bearer ${Config.accessToken}';
    }
    
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}