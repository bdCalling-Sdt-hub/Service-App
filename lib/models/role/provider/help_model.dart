//
//
// class HelpModel {
//   String? id;
//   String? userId;
//   List<ServicePhoto>? servicePhoto;
//   String? category;
//   String? helpName;
//   String? address;
//   double? latitude;
//   double? longitude;
//   String? helpDetails;
//   double? rating;
//   String? distance;
//   int? sellSOfServices;
//   int? v;
//
//   HelpModel({
//     this.id,
//     this.userId,
//     this.servicePhoto,
//     this.category,
//     this.helpName,
//     this.address,
//     this.latitude,
//     this.distance,
//     this.longitude,
//     this.helpDetails,
//     this.rating,
//     this.sellSOfServices,
//     this.v,
//   });
//
//   factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
//     id: json["_id"],
//     userId: json["userId"],
//     servicePhoto: json["servicePhoto"] == null ? [] : List<ServicePhoto>.from(json["servicePhoto"]!.map((x) => ServicePhoto.fromJson(x))),
//     category: json["category"],
//     helpName: json["helpName"],
//     distance: json["distance"],
//     address: json["address"],
//     latitude: json["latitude"]?.toDouble(),
//     longitude: json["longitude"]?.toDouble(),
//     helpDetails: json["helpDetails"],
//     rating: json["rating"]?.toDouble(),
//     sellSOfServices: json["sellSOfServices"],
//     v: json["__v"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "userId": userId,
//     "servicePhoto": servicePhoto == null ? [] : List<dynamic>.from(servicePhoto!.map((x) => x.toJson())),
//     "category": category,
//     "helpName": helpName,
//     "address": address,
//     "distance": distance,
//     "latitude": latitude,
//     "longitude": longitude,
//     "helpDetails": helpDetails,
//     "rating": rating,
//     "sellSOfServices": sellSOfServices,
//     "__v": v,
//   };
// }
//
// class ServicePhoto {
//   String? publicFileUrl;
//   String? path;
//
//   ServicePhoto({
//     this.publicFileUrl,
//     this.path,
//   });
//
//   factory ServicePhoto.fromJson(Map<String, dynamic> json) => ServicePhoto(
//     publicFileUrl: json["publicFileUrl"],
//     path: json["path"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "publicFileUrl": publicFileUrl,
//     "path": path,
//   };
// }
//
// class Pagination {
//   int? currentPage;
//   int? totalPages;
//   dynamic nextPage;
//   dynamic previousPage;
//   int? totalItems;
//
//   Pagination({
//     this.currentPage,
//     this.totalPages,
//     this.nextPage,
//     this.previousPage,
//     this.totalItems,
//   });
//
//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//     currentPage: json["currentPage"],
//     totalPages: json["totalPages"],
//     nextPage: json["nextPage"],
//     previousPage: json["previousPage"],
//     totalItems: json["totalItems"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "currentPage": currentPage,
//     "totalPages": totalPages,
//     "nextPage": nextPage,
//     "previousPage": previousPage,
//     "totalItems": totalItems,
//   };
// }

// To parse this JSON data, do
//
//     final helpModel = helpModelFromJson(jsonString);



class HelpModel {
  String? id;
  UserId? userId;
  List<ServicePhoto>? servicePhoto;
  String? category;
  String? helpName;
  String? address;
  double? latitude;
  double? longitude;
  String? helpDetails;
  double? rating;
  int? sellSOfServices;
  int? v;
  String? distance;

  HelpModel({
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
    this.distance,
  });

  factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
    id: json["_id"],
    userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
    servicePhoto: json["servicePhoto"] == null ? [] : List<ServicePhoto>.from(json["servicePhoto"]!.map((x) => ServicePhoto.fromJson(x))),
    category: json["category"],
    helpName: json["helpName"],
    address: json["address"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    helpDetails: json["helpDetails"],
    rating: json["rating"]?.toDouble(),
    sellSOfServices: json["sellSOfServices"],
    v: json["__v"],
    distance: json["distance"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userId": userId?.toJson(),
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
    "distance": distance,
  };
}

class ServicePhoto {
  String? publicFileUrl;
  String? path;

  ServicePhoto({
    this.publicFileUrl,
    this.path,
  });

  factory ServicePhoto.fromJson(Map<String, dynamic> json) => ServicePhoto(
    publicFileUrl: json["publicFileUrl"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "publicFileUrl": publicFileUrl,
    "path": path,
  };
}

class UserId {
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
  List<ServicePhoto>? image;
  List<ServicePhoto>? driverLicenceFront;
  List<ServicePhoto>? driverLicenceback;
  dynamic oneTimeCode;
  int? v;
  double? latitude;
  double? longitude;

  UserId({
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

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
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
    image: json["image"] == null ? [] : List<ServicePhoto>.from(json["image"]!.map((x) => ServicePhoto.fromJson(x))),
    driverLicenceFront: json["driverLicenceFront"] == null ? [] : List<ServicePhoto>.from(json["driverLicenceFront"]!.map((x) => ServicePhoto.fromJson(x))),
    driverLicenceback: json["driverLicenceback"] == null ? [] : List<ServicePhoto>.from(json["driverLicenceback"]!.map((x) => ServicePhoto.fromJson(x))),
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

