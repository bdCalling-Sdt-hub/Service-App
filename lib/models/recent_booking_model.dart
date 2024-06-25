class RecentBookingModel {
  final String id;
  final String provider;
  final String user;
  final String selectHelp;
  final String helpDescription;
  final String status;
  final String offerStatus;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? v;

  RecentBookingModel({
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
    this.v,
  });

  factory RecentBookingModel.fromJson(Map<String, dynamic> json) {
    return RecentBookingModel(
      id: json['_id'],
      provider: json['provider'],
      user: json['user'],
      selectHelp: json['selectHelp'],
      helpDescription: json['helpDescription'],
      status: json['status'],
      offerStatus: json['offerStatus'],
      price: json['price'].toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json["__v"],
    );
  }


  Map<String,dynamic> toJson() => {
    "_id": id,
    "provider": provider,
    "user": user,
    "selectHelp": selectHelp,
    "helpDescription": helpDescription,
    "status": status,
    "offerStatus": offerStatus,
    "price": price,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
  };

}
