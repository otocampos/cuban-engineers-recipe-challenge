import 'package:cuban_recipes/networking/error_handling.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('ErrorHandler handle non-DioException', () {
    final nonDioException = Exception('Non-DioException');

    final errorHandler = ErrorHandler.handle(nonDioException);

    expect(errorHandler.failure.code, DataSource.DEFAULT.getFailure().code);
    expect(errorHandler.failure.message, DataSource.DEFAULT.getFailure().message);
  });

  test('DataSourceExtension getFailure', () {
    final failure = DataSource.SUCCESS.getFailure();

    expect(failure.code, ResponseCode.SUCCESS);
    expect(failure.message, ResponseMessage.SUCCESS);
  });

  // Adicione mais testes para DataSourceExtension getFailure com outras enumerações

  test('ResponseCode constants', () {
    expect(ResponseCode.SUCCESS, 200);
    expect(ResponseCode.BAD_REQUEST, 400);
    // Adicione mais testes para outras constantes de ResponseCode
  });

  test('ResponseMessage constants', () {
    expect(ResponseMessage.SUCCESS, 'success');
    expect(ResponseMessage.BAD_REQUEST, 'bad_request_error');
    // Adicione mais testes para outras constantes de ResponseMessage
  });
  test('ErrorHandler handle DioException with unspecified error', () {
    final dioException = DioException(
      requestOptions: RequestOptions(path: '/api/endpoint'),
      error: 'Unspecified Error', // Simula um erro não especificado
    );

    final errorHandler = ErrorHandler.handle(dioException);

    expect(errorHandler.failure.code, DataSource.DEFAULT.getFailure().code);
    expect(errorHandler.failure.message, DataSource.DEFAULT.getFailure().message);
  });
}