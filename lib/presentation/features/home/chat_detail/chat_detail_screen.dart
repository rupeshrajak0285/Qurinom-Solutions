import '../../../../common_libraries.dart';

class ChatDetailPage extends StatefulWidget {
  final String chatId;
  final String userId;
  final String userName;

  const ChatDetailPage({
    super.key,
    required this.chatId,
    required this.userId,
    required this.userName,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (context) =>
          ChatViewModelBloc(context, widget.chatId, isDetailPage: true),
      child: BlocBuilder<ChatViewModelBloc, ChatViewModelState>(
        builder: (context, state) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
            }
          });

          return Scaffold(
            backgroundColor: isDarkMode ? Colors.black : Colors.grey.shade100,
            appBar: AppBar(
              backgroundColor: isDarkMode ? Colors.grey[900] : Colors.blue.shade50,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  AvatarWidget(
                    name: widget.userName.isNotEmpty
                        ? widget.userName[0]
                        : "U",
                    radius: 22,
                    backgroundColor: isDarkMode ? Colors.grey[700]! : Colors.blue.shade100,
                    textStyle: TextStyle(
                      color: isDarkMode ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.userName,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Subtle chat background
                      Positioned.fill(
                        child: Opacity(
                          opacity: isDarkMode ? 0.1 : 0.2,
                          child: Image.asset(
                            "assets/chating_background.jpg",
                            fit: BoxFit.cover,
                            repeat: ImageRepeat.repeat,
                          ),
                        ),
                      ),
                      // Chat messages
                      ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          final msg = state.messages[index];
                          final isMine = msg["senderId"] == widget.userId;
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: ChatMessageBubbleWidget(
                              message: msg,
                              isMine: isMine,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Input field with card style
                ChatInputField(controller: state.messageController),

                AppDimens.spacerY10,
              ],
            ),
          );
        },
      ),
    );
  }
}
