import 'package:App/common_libraries.dart';



class ChatRepository extends BaseRepository {
  /// Get chat list for a specific user
  Future<List<RecentChatModel>> getChatData(String userId) async {
    try {
      final response = await getRequest("chats/user-chats/$userId");

      if (response.statusCode == 200) {
        final data = response.data; // yeh List aayega

        return (data as List)
            .map((e) => RecentChatModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        print("Error while fetching chats");
        throw Exception("Failed to fetch chats: ${response.statusCode}");
      }
    } catch (e, stack) {
      print("Error while fetching chats: $e");
      print("Stack trace: $stack");
      throw Exception("Error while fetching chats: $e");
    }
  }
  /// Get messages for a specific chat
  Future<List<Map<String, dynamic>>> getMessages(String chatId) async {
    try {
      final response =
      await getRequest("messages/get-messagesformobile/$chatId");

      if (response.statusCode == 200) {
        final data = response.data;
        return (data as List)
            .map((e) => Map<String, dynamic>.from(e as Map))
            .toList();
      } else {
        throw Exception("Failed to fetch messages: ${response.statusCode}");
      }
    } catch (e, stack) {
      print("Error while fetching messages: $e");
      print(stack);
      throw Exception("Error while fetching messages: $e");
    }
  }
}
