import 'package:cuban_recipes/networking/error_handling.dart';
import 'package:cuban_recipes/networking/failure.dart';
import 'package:dio/dio.dart';
import '../common/widgets/toast_message.dart';

class ErrorInterceptor extends Interceptor {
  final CustomToastMessage _toastMessage;

  ErrorInterceptor(this._toastMessage);
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response != null) {
      Failure failhttp = ErrorHandler.handle(err).failure;
      print('Erro HTTP ${failhttp.message}');
      _toastMessage.showCustomFailureToast(failhttp);
    } else {
      Failure failNetwork = DataSource.NO_INTERNET_CONNECTION.getFailure();
      _toastMessage.showCustomFailureToast(failNetwork);
      print('Erro de rede: ${failNetwork.message}');
    }

    handler.next(err);
  }
}
