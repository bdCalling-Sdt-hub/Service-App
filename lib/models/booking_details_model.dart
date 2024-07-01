
class BookingDetailsModel {
  String? id;
  Provider? provider;
  Provider? user;
  String? serviceId;
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

  BookingDetailsModel({
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

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) => BookingDetailsModel(
    id: json["_id"],
    provider: json["provider"] == null ? null : Provider.fromJson(json["provider"]),
    user: json["user"] == null ? null : Provider.fromJson(json["user"]),
    serviceId: json["serviceId"],
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
    "user": user?.toJson(),
    "serviceId": serviceId,
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
  double? latitude;
  double? longitude;
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

  Provider({
    this.id,
    this.name,
    this.email,
    this.role,
    this.phone,
    this.address,
    this.latitude,
    this.longitude,
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
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    phone: json["phone"],
    address: json["address"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
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
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "role": role,
    "phone": phone,
    "address": address,
    "latitude": latitude,
    "longitude": longitude,
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
