
import '../../../../common_libraries.dart';

class EmptyChatWidget extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color color;
  final double iconSize;
  final double spacing;

  const EmptyChatWidget({
    super.key,
    this.message = "No chats yet",
    this.icon = Icons.chat_bubble_outline,
    this.color = Colors.grey,
    this.iconSize = 80,
    this.spacing = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: iconSize, color: color),
          SizedBox(height: spacing),
          Text(
            message,
            style: TextStyle(fontSize: 16, color: color),
          ),
        ],
      ),
    );
  }
}
