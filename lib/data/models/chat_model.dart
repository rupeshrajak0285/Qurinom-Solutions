import 'package:equatable/equatable.dart';

class RecentChatModel extends Equatable {
  final String sId;
  final bool isGroupChat;
  final List<ChatParticipants> participants;
  final String createdAt;
  final String updatedAt;
  final int iV;
  final ChatLastMessage lastMessage;

  const RecentChatModel({
    this.sId = "",
    this.isGroupChat = false,
    this.participants = const [],
    this.createdAt = "",
    this.updatedAt = "",
    this.iV = 0,
    this.lastMessage = const ChatLastMessage(),
  });

  factory RecentChatModel.fromJson(Map<String, dynamic> json) {
    return RecentChatModel(
      sId: json['_id'] ?? "",
      isGroupChat: json['isGroupChat'] ?? false,
      participants: (json['participants'] as List<dynamic>?)
          ?.map((v) => ChatParticipants.fromJson(v))
          .toList() ??
          [],
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      iV: json['__v'] ?? 0,
      lastMessage: json['lastMessage'] != null
          ? ChatLastMessage.fromJson(json['lastMessage'])
          : const ChatLastMessage(),
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': sId,
    'isGroupChat': isGroupChat,
    'participants': participants.map((v) => v.toJson()).toList(),
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': iV,
    'lastMessage': lastMessage.toJson(),
  };

  @override
  List<Object?> get props =>
      [sId, isGroupChat, participants, createdAt, updatedAt, iV, lastMessage];
}

class ChatParticipants extends Equatable {
  final ChatLocation location;
  final String sId;
  final String name;
  final String email;
  final String password;
  final String gender;
  final String phone;
  final String addressLane1;
  final String addressLane2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final bool isOnline;
  final List<String> blockedUsers;
  final String role;
  final bool isVerified;
  final bool isDeleted;
  final String deletedMessage;
  final bool isDisabled;
  final String createdAt;
  final String updatedAt;
  final int iV;
  final String lastSeen;
  final String plan;
  final String profile;
  final List<ChatPaymentHistory> paymentHistory;
  final String createdForTTL;
  final String deletedTime;
  final String previousPlan;
  final String referralCode;
  final String planEndDate;
  final List<String> fcmTokens;

  const ChatParticipants({
    this.location = const ChatLocation(),
    this.sId = "",
    this.name = "",
    this.email = "",
    this.password = "",
    this.gender = "",
    this.phone = "",
    this.addressLane1 = "",
    this.addressLane2 = "",
    this.city = "",
    this.state = "",
    this.postalCode = "",
    this.country = "",
    this.isOnline = false,
    this.blockedUsers = const [],
    this.role = "",
    this.isVerified = false,
    this.isDeleted = false,
    this.deletedMessage = "",
    this.isDisabled = false,
    this.createdAt = "",
    this.updatedAt = "",
    this.iV = 0,
    this.lastSeen = "",
    this.plan = "",
    this.profile = "",
    this.paymentHistory = const [],
    this.createdForTTL = "",
    this.deletedTime = "",
    this.previousPlan = "",
    this.referralCode = "",
    this.planEndDate = "",
    this.fcmTokens = const [],
  });

