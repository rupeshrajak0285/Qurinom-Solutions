import '../../../../common_libraries.dart';

class ChatMessageBubbleWidget extends StatelessWidget {
  final Map<String, dynamic> message;
  final bool isMine;

  const ChatMessageBubbleWidget({super.key, required this.message, required this.isMine});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: const EdgeInsets.symmetric(vertical: 4),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isMine ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMine ? 16 : 0),
            bottomRight: Radius.circular(isMine ? 0 : 16),
          ),
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 2, offset: const Offset(0, 1))],
        ),
        child: Column(
          crossAxisAlignment: isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message["content"] ?? "",
              style: TextStyle(color: isMine ? Colors.white : Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              AppUtils.formatMessageTime(
                message["createdAt"] == null || message["createdAt"].toString().isEmpty
                    ? DateTime.now().toString()
                    : message["createdAt"].toString(),
              ),
              style: TextStyle(
                color: isMine ? Colors.white70 : Colors.black54,
                fontSize: 12,
              ),
            ),

          ],
        ),
      ),
    );
  }
}