part of 'chat_view_model_bloc.dart';

class ChatViewModelState extends Equatable {
  final PageStatus pageStatus;
  final List<RecentChatModel> chatResponseModel; // chat list
  final List<Map<String, dynamic>> messages;      // messages for selected chat
  final String error;
  final TextEditingController messageController;

  const ChatViewModelState({
    this.pageStatus = PageStatus.initial,
    this.chatResponseModel = const [],
    this.messages = const [],
    this.error = '',
    required this.messageController,
  });

  @override
  List<Object?> get props => [
    pageStatus,
    chatResponseModel,
    messages,
    error,
    messageController
  ];

  ChatViewModelState copyWith({
    PageStatus? pageStatus,
    List<RecentChatModel>? chatResponseModel,
    List<Map<String, dynamic>>? messages,
    String? error,
    TextEditingController? messageController,
  }) {
    return ChatViewModelState(
      pageStatus: pageStatus ?? this.pageStatus,
      chatResponseModel: chatResponseModel ?? this.chatResponseModel,
      messages: messages ?? this.messages,
      error: error ?? this.error,
      messageController : messageController ?? this.messageController,
    );
  }
}
