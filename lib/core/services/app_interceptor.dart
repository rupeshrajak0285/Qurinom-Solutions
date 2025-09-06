
import '../../common_libraries.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppInterceptor extends Interceptor {
  Dio dio;

  AppInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) async {
    // ✅ Check connectivity first
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // Reject request if no connection
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.unknown,
          error: 'No internet connection',
        ),
      );
    }

/*    // ✅ Add auth headers
    String accessToken = Prefs.accessToken.get();

    if (accessToken.isNotEmpty) {
      options.headers['authorization'] = 'Bearer $accessToken';
      options.headers['accept'] = 'application/json,text/plain';
      options.headers['connection'] = 'keep-alive';
      options.headers['content-type'] = Headers.jsonContentType;
    }*/

    // ✅ Debug log
    if (kDebugMode) {
      debugPrint("++++++++++++++++++++++++++++++++++++++++++++++");
      debugPrint("API URL: ${options.baseUrl}${options.path}");
      if (options.method == "GET") {
        debugPrint("API Request Query parameters: ${options.queryParameters}");
      } else {
        debugPrint("API Request: ${options.data}");
      }
      debugPrint("API Request Method: ${options.method}");
      debugPrint("API Request Header: ${options.headers}");
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      var encoder = const JsonEncoder.withIndent("   ");
      debugPrint("API Response: ${encoder.convert(response.data)}");
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint("API Error Data: ${err.response?.data}");
      debugPrint("API Error HTTP Code: ${err.response?.statusCode}");
    }

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadLineExceededException(
          requestOptions: err.requestOptions,
          response: err.response,
        );

      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(
              requestOptions: err.requestOptions,
              response: err.response,
            );
          case 401:
            throw UnauthorizedException(
              requestOptions: err.requestOptions,
              response: err.response,
            );
          case 404:
            throw NotFoundException(
              requestOptions: err.requestOptions,
              response: err.response,
            );
          case 500:
            throw InternalServerErrorException(
              requestOptions: err.requestOptions,
              response: err.response,
            );
          default:
            throw ServerErrorException(
              requestOptions: err.requestOptions,
              response: err.response,
            );
        }

      case DioExceptionType.cancel:
        break;

      case DioExceptionType.unknown:
        throw NoInternetConnectionException(
          requestOptions: err.requestOptions,
          response: err.response,
        );

      default:
        break;
    }

    super.onError(err, handler);
  }
}
