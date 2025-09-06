import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../common_libraries.dart';

part 'chat_view_model_event.dart';
part 'chat_view_model_state.dart';

class ChatViewModelBloc extends Bloc<ChatViewModelEvent, ChatViewModelState> {
  final BuildContext context;
  late ChatRepository repository;
  late ChatSocketService socketService;
  String userId = '';
  final String chatId;
  final bool isDetailPage;
  ChatViewModelBloc(this.context, this.chatId, {this.isDetailPage = false}) : super( ChatViewModelState(messageController: TextEditingController())) {
    repository = RepositoryProvider.of(context);
    userId = Prefs.userId.get();
    /// Initialize Socket Service after fetching messages
    socketService = ChatSocketService();
    on<FetchUserListDataEvent>(_onFetchUserListDataEvent);
    on<SendMessageEvent>(_onSendMessage);
    on<FetchMessagesEvent>(_onFetchMessages);
    on<ReceiveMessageEvent>(_onReceiveMessage);
    isDetailPage ?  add(FetchMessagesEvent()) : add(FetchUserListDataEvent());
  }
  Future<void> _onFetchUserListDataEvent(
      FetchUserListDataEvent event,
      Emitter<ChatViewModelState> emit) async {
    try {
      emit(state.copyWith(pageStatus: PageStatus.loading));
      var chatData = await repository.getChatData(userId);

      emit(state.copyWith(pageStatus: PageStatus.success, chatResponseModel: chatData));

    } catch (ex) {
      emit(state.copyWith(pageStatus: PageStatus.failure));
      AppToaster(
        context: context,
        notifyType: AppNotifyType.error,
        content: ex.toString(),
      ).show();
    }
  }
  Future<void> _onFetchMessages(
      FetchMessagesEvent event, Emitter<ChatViewModelState> emit) async {
    try {
      emit(state.copyWith(pageStatus: PageStatus.loading));
      final messages = await repository.getMessages(chatId);
      emit(state.copyWith(
          pageStatus: PageStatus.success,
          messages: List<Map<String, dynamic>>.from(messages)));


      socketService.onMessageReceived = (message) {
        add(ReceiveMessageEvent(message));
      };
      socketService.connect(userId, chatId: chatId);
    } catch (e) {
      emit(state.copyWith(pageStatus: PageStatus.failure));
      AppToaster(
        context: context,
        notifyType: AppNotifyType.error,
        content: e.toString(),
      ).show();
    }
  }

  void _onSendMessage(
      SendMessageEvent event, Emitter<ChatViewModelState> emit) {
    if (event.message.trim().isEmpty) return;

    final msg = {
      "chatId": chatId,
      "senderId": userId,
      "content": event.message,
      "messageType": "text",
      "fileUrl": ""
    };

    socketService.sendMessage(
        chatId: chatId, senderId: userId, content: event.message);

    final updatedMessages = List<Map<String, dynamic>>.from(state.messages)
      ..add(msg);
    emit(state.copyWith(messages: updatedMessages));
  }

  void _onReceiveMessage(
      ReceiveMessageEvent event, Emitter<ChatViewModelState> emit) {
    final updatedMessages = List<Map<String, dynamic>>.from(state.messages)
      ..add(event.message);
    emit(state.copyWith(messages: updatedMessages));
  }

  @override
  Future<void> close() {
    socketService.disconnect();
    return super.close();
  }
}
