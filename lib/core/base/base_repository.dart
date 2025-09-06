import '../../common_libraries.dart';

abstract class BaseRepository {
  final ApiClientService _apiClient = ApiClientService();

  Future<Response> getRequest(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      return await _apiClient.get(path, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> postRequest(String path, {Object? data, Map<String, dynamic>? queryParams}) async {
    try {
      return await _apiClient.post(path, data: data, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> putRequest(String path, {Object? data, Map<String, dynamic>? queryParams}) async {
    try {
      return await _apiClient.put(path, data: data, queryParameters: queryParams);
    } catch (e) {
      rethrow;
    }
  }
}
