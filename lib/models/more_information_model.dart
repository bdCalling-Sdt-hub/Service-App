class InformationModel {
  final String id;
  final String name;
  final String email;
  final String role;
  final String phone;
  final String address;
  final double latitude;
  final double longitude;
  final bool privacyPolicyAccepted;
  final bool isAdmin;
  final bool isVerified;
  final bool isDeleted;
  final bool isBlocked;
  final List<dynamic> image;
  final List<dynamic> driverLicenceFront;
  final List<dynamic> driverLicenceBack;
  final dynamic oneTimeCode;
  final int version;

  InformationModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.privacyPolicyAccepted,
    required this.isAdmin,
    required this.isVerified,
    required this.isDeleted,
    required this.isBlocked,
    required this.image,
    required this.driverLicenceFront,
    required this.driverLicenceBack,
    required this.oneTimeCode,
    required this.version,
  });

  factory InformationModel.fromJson(Map<String, dynamic> json) {
    return InformationModel(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      phone: json['phone'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      privacyPolicyAccepted: json['privacyPolicyAccepted'],
      isAdmin: json['isAdmin'],
      isVerified: json['isVerified'],
      isDeleted: json['isDeleted'],
      isBlocked: json['isBlocked'],
      image: List<dynamic>.from(json['image']),
      driverLicenceFront: List<dynamic>.from(json['driverLicenceFront']),
      driverLicenceBack: List<dynamic>.from(json['driverLicenceback']),
      oneTimeCode: json['oneTimeCode'],
      version: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'role': role,
      'phone': phone,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'privacyPolicyAccepted': privacyPolicyAccepted,
      'isAdmin': isAdmin,
      'isVerified': isVerified,
      'isDeleted': isDeleted,
      'isBlocked': isBlocked,
      'image': image,
      'driverLicenceFront': driverLicenceFront,
      'driverLicenceback': driverLicenceBack,
      'oneTimeCode': oneTimeCode,
      '__v': version,
    };
  }
}


class Image {
  final dynamic path;
  final String? publicFileUrl;

  Image({
  this.path,
  this.publicFileUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
  path: json["path"],
  publicFileUrl: json["publicFileURL"],
  );

  Map<String, dynamic> toJson() => {
  "path": path,
  "publicFileURL": publicFileUrl,
  };
  }
