import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../utils/app_strings.dart';
import '../../../utils/service_locator.dart';
import '../cache/cache_services.dart';
import 'api_end_points.dart';

Dio initDio() {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );
  dio.options.baseUrl = ApiEndPoints.baseUrl;
  dio.interceptors.add(_ApiInterceptors());
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: true,
    responseHeader: true,
    responseBody: true,
    error: true,
  ));
  return dio;
}

class _ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log("Request Path: ${options.path}");
    log("Request Data: ${options.data}");
    log("Request Query Parameters: ${options.queryParameters}");
    options.queryParameters[AppStrings.apiToken] =
        getIt<CacheServices>().getData(key: AppStrings.apiToken);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log("Response Data: ${response.data}");
    log("Response Headers: ${response.headers}");
    log("Response Status Code: ${response.statusCode}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("Error Message: ${err.message}");
    log("Error Response: ${err.response}");
    super.onError(err, handler);
  }
}
