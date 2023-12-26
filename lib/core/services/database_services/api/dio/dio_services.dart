import 'package:dio/dio.dart';

import '../../../../errors/server_exceptions.dart';
import '../api_services.dart';

class DioServices extends ApiServices {
  final Dio dio;

  DioServices(this.dio);

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      throw ServerExceptions.handle(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final res = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      throw ServerExceptions.handle(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      throw ServerExceptions.handle(e);
    }
  }

  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } catch (e) {
      throw ServerExceptions.handle(e);
    }
  }
}
