/*
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatSocketService {
  late IO.Socket socket;

  void connect(String userId) {
    socket = IO.io(
      "http://45.129.87.38:6065",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNew()
          .enableReconnection()
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print("✅ Socket connected");
      socket.emit("join", {"userId": userId}); // agar join room chahiye
    });

    socket.on("chat", (data) {
      print("📩 chat: $data");
    });

    socket.on("receiveMessage", (data) {
      print("📩 receiveMessage: $data");
    });

    socket.on("newMessage", (data) {
      print("📩 newMessage: $data");
    });


    socket.onDisconnect((_) => print("❌ Socket disconnected"));
  }

  void sendMessage(String chatId, String senderId, String content) {
    socket.emit("sendMessage", {
      "chatId": chatId,
      "senderId": senderId,
      "content": content,
      "messageType": "text",
      "fileUrl": ""
    });
  }

  void disconnect() {
    socket.disconnect();
  }
}
*/


import 'dart:convert';

import 'package:socket_io_client/socket_io_client.dart' as IO;

typedef MessageCallback = void Function(Map<String, dynamic> message);

class ChatSocketService {
  late IO.Socket socket;
  MessageCallback? onMessageReceived;

  void connect(String userId, {String? chatId}) {
    socket = IO.io(
      "http://45.129.87.38:6065",
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNew()
          .enableReconnection()
          .build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print("✅ Socket connected");
      final joinData = {"userId": userId};
      if (chatId != null) joinData["chatId"] = chatId;
      socket.emit("join", joinData);
    });

    // Listen to all chat events
    socket.on("chat", _handleMessage);
    socket.on("receiveMessage", _handleMessage);
    socket.on("newMessage", _handleMessage);

    socket.onDisconnect((_) => print("❌ Socket disconnected"));
  }

  void _handleMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      onMessageReceived?.call(data);
    } else if (data is String) {
      try {
        final decoded = Map<String, dynamic>.from(jsonDecode(data));
        onMessageReceived?.call(decoded);
      } catch (_) {
        print("⚠️ Unable to decode socket message: $data");
      }
    }
  }

  void sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  }) {
    socket.emit("sendMessage", {
      "chatId": chatId,
      "senderId": senderId,
      "content": content,
      "messageType": "text",
      "fileUrl": ""
    });
  }

  void disconnect() {
    socket.disconnect();
  }
}
