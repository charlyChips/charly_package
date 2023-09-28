import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'base_response_bean.dart';

class HttpManager {
  HttpManager() {
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(requestBody: true));
    }
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          options.headers[authorizationHeader] =
              token != null ? '$bearerPrefix $token' : null;
          return handler.next(options);
        },
      ),
    );
  }

  final Dio _dio = Dio();
  final authorizationHeader = 'Authorization';
  final bearerPrefix = 'Bearer';

  String? token;
  void Function(HttpManager http)? onUnauthorized;

  Future<HttpResponse> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) {
    return _resolve(
      () => _dio.get(path,
          queryParameters: queryParams,
          data: data,
          options: Options(headers: {..._dio.options.headers, ...?headers})),
    );
  }

  Future<HttpResponse> post(String path,
      {Object? body,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _resolve(
      () => _dio.post(path,
          data: body,
          queryParameters: queryParams,
          options: Options(headers: {
            ..._dio.options.headers,
            ...?headers,
          })),
    );
  }

  Future<HttpResponse> put(String path,
      {Object? body,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? headers}) {
    return _resolve(
      () => _dio.put(path,
          data: body,
          queryParameters: queryParams,
          options: Options(headers: {
            ..._dio.options.headers,
            ...?headers,
          })),
    );
  }

  Future<HttpResponse> delete(String path,
      {Map<String, dynamic>? queryParams}) {
    return _resolve(
      () => _dio.delete(
        path,
        queryParameters: queryParams,
      ),
    );
  }

  Future<HttpResponse> _resolve(
      Future<Response<dynamic>> Function() jobRequest) async {
    try {
      final response = await jobRequest();
      return HttpResponse(
        response.statusCode ?? 0,
        data: response.data,
      );
    } catch (e) {
      if (e is SocketException) {
        throw 'Revisa tu conexión a internet e intenta de nuevo';
      }
      if (e is DioException) {
        if (e.response?.statusCode == 401 && onUnauthorized != null) {
          onUnauthorized?.call(this);
        }
        final headerMessage = e.response?.data?['header']?['message'];
        if (headerMessage != null) {
          throw headerMessage;
        }
      }
      rethrow;
    }
  }
}

typedef HttpMapper<T> = T Function(dynamic);

class HttpResponse {
  final int statusCode;
  final dynamic data;

  HttpResponse(this.statusCode, {required this.data});
}

extension HttpHandler on Future<HttpResponse> {
  Stream<T> handle<T>({required HttpMapper<T> mapper}) async* {
    final response = await this;
    if (response.statusCode >= 200 && response.statusCode < 300) {
      final baseBean = BaseResponseBean.fromJson(response.data);
      final T data = mapper.call(baseBean.data);
      yield data;
    }
  }
}
