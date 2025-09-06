import '../../../../common_libraries.dart';

class RecentChatListPage extends StatelessWidget {
  final List<RecentChatModel> chats;

  const RecentChatListPage({super.key, required this.chats});

  @override
  Widget build(BuildContext context) {
    final userId = Prefs.userId.get();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return chats.isEmpty
        ? const EmptyChatWidget()
        : ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];

        /// Filter out current user
        final participants = chat.participants
            .where((e) => e.sId != userId)
            .toList();

        final recentChat = (participants.isNotEmpty)
            ? participants.first
            : const ChatParticipants(sId: "0", name: "Unknown");

        return Column(
          children: [
            ChatListItemWidget(
              chatId: chat.sId,
              userId: userId,
              userName: recentChat.name,
              lastMessage: chat.lastMessage,
            ),
            // Subtle divider for professional look
            if (index != chats.length - 1)
              Divider(
                height: 0,
                thickness: 0.5,
                indent: 70,
                endIndent: 16,
                color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
              ),
          ],
        );
      },
    );
  }
}
