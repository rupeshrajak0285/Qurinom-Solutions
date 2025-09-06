import 'package:App/common_libraries.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = Prefs.givenName.get();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDarkMode ? Colors.black : Colors.blue.shade50;

    return BlocProvider(
      create: (context) => ChatViewModelBloc(context, '', isDetailPage: false),
      child: BlocBuilder<ChatViewModelBloc, ChatViewModelState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: bgColor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: bgColor,
              elevation: 0,
              titleSpacing: 20,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue.shade100,
                    child: Text(
                      userName.isNotEmpty ? userName[0].toUpperCase() : "?",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Hi, $userName ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? Colors.white : Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                  tooltip: "Logout",
                  onPressed: () {
                    context.read<AuthViewModelBloc>().add(
                      AuthViewModelLogOutClickEvent(),
                    );
                  },
                ),
              ],
            ),

            // Body
            body: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  color: isDarkMode ? Colors.grey[900] : Colors.white,
                  child: state.pageStatus == PageStatus.loading
                      ? _buildShimmerList(isDarkMode) // shimmer effect
                      : RecentChatListPage(chats: state.chatResponseModel),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildShimmerList(bool isDarkMode) {
    return ListView.builder(
      itemCount: 20, // show 6 shimmer placeholders
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: isDarkMode ? Colors.grey[800]! : Colors.grey[300]!,
          highlightColor: isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
          child: ListTile(
            leading: const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
            ),
            title: Container(
              height: 12,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4),
            ),
            subtitle: Container(
              height: 12,
              width: 150,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4),
            ),
          ),
        );
      },
    );
  }
}
