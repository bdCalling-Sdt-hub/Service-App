// class MoreInformationModel {
//   String? id;
//   String? name;
//   String? email;
//   String? role;
//   String? phone;
//   String? address;
//   bool? privacyPolicyAccepted;
//   bool? isAdmin;
//   bool? isVerified;
//   bool? isDeleted;
//   bool? isBlocked;
//   List<Null>? image;
//   List<Null>? driverLicenceFront;
//   List<Null>? driverLicenceback;
//   dynamic oneTimeCode;
//   int? v;
//   double? latitude;
//   double? longitude;
//
//
//   MoreInformationModel({this.id,
//     this.name,
//     this.email,
//     this.role,
//     this.phone,
//     this.address,
//     this.privacyPolicyAccepted,
//     this.isAdmin,
//     this.isVerified,
//     this.isDeleted,
//     this.isBlocked,
//     this.image,
//     this.driverLicenceFront,
//     this.driverLicenceback,
//     this.oneTimeCode,
//     this.v,
//     this.latitude,
//     this.longitude});
//
//   factory MoreInformationModel.fromJson(Map<String, dynamic> json) =>
//       MoreInformationModel(
//           id: json["_id"],
//           name: json["name"],
//           email: json["email"],
//           role: json["role"],
//           phone: json["phone"],
//           address: json["address"],
//           privacyPolicyAccepted: json["privacyPolicyAccepted"],
//           isAdmin: json["isAdmin"],
//           isVerified: json["isVerified"],
//           isDeleted: json["isDeleted"],
//           isBlocked: json["isBlocked"],
//           if (json['image'] != null) {
//   image = <Null>[];
//   json['image'].forEach((v) {
//   image!.add(new Null.fromJson(v));
//   });
//   }
//           if (
//    json['driverLicenceFront'] != null) {
//    driverLicenceFront = <Null>[];
//    json['driverLicenceFront'].forEach((v) {
//    driverLicenceFront!.add(new Null.fromJson(v));
//   });
//  }
//   if (json['driverLicenceback'] != null) {
//   driverLicenceback = <Null>[];
//   json['driverLicenceback'].forEach((v) {
//   driverLicenceback!.add(new Null.fromJson(v));
//   });
//   }
//   oneTimeCode = json['oneTimeCode'];
//   iV = json['__v'];
//   latitude = json['latitude'];
//   longitude = json['longitude'];
// );
//
//       Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//        "email": email,
//        "role": role,
//        "phone": phone,
//       "address": address,
//       "privacyPolicyAccepted": privacyPolicyAccepted,
//       "isAdmin": isAdmin,
//       "isVerified": isVerified,
//       "isDeleted": isDeleted,
//       "isBlocked": isBlocked,
//
// };
// }
//
//   class Image {
//   final dynamic path;
//   final String? publicFileUrl;
//
//   Image({
//   this.path,
//   this.publicFileUrl,
//   });
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//   path: json["path"],
//   publicFileUrl: json["publicFileURL"],
//   );
//
//   Map<String, dynamic> toJson() => {
//   "path": path,
//   "publicFileURL": publicFileUrl,
//   };
//   }
