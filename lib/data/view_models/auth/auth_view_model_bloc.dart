import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common_libraries.dart';

part 'auth_view_model_event.dart';
part 'auth_view_model_state.dart';

class AuthViewModelBloc extends Bloc<AuthViewModelEvent, AuthViewModelState> {
  final BuildContext context;
  late AuthRepository authRepository;
  AuthViewModelBloc(this.context) : super(const AuthViewModelState()) {
    authRepository = RepositoryProvider.of(context);
    on<AuthViewModelLoginClickEvent>(_onAuthViewModelLoginClickEvent);
    on<AuthViewModelLogOutClickEvent>(_onAuthViewModelLogOutClickEvent);
  }

  Future<void> _onAuthViewModelLoginClickEvent(
      AuthViewModelLoginClickEvent event,
      Emitter<AuthViewModelState> emit) async {
    try {
      emit(state.copyWith(pageStatus: PageStatus.loading));
      var loginResponse = await authRepository.userLogin(event.loginRequestModel);
      Prefs.accessToken.set(loginResponse.data.token);
      Prefs.userId.set(loginResponse.data.user.id);
      Prefs.givenName.set(loginResponse.data.user.name);
      emit(state.copyWith(pageStatus: PageStatus.success, loginResponseData: loginResponse));

    } catch (ex) {
      emit(state.copyWith(pageStatus: PageStatus.success));
      AppToaster(
        context: context,
        notifyType: AppNotifyType.error,
        content: ex.toString(),
      ).show();
    }
  }
void _onAuthViewModelLogOutClickEvent(
      AuthViewModelLogOutClickEvent event,
      Emitter<AuthViewModelState> emit){
  Prefs.clear();
  AppToaster(
    context: context,
    notifyType: AppNotifyType.success,
    content: "Logout successfully",
  ).show();
  emit(state.copyWith(pageStatus: PageStatus.success, isLogout: true));
  }

}
