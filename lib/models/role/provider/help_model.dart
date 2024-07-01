class HelpModel {
  String? id;
  String? userId;
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
  });

  factory HelpModel.fromJson(Map<String, dynamic> json) => HelpModel(
    id: json["_id"],
    userId: json["userId"],
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
