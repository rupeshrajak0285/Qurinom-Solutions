


import '../../common_libraries.dart';

class LoginResponseModel {
  final bool encrypted;
  final UserData data;

  LoginResponseModel({
    this.encrypted = false,
    UserData? data,
  }) : data = data ?? UserData();

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    encrypted: json["encrypted"] ?? false,
    data: json["data"] == null ? UserData() : UserData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "encrypted": encrypted,
    "data": data.toJson(),
  };
}

class UserData {
  final String token;
  final User user;

  UserData({
    this.token = "",
    User? user,
  }) : user = user ?? User();

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    token: json["token"] ?? "",
    user: json["user"] == null ? User() : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user": user.toJson(),
  };
}

class User {
  final Location location;
  final String id;
  final String name;
  final String email;
  final String gender;
  final String phone;
  final String addressLane1;
  final String addressLane2;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final bool isOnline;
  final List<dynamic> blockedUsers;
  final String role;
  final bool isVerified;
  final bool isDeleted;
  final String deletedMessage;
  final bool isDisabled;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
  final DateTime lastSeen;
  final String profile;
  final DateTime deletedTime;
  final String plan;
  final String previousPlan;
  final DateTime createdForTtl;
  final List<PaymentHistory> paymentHistory;
  final String referralCode;
  final DateTime planEndDate;
  final List<String> fcmTokens;

