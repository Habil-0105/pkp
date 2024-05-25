import 'package:dio/dio.dart';
import 'package:pkp/shared/utils/helpers/logger.dart';

class LoggingInterceptor extends QueuedInterceptor {
  final bool requestBody;
  final bool requestHeader;
  final bool responseBody;
  final bool error;

  LoggingInterceptor({
    this.requestHeader = true,
    this.requestBody = false,
    this.responseBody = false,
    this.error = true,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.info('', header: 'DIO REQUEST');
    Logger.info(
      "${options.method} ${options.baseUrl + options.path}",
      tag: 'METHOD  ',
    );

    if (requestHeader) {
      options.headers.forEach((key, value) {
        Logger.info(
          "${key.toUpperCase()}: $value",
          tag: 'HEADERS ',
        );
      });

      if (options.queryParameters.isNotEmpty) {
        options.queryParameters.forEach((key, value) {
          Logger.info(
            "$key: $value",
            tag: 'PARAMS  ',
          );
        });
      }
    }

    if (requestBody) {
      if (options.data != null && options.data.isNotEmpty) {
        options.data.forEach((key, value) {
          Logger.info(
            "$key: $value",
            tag: 'DATA    ',
          );
        });
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.succes('sd', header: 'DIO RESPONSE');

    Logger.succes(
      "${response.statusCode}",
      tag: 'CODE    ',
    );

    Logger.succes(
      '${response.statusMessage}',
      tag: 'MESSAGE ',
    );

    if (responseBody) {
      if (response.data.isNotEmpty) {
        Logger.succes(
          response.data,
          tag: 'DATA    ',
        );
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (error) {
      Logger.error(header: 'DIO ERROR');

      Logger.error(
        tag: 'METHOD  ',
        error:
        "${err.requestOptions.method} ${err.requestOptions.baseUrl + err.requestOptions.path}",
      );

      Logger.error(
        tag: 'CODE    ',
        error: '${err.response?.statusCode}',
      );

      Logger.error(
        tag: 'TYPE    ',
        error: '${err.type}',
      );

      Logger.error(
        tag: 'MESSAGE ',
        error: '${err.response?.statusMessage}',
      );

      if (err.response?.data != null && err.response?.data is Map) {
        Logger.error(
          tag: 'DATA    ',
          error: '${err.response?.data}',
        );
      }
    }

    super.onError(err, handler);
  }
}