  factory ChatParticipants.fromJson(Map<String, dynamic> json) {
    return ChatParticipants(
      location: json['location'] != null
          ? ChatLocation.fromJson(json['location'])
          : const ChatLocation(),
      sId: json['_id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      gender: json['gender'] ?? "",
      phone: json['phone'] ?? "",
      addressLane1: json['addressLane1'] ?? "",
      addressLane2: json['addressLane2'] ?? "",
      city: json['city'] ?? "",
      state: json['state'] ?? "",
      postalCode: json['postalCode'] ?? "",
      country: json['country'] ?? "",
      isOnline: json['isOnline'] ?? false,
      blockedUsers: (json['blockedUsers'] as List<dynamic>?)
          ?.map((v) => v.toString())
          .toList() ??
          [],
      role: json['role'] ?? "",
      isVerified: json['isVerified'] ?? false,
      isDeleted: json['isDeleted'] ?? false,
      deletedMessage: json['deletedMessage'] ?? "",
      isDisabled: json['isDisabled'] ?? false,
      createdAt: json['createdAt'] ?? "",
      updatedAt: json['updatedAt'] ?? "",
      iV: json['__v'] ?? 0,
      lastSeen: json['lastSeen'] ?? "",
      plan: json['plan'] ?? "",
      profile: json['profile'] ?? "",
      paymentHistory: (json['paymentHistory'] as List<dynamic>?)
          ?.map((v) => ChatPaymentHistory.fromJson(v))
          .toList() ??
          [],
      createdForTTL: json['createdForTTL'] ?? "",
      deletedTime: json['deletedTime'] ?? "",
      previousPlan: json['previousPlan'] ?? "",
      referralCode: json['referralCode'] ?? "",
      planEndDate: json['planEndDate'] ?? "",
      fcmTokens:
      (json['fcmTokens'] as List<dynamic>?)?.map((v) => v.toString()).toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
    'location': location.toJson(),
    '_id': sId,
    'name': name,
    'email': email,
    'password': password,
    'gender': gender,
    'phone': phone,
    'addressLane1': addressLane1,
    'addressLane2': addressLane2,
    'city': city,
    'state': state,
    'postalCode': postalCode,
    'country': country,
    'isOnline': isOnline,
    'blockedUsers': blockedUsers,
    'role': role,
    'isVerified': isVerified,
    'isDeleted': isDeleted,
    'deletedMessage': deletedMessage,
    'isDisabled': isDisabled,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    '__v': iV,
    'lastSeen': lastSeen,
    'plan': plan,
    'profile': profile,
    'paymentHistory': paymentHistory.map((v) => v.toJson()).toList(),
    'createdForTTL': createdForTTL,
    'deletedTime': deletedTime,
    'previousPlan': previousPlan,
    'referralCode': referralCode,
    'planEndDate': planEndDate,
    'fcmTokens': fcmTokens,
  };

  @override
  List<Object?> get props => [
    location,
    sId,
    name,
    email,
    password,
    gender,
    phone,
    addressLane1,
    addressLane2,
    city,
    state,
    postalCode,
    country,
    isOnline,
    blockedUsers,
    role,
    isVerified,
    isDeleted,
    deletedMessage,
    isDisabled,
    createdAt,
    updatedAt,
    iV,
    lastSeen,
    plan,
    profile,
    paymentHistory,
    createdForTTL,
    deletedTime,
    previousPlan,
    referralCode,
    planEndDate,
    fcmTokens,
  ];
}

class ChatLocation extends Equatable {
  final double latitude;
  final double longitude;

  const ChatLocation({this.latitude = 0.0, this.longitude = 0.0});

  factory ChatLocation.fromJson(Map<String, dynamic> json) {
    return ChatLocation(
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };

  @override
  List<Object?> get props => [latitude, longitude];
}

class ChatPaymentHistory extends Equatable {
  final String orderId;
  final int amount;
  final String currency;
  final String status;
  final ChatMethod method;
  final String paidAt;
  final String sId;

  const ChatPaymentHistory({
    this.orderId = "",
    this.amount = 0,
    this.currency = "",
    this.status = "",
    this.method = const ChatMethod(),
    this.paidAt = "",
    this.sId = "",
  });

  factory ChatPaymentHistory.fromJson(Map<String, dynamic> json) {
    return ChatPaymentHistory(
      orderId: json['orderId'] ?? "",
      amount: json['amount'] ?? 0,
      currency: json['currency'] ?? "",
      status: json['status'] ?? "",
      method: json['method'] != null
          ? ChatMethod.fromJson(json['method'])
          : const ChatMethod(),
      paidAt: json['paidAt'] ?? "",
      sId: json['_id'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    'orderId': orderId,
    'amount': amount,
    'currency': currency,
    'status': status,
    'method': method.toJson(),
    'paidAt': paidAt,
    '_id': sId,
  };

  @override
  List<Object?> get props => [orderId, amount, currency, status, method, paidAt, sId];
}

class ChatMethod extends Equatable {
  final ChatUpi upi;

  const ChatMethod({this.upi = const ChatUpi()});

  factory ChatMethod.fromJson(Map<String, dynamic> json) {
    return ChatMethod(
      upi: json['upi'] != null ? ChatUpi.fromJson(json['upi']) : const ChatUpi(),
    );
  }

  Map<String, dynamic> toJson() => {
    'upi': upi.toJson(),
  };

  @override
  List<Object?> get props => [upi];
}

class ChatUpi extends Equatable {
  final String channel;
  final String upiId;

  const ChatUpi({this.channel = "", this.upiId = ""});

  factory ChatUpi.fromJson(Map<String, dynamic> json) {
    return ChatUpi(
      channel: json['channel'] ?? "",
      upiId: json['upi_id'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    'channel': channel,
    'upi_id': upiId,
  };

  @override
  List<Object?> get props => [channel, upiId];
}

class ChatLastMessage extends Equatable {
  final String sId;
  final String senderId;
  final String content;
  final String messageType;
  final String fileUrl;
  final String createdAt;

  const ChatLastMessage({
    this.sId = "",
    this.senderId = "",
    this.content = "",
    this.messageType = "",
    this.fileUrl = "",
    this.createdAt = "",
  });

  factory ChatLastMessage.fromJson(Map<String, dynamic> json) {
    return ChatLastMessage(
      sId: json['_id'] ?? "",
      senderId: json['senderId'] ?? "",
      content: json['content'] ?? "",
      messageType: json['messageType'] ?? "",
      fileUrl: json['fileUrl'] ?? "",
      createdAt: json['createdAt'] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    '_id': sId,
    'senderId': senderId,
    'content': content,
    'messageType': messageType,
    'fileUrl': fileUrl,
    'createdAt': createdAt,
  };

  @override
  List<Object?> get props => [sId, senderId, content, messageType, fileUrl, createdAt];
}
