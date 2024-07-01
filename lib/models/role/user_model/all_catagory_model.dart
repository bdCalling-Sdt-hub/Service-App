

class UserAllCategoryModel {
  String? id;
  String? name;
  List<CatagoryIcon>? catagoryIcon;
  bool? isDelete;
  int? v;

  UserAllCategoryModel({
    this.id,
    this.name,
    this.catagoryIcon,
    this.isDelete,
    this.v,
  });

  factory UserAllCategoryModel.fromJson(Map<String, dynamic> json) => UserAllCategoryModel(
    id: json["_id"],
    name: json["name"],
    catagoryIcon: json["catagoryIcon"] == null ? [] : List<CatagoryIcon>.from(json["catagoryIcon"]!.map((x) => CatagoryIcon.fromJson(x))),
    isDelete: json["isDelete"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "catagoryIcon": catagoryIcon == null ? [] : List<dynamic>.from(catagoryIcon!.map((x) => x.toJson())),
    "isDelete": isDelete,
    "__v": v,
  };
}

class CatagoryIcon {
  String? publicFileUrl;
  String? path;

  CatagoryIcon({
    this.publicFileUrl,
    this.path,
  });

  factory CatagoryIcon.fromJson(Map<String, dynamic> json) => CatagoryIcon(
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

