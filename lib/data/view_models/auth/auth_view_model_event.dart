part of 'auth_view_model_bloc.dart';

 class AuthViewModelEvent {}

class AuthViewModelLoginClickEvent extends AuthViewModelEvent{
  final LoginRequestModel loginRequestModel;
   AuthViewModelLoginClickEvent(this.loginRequestModel);
}
class AuthViewModelLogOutClickEvent extends AuthViewModelEvent{}