  User({
    Location? location,
    this.id = "",
    this.name = "",
    this.email = "",
    this.gender = "",
    this.phone = "",
    this.addressLane1 = "",
    this.addressLane2 = "",
    this.city = "",
    this.state = "",
    this.postalCode = "",
    this.country = "",
    this.isOnline = false,
    List<dynamic>? blockedUsers,
    this.role = "",
    this.isVerified = false,
    this.isDeleted = false,
    this.deletedMessage = "",
    this.isDisabled = false,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.v = 0,
    DateTime? lastSeen,
    this.profile = "",
    DateTime? deletedTime,
    this.plan = "",
    this.previousPlan = "",
    DateTime? createdForTtl,
    List<PaymentHistory>? paymentHistory,
    this.referralCode = "",
    DateTime? planEndDate,
    List<String>? fcmTokens,
  })  : location = location ?? Location(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now(),
        lastSeen = lastSeen ?? DateTime.now(),
        deletedTime = deletedTime ?? DateTime.now(),
        createdForTtl = createdForTtl ?? DateTime.now(),
        planEndDate = planEndDate ?? DateTime.now(),
        blockedUsers = blockedUsers ?? [],
        paymentHistory = paymentHistory ?? [],
        fcmTokens = fcmTokens ?? [];

  factory User.fromJson(Map<String, dynamic> json) => User(
    location: json["location"] == null
        ? Location()
        : Location.fromJson(json["location"]),
    id: json["_id"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    gender: json["gender"] ?? "",
    phone: json["phone"] ?? "",
    addressLane1: json["addressLane1"] ?? "",
    addressLane2: json["addressLane2"] ?? "",
    city: json["city"] ?? "",
    state: json["state"] ?? "",
    postalCode: json["postalCode"] ?? "",
    country: json["country"] ?? "",
    isOnline: json["isOnline"] ?? false,
    blockedUsers:
    json["blockedUsers"] == null ? [] : List<dynamic>.from(json["blockedUsers"]),
    role: json["role"] ?? "",
    isVerified: json["isVerified"] ?? false,
    isDeleted: json["isDeleted"] ?? false,
    deletedMessage: json["deletedMessage"] ?? "",
    isDisabled: json["isDisabled"] ?? false,
    createdAt: json["createdAt"] == null
        ? DateTime.now()
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? DateTime.now()
        : DateTime.parse(json["updatedAt"]),
    v: json["__v"] ?? 0,
    lastSeen: json["lastSeen"] == null
        ? DateTime.now()
        : DateTime.parse(json["lastSeen"]),
    profile: json["profile"] ?? "",
    deletedTime: json["deletedTime"] == null
        ? DateTime.now()
        : DateTime.parse(json["deletedTime"]),
    plan: json["plan"] ?? "",
    previousPlan: json["previousPlan"] ?? "",
    createdForTtl: json["createdForTTL"] == null
        ? DateTime.now()
        : DateTime.parse(json["createdForTTL"]),
    paymentHistory: json["paymentHistory"] == null
        ? []
        : List<PaymentHistory>.from(
        json["paymentHistory"].map((x) => PaymentHistory.fromJson(x))),
    referralCode: json["referralCode"] ?? "",
    planEndDate: json["planEndDate"] == null
        ? DateTime.now()
        : DateTime.parse(json["planEndDate"]),
    fcmTokens: json["fcmTokens"] == null
        ? []
        : List<String>.from(json["fcmTokens"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "_id": id,
    "name": name,
    "email": email,
    "gender": gender,
    "phone": phone,
    "addressLane1": addressLane1,
    "addressLane2": addressLane2,
    "city": city,
    "state": state,
    "postalCode": postalCode,
    "country": country,
    "isOnline": isOnline,
    "blockedUsers": List<dynamic>.from(blockedUsers.map((x) => x)),
    "role": role,
    "isVerified": isVerified,
    "isDeleted": isDeleted,
    "deletedMessage": deletedMessage,
    "isDisabled": isDisabled,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "lastSeen": lastSeen.toIso8601String(),
    "profile": profile,
    "deletedTime": deletedTime.toIso8601String(),
    "plan": plan,
    "previousPlan": previousPlan,
    "createdForTTL": createdForTtl.toIso8601String(),
    "paymentHistory": List<dynamic>.from(paymentHistory.map((x) => x.toJson())),
    "referralCode": referralCode,
    "planEndDate": planEndDate.toIso8601String(),
    "fcmTokens": List<dynamic>.from(fcmTokens.map((x) => x)),
  };
}

class Location {
  final double latitude;
  final double longitude;

  Location({
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    latitude: (json["latitude"] ?? 0).toDouble(),
    longitude: (json["longitude"] ?? 0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "latitude": latitude,
    "longitude": longitude,
  };
}

class PaymentHistory {
  final String orderId;
  final int amount;
  final String currency;
  final String status;
  final Method method;
  final DateTime paidAt;
  final String id;

  PaymentHistory({
    this.orderId = "",
    this.amount = 0,
    this.currency = "",
    this.status = "",
    Method? method,
    DateTime? paidAt,
    this.id = "",
  })  : method = method ?? Method(),
        paidAt = paidAt ?? DateTime.now();

  factory PaymentHistory.fromJson(Map<String, dynamic> json) => PaymentHistory(
    orderId: json["orderId"] ?? "",
    amount: json["amount"] ?? 0,
    currency: json["currency"] ?? "",
    status: json["status"] ?? "",
    method: json["method"] == null ? Method() : Method.fromJson(json["method"]),
    paidAt: json["paidAt"] == null
        ? DateTime.now()
        : DateTime.parse(json["paidAt"]),
    id: json["_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId,
    "amount": amount,
    "currency": currency,
    "status": status,
    "method": method.toJson(),
    "paidAt": paidAt.toIso8601String(),
    "_id": id,
  };
}

class Method {
  final Upi upi;

  Method({Upi? upi}) : upi = upi ?? Upi();

  factory Method.fromJson(Map<String, dynamic> json) => Method(
    upi: json["upi"] == null ? Upi() : Upi.fromJson(json["upi"]),
  );

  Map<String, dynamic> toJson() => {
    "upi": upi.toJson(),
  };
}

class Upi extends Equatable {
  final String channel;
  final String upiId;

  const Upi({this.channel = "", this.upiId = ""});

  factory Upi.fromJson(Map<String, dynamic> json) {
    return Upi(
      channel: json['channel'] ?? '',
      upiId: json['upi_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    "channel": channel,
    "upi_id": upiId,
  };

  @override
  List<Object?> get props => [channel, upiId];
}
/*class Upi {
  final String channel;
  final String upiId;

  Upi({
    this.channel = "",
    this.upiId = "",
  });

  factory Upi.fromJson(Map<String, dynamic> json) => Upi(
    channel: json["channel"] ?? "",
    upiId: json["upi_id"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "channel": channel,
    "upi_id": upiId,
  };
}*/
