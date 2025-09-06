import 'package:App/common_libraries.dart';


class AuthRepository extends BaseRepository {

  /// Login user with email, password, and role
  Future<LoginResponseModel> userLogin(LoginRequestModel request) async {
    try {
      final response = await postRequest(
        "user/login",
        data: request.toJson(),
      );

      if (response.statusCode == 200 && response.data != null) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception("Login failed with status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error during login: $e");
    }
  }

}