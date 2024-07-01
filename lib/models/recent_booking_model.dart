// class RecentBookingModel {
//   final String id;
//   final String provider;
//   final String user;
//   final String selectHelp;
//   final String helpDescription;
//   final String status;
//   final String offerStatus;
//   final double price;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final int? v;
//
//   RecentBookingModel({
//     required this.id,
//     required this.provider,
//     required this.user,
//     required this.selectHelp,
//     required this.helpDescription,
//     required this.status,
//     required this.offerStatus,
//     required this.price,
//     required this.createdAt,
//     required this.updatedAt,
//     this.v,
//   });
//
//   factory RecentBookingModel.fromJson(Map<String, dynamic> json) {
//     return RecentBookingModel(
//       id: json['_id'],
//       provider: json['provider'],
//       user: json['user'],
//       selectHelp: json['selectHelp'],
//       helpDescription: json['helpDescription'],
//       status: json['status'],
//       offerStatus: json['offerStatus'],
//       price: json['price'].toDouble(),
//       createdAt: DateTime.parse(json['createdAt']),
//       updatedAt: DateTime.parse(json['updatedAt']),
//       v: json["__v"],
//     );
//   }
//
//
//   Map<String,dynamic> toJson() => {
//     "_id": id,
//     "provider": provider,
//     "user": user,
//     "selectHelp": selectHelp,
//     "helpDescription": helpDescription,
//     "status": status,
//     "offerStatus": offerStatus,
//     "price": price,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "__v": v,
//   };
//
// }



// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



// To parse this JSON data, do
//
//     final recentBokingMOdel = recentBokingMOdelFromJson(jsonString);



