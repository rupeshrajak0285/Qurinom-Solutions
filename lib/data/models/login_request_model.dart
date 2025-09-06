import '../../common_libraries.dart';

class LoginRequestModel extends Equatable {
  final String email;
  final String password;
  final String role;

  const LoginRequestModel({
     this.email='',
     this.password='',
     this.role='',
  });

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "role": role,
  };

  @override
  List<Object?> get props => [email, password, role];
}
