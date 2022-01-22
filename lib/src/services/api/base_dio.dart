import 'package:dio/dio.dart';
import 'package:lolspy/src/constants/constants.dart';

import 'error_response.dart';

class BaseDio {
  static final BaseDio _singleton = BaseDio._internal();
  late Dio _dio;

  factory BaseDio() => _singleton;

  BaseDio._internal() {
    final BaseOptions baseOptions = BaseOptions(baseUrl: Constants.baseUrl);
    _dio = Dio(baseOptions);
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? querryParameter,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    final res = await _dio.get(
      path,
      queryParameters: querryParameter,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    if (res is! ErrorResponse) {
      return res;
    }
    throw res;
  }
}
