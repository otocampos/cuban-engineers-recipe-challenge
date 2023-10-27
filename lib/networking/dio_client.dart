import 'package:cuban_recipes/common/widgets/toast_message.dart';
import 'package:cuban_recipes/networking/error_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../constants/url_endpoints.dart';

class DioClient {
  final Dio _dio;
  final CustomToastMessage _toastMessage;

  ///To api requests works is needed to configure api key in enviroment flutter run --dart-define spoon-api=YOUR_API_KEY
  DioClient(this._toastMessage)
      : _dio = Dio()
          ..interceptors.addAll([
            PrettyDioLogger(
                requestBody: true,
                responseBody: false,
                error: true,
                compact: true,
                maxWidth: 90),
            DioCacheInterceptor(
              options: CacheOptions(
                store: MemCacheStore(),
                policy: CachePolicy.refreshForceCache,
                hitCacheOnErrorExcept: [],
                maxStale: const Duration(
                  seconds: 15,
                ),
                //increase number of days for loger cache
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
