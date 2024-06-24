class ShowBookingModel {
  final String address;
  final int totalBooking;
  final int completedBooking;
  final int cancelledBooking;

  ShowBookingModel({
    required this.address,
    required this.totalBooking,
    required this.completedBooking,
    required this.cancelledBooking,
  });

  factory ShowBookingModel.fromJson(Map<String, dynamic> json) {
    return ShowBookingModel(
      address: json['address'],
      totalBooking: json['totalBooking'],
      completedBooking: json['completedBooking'],
      cancelledBooking: json['cancelledBooking'],
    );

  }

  Map<String,dynamic> toJson() => {
    "address": address,
    "totalBooking": totalBooking,
    "completedBooking": completedBooking,
    "cancelledBooking": cancelledBooking,
  };

}
