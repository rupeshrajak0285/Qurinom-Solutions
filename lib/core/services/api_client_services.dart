import 'dart:io';
import '../../common_libraries.dart';

class ApiClientService {
  static const _timeoutDuration = Duration(seconds: 30);
/*  static String appVersion = "";*/

  late final Dio _dio;


  // Singleton setup
  ApiClientService._internal();
  static final ApiClientService _instance = ApiClientService._internal();
  factory ApiClientService() => _instance;

  /// Initializes Dio instances and retrieves app version.
  static Future<void> init() async {
/*    appVersion = (await PackageInfo.fromPlatform()).version;*/

    _instance._dio = _createDio(baseUrl: BaseAPIUrls.baseApiUrl);

  }

  /// Performs an HTTP request using the specified Dio client.
  Future<Response<dynamic>> _request(
      Dio client,
      String method,
      String path, {
        Object? data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? headers,
      }) async {
    final options = Options(headers: headers);

    switch (method.toUpperCase()) {
      case 'GET':
        return await client.get(path, queryParameters: queryParameters, options: options);
      case 'POST':
        return await client.post(path, data: data, queryParameters: queryParameters, options: options);
      case 'PUT':
        return await client.put(path, data: data, queryParameters: queryParameters, options: options);
      case 'DELETE':
        return await client.delete(path, data: data, queryParameters: queryParameters, options: options);
      default:
        throw UnsupportedError('Unsupported HTTP method: $method');
    }
  }

  // Sign-in specific requests
  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) =>
      _request(_dio, 'GET', path, queryParameters: queryParameters);

  Future<Response> post(String path, {Object? data, Map<String, dynamic>? queryParameters}) =>
      _request(_dio, 'POST', path, data: data, queryParameters: queryParameters);

  Future<Response> put(String path, {Object? data, Map<String, dynamic>? queryParameters}) =>
      _request(_dio, 'PUT', path, data: data, queryParameters: queryParameters);

  /// Builds and configures a Dio instance.
  static Dio _createDio({required String baseUrl}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveTimeout: _timeoutDuration,
        connectTimeout: _timeoutDuration,
        sendTimeout: _timeoutDuration,

      ),
    );

    dio.interceptors
      ..clear()
      ..add(AppInterceptor(dio));

    return dio;
  }
}
