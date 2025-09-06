part of 'chat_view_model_bloc.dart';

 class ChatViewModelEvent {}
class FetchUserListDataEvent extends  ChatViewModelEvent {}

class FetchMessagesEvent extends ChatViewModelEvent {
}

class SendMessageEvent extends ChatViewModelEvent {
  final String message;
  SendMessageEvent(this.message);
}

class ReceiveMessageEvent extends ChatViewModelEvent {
 final Map<String, dynamic> message;
 ReceiveMessageEvent(this.message);
}
