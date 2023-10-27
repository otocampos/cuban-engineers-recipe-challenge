import 'package:cuban_recipes/di/di.dart';
import 'package:cuban_recipes/networking/error_handling.dart';
import 'package:cuban_recipes/networking/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../common/app_context.dart';
import '../common/widgets/toast_message.dart';
import '../common/widgets/toast_message_impl.dart';

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
