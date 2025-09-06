part of 'auth_view_model_bloc.dart';


class AuthViewModelState extends Equatable {
  final PageStatus pageStatus;
  final LoginResponseModel? loginResponseData;
  final bool isLogout;

   const AuthViewModelState({
    this.pageStatus = PageStatus.initial,
    this.loginResponseData ,
     this.isLogout = false,
  });

  @override
  List<Object?> get props => [
    pageStatus,
    loginResponseData,
    isLogout,
  ];

  AuthViewModelState copyWith({
    PageStatus? pageStatus,
    LoginResponseModel? loginResponseData,
    bool? isLogout,
  }) {
    return AuthViewModelState(
      pageStatus: pageStatus ?? this.pageStatus,
      loginResponseData: loginResponseData,
        isLogout : isLogout ?? this.isLogout,
    );
  }
}
