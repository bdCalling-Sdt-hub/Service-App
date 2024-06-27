class BookingDetailsModel {
  String id;
  Provider provider;
  User user;
  String selectHelp;
  String helpDescription;
  String status;
  String offerStatus;
  double price;
  DateTime createdAt;
  DateTime updatedAt;

  BookingDetailsModel({
    required this.id,
    required this.provider,
    required this.user,
    required this.selectHelp,
    required this.helpDescription,
    required this.status,
    required this.offerStatus,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookingDetailsModel.fromJson(Map<String, dynamic> json) {
    return BookingDetailsModel(
      id: json['_id'],
      provider: Provider.fromJson(json['provider']),
      user: User.fromJson(json['user']),
      selectHelp: json['selectHelp'],
      helpDescription: json['helpDescription'],
      status: json['status'],
      offerStatus: json['offerStatus'],
      price: json['price'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class Provider {
  String id;
  String name;
  String email;
  String role;
  String phone;
  String address;
  bool privacyPolicyAccepted;
  bool isAdmin;
  bool isVerified;
  bool isDeleted;
  bool isBlocked;
  List<ImageData> image;
  List<ImageData> driverLicenceFront;
  List<ImageData> driverLicenceBack;
  double latitude;
  double longitude;

  Provider({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
    required this.address,
    required this.privacyPolicyAccepted,
    required this.isAdmin,
    required this.isVerified,
    required this.isDeleted,
    required this.isBlocked,
    required this.image,
    required this.driverLicenceFront,
    required this.driverLicenceBack,
    required this.latitude,
    required this.longitude,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      phone: json['phone'],
      address: json['address'],
      privacyPolicyAccepted: json['privacyPolicyAccepted'],
      isAdmin: json['isAdmin'],
      isVerified: json['isVerified'],
      isDeleted: json['isDeleted'],
      isBlocked: json['isBlocked'],
      image: (json['image'] as List).map((i) => ImageData.fromJson(i)).toList(),
      driverLicenceFront: (json['driverLicenceFront'] as List).map((i) => ImageData.fromJson(i)).toList(),
      driverLicenceBack: (json['driverLicenceback'] as List).map((i) => ImageData.fromJson(i)).toList(),
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
    );
  }
}

class User {
  String id;
  String name;
  String email;
  String role;
  String phone;
  String address;
  double latitude;
  double longitude;
  bool privacyPolicyAccepted;
  bool isAdmin;
  bool isVerified;
  bool isDeleted;
  bool isBlocked;

  User({
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
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      phone: json['phone'],
      address: json['address'],
      latitude: json['latitude'].toDouble(),
      longitude: json['longitude'].toDouble(),
      privacyPolicyAccepted: json['privacyPolicyAccepted'],
      isAdmin: json['isAdmin'],
      isVerified: json['isVerified'],
      isDeleted: json['isDeleted'],
      isBlocked: json['isBlocked'],
    );
  }
}

class ImageData {
  String publicFileUrl;
  String path;

  ImageData({
    required this.publicFileUrl,
    required this.path,
  });

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      publicFileUrl: json['publicFileUrl'],
      path: json['path'],
    );
  }
}
