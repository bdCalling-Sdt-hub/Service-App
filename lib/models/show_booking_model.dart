class ShowBookingModel {
  String? status;
  int? statusCode;
  String? message;
  Data? data;

  ShowBookingModel({
    this.status,
    this.statusCode,
    this.message,
    this.data,
  });

  factory ShowBookingModel.fromJson(Map<String, dynamic> json) {
    return ShowBookingModel(
      status: json['status'],
      statusCode: json['statusCode'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Attributes? attributes;

  Data({
    this.attributes,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      attributes: json['attributes'] != null ? Attributes.fromJson(json['attributes']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    return data;
  }
}

class Attributes {
  String? address;
  int? totalBooking;
  int? complitedBooking;
  int? cancelledBooking;

  Attributes({
    this.address,
    this.totalBooking,
    this.complitedBooking,
    this.cancelledBooking,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      address: json['address'],
      totalBooking: json['totalBooking'],
      complitedBooking: json['complitedBooking'],
      cancelledBooking: json['cancelledBooking'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['totalBooking'] = this.totalBooking;
    data['complitedBooking'] = this.complitedBooking;
    data['cancelledBooking'] = this.cancelledBooking;
    return data;
  }
}
