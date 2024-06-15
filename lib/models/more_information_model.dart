class MoreInformationModel {
  String? status;
  int? statusCode;
  String? message;
  Data? data;

  MoreInformationModel({this.status, this.statusCode, this.message, this.data});

  MoreInformationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['statusCode'] = statusCode;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Attributes? attributes;

  Data({this.attributes});

  Data.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
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
  List<Image>? image;
  // List<DriverLicenceFront>? driverLicenceFront;
  // List<DriverLicenceback>? driverLicenceback;
  Null oneTimeCode;
  int? iV;

  Attributes(
      {this.id,
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
        // this.driverLicenceFront,
        // this.driverLicenceback,
        this.oneTimeCode,
        this.iV});

  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    email = json['email'];
    role = json['role'];
    phone = json['phone'];
    address = json['address'];
    privacyPolicyAccepted = json['privacyPolicyAccepted'];
    isAdmin = json['isAdmin'];
    isVerified = json['isVerified'];
    isDeleted = json['isDeleted'];
    isBlocked = json['isBlocked'];
    if (json['image'] != null) {
      image = <Image>[];
      json['image'].forEach((v) {
        image!.add(new Image.fromJson(v));
      });
    }
    // if (json['driverLicenceFront'] != null) {
    //   driverLicenceFront = <DriverLicenceFront>[];
    //   json['driverLicenceFront'].forEach((v) {
    //     driverLicenceFront!.add(new DriverLicenceFront.fromJson(v));
    //   });
    // }
    // if (json['driverLicenceback'] != null) {
    //   driverLicenceback = <DriverLicenceback>[];
    //   json['driverLicenceback'].forEach((v) {
    //     driverLicenceback!.add(new DriverLicenceback.fromJson(v));
    //   });
    // }
    oneTimeCode = json['oneTimeCode'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['privacyPolicyAccepted'] = this.privacyPolicyAccepted;
    data['isAdmin'] = this.isAdmin;
    data['isVerified'] = this.isVerified;
    data['isDeleted'] = this.isDeleted;
    data['isBlocked'] = this.isBlocked;
    if (this.image != null) {
      data['image'] = this.image!.map((v) => v.toJson()).toList();
    }
    // if (driverLicenceFront != null) {
    //   data['driverLicenceFront'] =
    //       driverLicenceFront!.map((v) => v.toJson()).toList();
    // }
    // if (driverLicenceback != null) {
    //   data['driverLicenceback'] =
    //       driverLicenceback!.map((v) => v.toJson()).toList();
    // }
    data['oneTimeCode'] = oneTimeCode;
    data['__v'] = iV;
    return data;
  }
}

class Image {
  String? publicFileUrl;
  String? path;

  Image({this.publicFileUrl, this.path});

  Image.fromJson(Map<String, dynamic> json) {
    publicFileUrl = json['publicFileUrl'];
    path = json['path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['publicFileUrl'] = publicFileUrl;
    data['path'] = path;
    return data;
  }
}
