import 'package:wevr_app/features/user_dashboard/domain/entities/saved_apartment_entity.dart';

class SavedApartmentsModel extends SavedApartmentEntity {
  const SavedApartmentsModel({
    required super.apartments,
  });

  factory SavedApartmentsModel.fromJson(Map<String, dynamic> json) =>
      SavedApartmentsModel(
        apartments: (json['data'] as List)
            .map((apartmentJson) => DataModel.fromJson(apartmentJson))
            .toList(),
      );
}

class DataModel extends SavedApartments {
  const DataModel({
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

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json['id'],
        type: json['type'],
        userId: json['user_id'],
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

class InfoModel extends SavedInfo {
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
