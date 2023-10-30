import 'package:cuban_recipes/common/widgets/toast_message.dart';
import 'package:cuban_recipes/networking/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import '../constants/url_endpoints.dart';
class DioClient {
  final Dio _dio;
  final CustomToastMessage _toastMessage;
  DioClient(this._toastMessage)
      : _dio = Dio()
          ..interceptors.addAll([
            DioCacheInterceptor(
              options: CacheOptions(
                store: MemCacheStore(),
                policy: CachePolicy.refreshForceCache,
                hitCacheOnErrorExcept: [],
                maxStale: const Duration(
                  seconds: 15,
                ),
                priority: CachePriority.high,
              ),
            ),
            ErrorInterceptor(_toastMessage)
          ]) {
    String teste = const String.fromEnvironment("spoon-api");
    _dio.options = BaseOptions(
      baseUrl: UrlEndpoints.BASE_URL,
      queryParameters: {"apiKey": teste},
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      connectTimeout: const Duration(seconds: 15),

    );
  }

  Dio get dio => _dio;
}
