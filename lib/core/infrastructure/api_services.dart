import 'package:dio/dio.dart';

abstract class ApiServices {
  Future<(Response<T>?, DioException?)> getRequest<T>({required String url});
  Future<(Response<T>?, DioException?)> getRequestWithToken<T>({required String url});
  Future<(Response<T>?, DioException?)> postRequest<T>(
      {required String url, required Object? body});
  Future<(Response<T>?, DioException?)> postRequestWithToken<T>(
      {required String url, Object? body});
  Future<(Response<T>?, DioException?)> deleteRequestWithToken<T>(
      {required String url, Object? body});
}
