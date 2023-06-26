import 'package:wevr_app/features/user_dashboard/domain/entities/apartment_enitity.dart';

class ApartmentModel extends ApartmentEntity {
  const ApartmentModel({
    required super.apartments,
  });

  factory ApartmentModel.fromJson(Map<String, dynamic> json) => ApartmentModel(
        apartments: (json['data'] as List)
            .map((apartmentJson) => ApartmentsModel.fromJson(apartmentJson))
            .toList(),
      );
}

class ApartmentsModel extends Apartments {
  const ApartmentsModel({
    required super.id,
    required super.type,
    required super.userId,
    required super.vrlink,
    required super.location,
    required super.status,
    required super.descrption,
    required super.features,
    required super.rating,
    required super.info,
    required super.image,
  });

  factory ApartmentsModel.fromJson(Map<String, dynamic> json) {
    String type = json['type'];
    switch (type) {
      case '1':
        type = 'Apartment';
        break;
      case '2':
        type = 'Duplex';
        break;
      case '3':
        type = 'Villa';
        break;
      default:
    }
    return ApartmentsModel(
      id: json['id'],
      userId: json['user_id'],
      type: type,
      vrlink: json['vrlink'],
      location: json['location'],
      status: json['status'],
      descrption: json['descrption'],
      features: List<String>.from(json['features']),
      rating: json['rating'],
      info: InfoModel.fromJson(json['info']),
      image: List<String>.from(json['image']),
    );
  }
}

class InfoModel extends Info {
  const InfoModel({
    required super.monthprice,
    required super.yearprice,
    required super.livingroom,
    required super.bedroom,
    required super.parking,
    required super.baths,
    required super.floors,
    required super.erea,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        monthprice: json['monthprice'],
        yearprice: json['yearprice'],
        livingroom: json['livingroom'],
        bedroom: json['bedroom'],
        parking: json['parking'],
        baths: json['baths'],
        floors: json['floors'],
        erea: json['erea'],
      );
}
