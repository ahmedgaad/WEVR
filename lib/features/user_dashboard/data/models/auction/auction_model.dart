import 'package:wevr_app/features/user_dashboard/domain/entities/auction.dart';

class AuctionModel extends Auction {
  const AuctionModel({
    required super.startingPrice,
    required super.startDate,
    required super.endDate,
    required super.apartment,
  });

  factory AuctionModel.fromJson(Map<String, dynamic> json) => AuctionModel(
        startingPrice: json['starting_price'],
        startDate: json['start_at'],
        endDate: json['end_at'],
        apartment: ApartmentModel.fromJson(json['apartment']),
      );
}

class ApartmentModel extends Apartment {
  const ApartmentModel({
    required super.id,
    required super.location,
    required super.image,
    required super.type,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) {
    String type = json['type'];
    switch (type) {
      case "1":
        type = "Single";
        break;
      case "2":
        type = "Duplex";
        break;
      case "3":
        type = "Villa";
        break;
      default:
        type = "";
    }
    return ApartmentModel(
      id: json['id'],
      location: json['location'],
      image: json['image'],
      type:type,
    );
  }
}
