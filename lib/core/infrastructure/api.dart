import 'package:dio/dio.dart';

import '../utils/app_log.dart';
import 'api_services.dart';
import 'hive_database.dart';

class Api implements ApiServices {
  Api(
    this._dio,
    this._hiveDatabase,
  ) : super();

  final Dio _dio;
  final HiveDatabase _hiveDatabase;

  @override
  Future<(Response<T>?, DioException?)> getRequest<T>(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await _dio.get<T>(url, queryParameters: queryParameters);
      return (response, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      return (null, null);
    }
  }

  @override
  Future<(Response<T>?, DioException?)> getRequestWithToken<T>({required String url}) async {
    try {
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': '${_hiveDatabase.box.get(AppPreferenceKeys.token)}',
        'x-access-token': '${_hiveDatabase.box.get(AppPreferenceKeys.token)}'
      };
      AppLog.log(_hiveDatabase.box.get(AppPreferenceKeys.token));
      _dio.options.headers.addAll(headers);
      final returnResponse = await _dio.get<T>(url);
      return (returnResponse, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      AppLog.log(e.toString());

      return (null, null);
    }
  }

  @override
  Future<(Response<T>?, DioException?)> postRequest<T>({
    required String url,
    required Object? body,
  }) async {
    try {
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
      };

      _dio.options.headers.addAll(headers);

      final response = await _dio.post<T>(
        url,
        data: body,
      );

      return (response, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      return (null, null);
    }
  }

  // @override
  // Future<(Response<T>?, DioException?)> shopifyPostApiRequest({
  //   required String url,
  //   required Object? body,
  // }) async {
  //   try {
  //     var headers = {
  //       'Accept': '*/*',
  //       'Content-Type': 'application/json',
  //       'Access-Key': 'jH@k\$8L&2p!sZ#9y', // Add your Access-Key here
  //     };

  //     _dio.options.headers.addAll(headers);

  //     final response = await _dio.post(
  //       url,
  //       data: body,
  //     );

  //     return (response, null);
  //   } on DioException catch (e) {
  //     return (null, e);
  //   } catch (e) {
  //     return (null, null);
  //   }
  // }

  @override
  Future<(Response<T>?, DioException?)> postRequestWithToken<T>({
    required String url,
    Object? body,
  }) async {
    try {
      var headers = {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': '${_hiveDatabase.box.get(AppPreferenceKeys.token)}',
        'x-access-token': '${_hiveDatabase.box.get(AppPreferenceKeys.token)}'
      };

      _dio.options.headers.addAll(headers);
      final returnResponse = await _dio.post<T>(url, data: body);

      return (returnResponse, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      return (null, null);
    }
  }

  @override
  Future<(Response<T>?, DioException?)> deleteRequestWithToken<T>(
      {required String url, Object? body}) async {
    try {
      var headers = {
        'Accept': '*/*',
        'Authorization': '${_hiveDatabase.box.get(AppPreferenceKeys.token)}'
      };

      _dio.options.headers.addAll(headers);
      final returnResponse = await _dio.delete<T>(
        url,
        data: body,
      );

      return (returnResponse, null);
    } on DioException catch (e) {
      return (null, e);
    } catch (e) {
      return (null, null);
    }
  }
}