class RecentBookingModel {
  String? id;
  Provider? provider;
  String? user;
  ServiceId? serviceId;
  String? selectHelp;
  String? helpDescription;
  String? status;
  String? offerStatus;
  int? price;
  bool? isPayment;
  String? transactionId;
  String? paymentMethod;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  RecentBookingModel({
    this.id,
    this.provider,
    this.user,
    this.serviceId,
    this.selectHelp,
    this.helpDescription,
    this.status,
    this.offerStatus,
    this.price,
    this.isPayment,
    this.transactionId,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory RecentBookingModel.fromJson(Map<String, dynamic> json) => RecentBookingModel(
    id: json["_id"],
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    user: json["user"],
    serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
    selectHelp: json["selectHelp"],
    helpDescription: json["helpDescription"],
    status: json["status"],
    offerStatus: json["offerStatus"],
    price: json["price"],
    isPayment: json["isPayment"],
    transactionId: json["transactionId"],
    paymentMethod: json["paymentMethod"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "provider": provider?.toJson(),
    "user": user,
    "serviceId": serviceId?.toJson(),
    "selectHelp": selectHelp,
    "helpDescription": helpDescription,
    "status": status,
    "offerStatus": offerStatus,
    "price": price,
    "isPayment": isPayment,
    "transactionId": transactionId,
    "paymentMethod": paymentMethod,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Provider {
  String? id;
  String? name;
  String? email;
  String? role;
  String? phone;
  String? address;
  bool? privacyPolicyAccepted;
  bool? isAdmin;
  bool? isVerified;
  bool? isDeleted;
  bool? isBlocked;
  List<DriverLicenceFront>? image;
  List<DriverLicenceFront>? driverLicenceFront;
  List<DriverLicenceFront>? driverLicenceback;
  dynamic oneTimeCode;
  int? v;
  double? latitude;
  double? longitude;

  Provider({
    this.id,
    this.name,
    this.email,
    this.role,
    this.phone,
    this.address,
    this.privacyPolicyAccepted,
    this.isAdmin,
    this.isVerified,
    this.isDeleted,
    this.isBlocked,
    this.image,
    this.driverLicenceFront,
    this.driverLicenceback,
    this.oneTimeCode,
    this.v,
    this.latitude,
    this.longitude,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    phone: json["phone"],
    address: json["address"],
    privacyPolicyAccepted: json["privacyPolicyAccepted"],
    isAdmin: json["isAdmin"],
    isVerified: json["isVerified"],
    isDeleted: json["isDeleted"],
    isBlocked: json["isBlocked"],
    image: json["image"] == null ? [] : List<DriverLicenceFront>.from(json["image"]!.map((x) => DriverLicenceFront.fromJson(x))),
    driverLicenceFront: json["driverLicenceFront"] == null ? [] : List<DriverLicenceFront>.from(json["driverLicenceFront"]!.map((x) => DriverLicenceFront.fromJson(x))),
    driverLicenceback: json["driverLicenceback"] == null ? [] : List<DriverLicenceFront>.from(json["driverLicenceback"]!.map((x) => DriverLicenceFront.fromJson(x))),
    oneTimeCode: json["oneTimeCode"],
    v: json["__v"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );
  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "role": role,
    "phone": phone,
    "address": address,
    "privacyPolicyAccepted": privacyPolicyAccepted,
    "isAdmin": isAdmin,
    "isVerified": isVerified,
    "isDeleted": isDeleted,
    "isBlocked": isBlocked,
    "image": image == null ? [] : List<dynamic>.from(image!.map((x) => x.toJson())),
    "driverLicenceFront": driverLicenceFront == null ? [] : List<dynamic>.from(driverLicenceFront!.map((x) => x.toJson())),
    "driverLicenceback": driverLicenceback == null ? [] : List<dynamic>.from(driverLicenceback!.map((x) => x.toJson())),
    "oneTimeCode": oneTimeCode,
    "__v": v,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class DriverLicenceFront {
  String? publicFileUrl;
  String? path;

  DriverLicenceFront({
    this.publicFileUrl,
    this.path,
  });

  factory DriverLicenceFront.fromJson(Map<String, dynamic> json) => DriverLicenceFront(
    publicFileUrl: json["publicFileUrl"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "publicFileUrl": publicFileUrl,
    "path": path,
  };
}

class ServiceId {
  String? id;
  String? userId;
  List<DriverLicenceFront>? servicePhoto;
  String? category;
  String? helpName;
  String? address;
  dynamic latitude;
  dynamic longitude;
  String? helpDetails;
  int? rating;
  int? sellSOfServices;
  int? v;

  ServiceId({
    this.id,
    this.userId,
    this.servicePhoto,
    this.category,
    this.helpName,
    this.address,
    this.latitude,
    this.longitude,
    this.helpDetails,
    this.rating,
    this.sellSOfServices,
    this.v,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"],
    userId: json["userId"],
    servicePhoto: json["servicePhoto"] == null ? [] : List<DriverLicenceFront>.from(json["servicePhoto"]!.map((x) => DriverLicenceFront.fromJson(x))),
    category: json["category"],
    helpName: json["helpName"],
    address: json["address"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    helpDetails: json["helpDetails"],
    rating: json["rating"],
    sellSOfServices: json["sellSOfServices"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId,
    "servicePhoto": servicePhoto == null ? [] : List<dynamic>.from(servicePhoto!.map((x) => x.toJson())),
    "category": category,
    "helpName": helpName,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
    "helpDetails": helpDetails,
    "rating": rating,
    "sellSOfServices": sellSOfServices,
    "__v": v,
  };
}

class Pagination {
  int? currentPage;
  int? totalPages;
  dynamic nextPage;
  dynamic previousPage;
  int? totalItems;

  Pagination({
    this.currentPage,
    this.totalPages,
    this.nextPage,
    this.previousPage,
    this.totalItems,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json["currentPage"],
    totalPages: json["totalPages"],
    nextPage: json["nextPage"],
    previousPage: json["previousPage"],
    totalItems: json["totalItems"],
  );

  Map<String, dynamic> toJson() => {
    "currentPage": currentPage,
    "totalPages": totalPages,
    "nextPage": nextPage,
    "previousPage": previousPage,
    "totalItems": totalItems,
  };
}
