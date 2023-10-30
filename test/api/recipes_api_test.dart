import 'package:cuban_recipes/mocks/mock_recipes.dart';
import 'package:cuban_recipes/constants/url_endpoints.dart';
import 'package:cuban_recipes/di/di.dart';

import 'package:cuban_recipes/networking/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  initAppModule();
  late DioAdapter dioAdapter;
  Response<dynamic> response;
  final instance = GetIt.instance;
  final dio = instance<DioClient>().dio;
  group('recipes', () {
    setUp(() {

      dioAdapter = DioAdapter(
        dio: dio,
        matcher: const FullHttpRequestMatcher(),
      );
    });
    test('Recipes Service MOCK API Test', () async {
      const recipesRoute = UrlEndpoints.LIST_RANDOM_RECIPES;
      dioAdapter
        ..onGet(
          recipesRoute,
          (server) => server.reply(200, mockRecipesJson),
        );
      response = await dio.get(
        recipesRoute
      );
      expect(response.data, mockRecipesJson);
    });
  });
}
