import 'package:wevr_app/features/user_dashboard/domain/entities/search_filter_entity.dart';

class SearchFilterModel extends SearchFilterEntity {
  const SearchFilterModel({
    required super.id,
    required super.type,
    required super.userId,
    required super.vrLink,
    required super.location,
    required super.status,
    required super.dimensions,
    required super.description,
    // required super.features,
    required super.rating,
    required super.apartmentId,
    required super.monthPrice,
    required super.yearPrice,
    required super.livingRoom,
    required super.bedroom,
    required super.parking,
    required super.baths,
    required super.floors,
    required super.area,
    // required super.images,
  });

  factory SearchFilterModel.fromJson(Map<String, dynamic> json) =>
      SearchFilterModel(
        id: json['id'],
        type: json['type'],
        userId: json['user_id'],
        vrLink: json['vrlink'],
        location: json['location'],
        status: json['status'],
        dimensions: json['dimensions'],
        description: json['descrption'],
        // features: List<String>.from(json['features']),
        rating: json['rating'],
        apartmentId: json['apartment_id'],
        monthPrice: json['monthprice'],
        yearPrice: json['yearprice'],
        livingRoom: json['livingroom'],
        bedroom: json['bedroom'],
        parking: json['parking'],
        baths: json['baths'],
        floors: json['floors'],
        area: json['erea'],
        // images: List<String>.from(json['image']),
        // features: List<String>.from(json['features']),
      );
}
