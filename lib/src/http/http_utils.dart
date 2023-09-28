import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

mixin HttpUtils {
  static Future<List<int>?> downloadFile(
    String url, {
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      Response response = await Dio().get(
        url,
        onReceiveProgress: onReceiveProgress,
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status != null && status < 500;
            }),
      );
      return response.data;
    } catch (e) {
      debugPrint('@@ ${e.toString()}');
      return null;
    }
  }
}
