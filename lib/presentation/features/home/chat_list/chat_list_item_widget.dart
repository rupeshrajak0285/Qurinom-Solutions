import '../../../../common_libraries.dart';

/// Custom widget for a single chat item
class ChatListItemWidget extends StatelessWidget {
  final String chatId;
  final String userId;
  final String userName;
  final ChatLastMessage lastMessage;

  const ChatListItemWidget({
    super.key,
    required this.chatId,
    required this.userId,
    required this.userName,
    required this.lastMessage,
  });

  @override
  Widget build(BuildContext context) {
    // Get the current theme (light/dark)
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailPage(
              chatId: chatId,
              userId: userId,
              userName: userName,
            ),
          ),
        ).then((value){
          context.read<ChatViewModelBloc>().add(FetchUserListDataEvent());
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.grey[850] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (!isDarkMode)
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
          ],
        ),
        child: Row(
          children: [
            AvatarWidget(
              name: userName,
              radius: 28,
              backgroundColor:
              isDarkMode ? Colors.blueGrey : const Color(0xFF90CAF9),
              textStyle: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName.isNotEmpty ? userName : "Unknown",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: isDarkMode ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    lastMessage.content ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              AppUtils.formatMessageTime(lastMessage.createdAt),
              style: TextStyle(
                fontSize: 12,
                color: isDarkMode ? Colors.grey[500] : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
