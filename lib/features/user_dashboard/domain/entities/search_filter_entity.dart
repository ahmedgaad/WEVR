import 'package:equatable/equatable.dart';

class SearchFilterEntity extends Equatable {
  final String id;
  final String type;
  final String userId;
  final String vrLink;
  final String location;
  final String status;
  final String dimensions;
  final String description;
  // final List<String> features;
  final String rating;
  final String apartmentId;
  final String monthPrice;
  final String yearPrice;
  final String livingRoom;
  final String bedroom;
  final String parking;
  final String baths;
  final String floors;
  final String area;
  // final List<String> images;

  const SearchFilterEntity({
    required this.id,
    required this.type,
    required this.userId,
    required this.vrLink,
    required this.location,
    required this.status,
    required this.dimensions,
    required this.description,
    // required this.features,
    required this.rating,
    required this.apartmentId,
    required this.monthPrice,
    required this.yearPrice,
    required this.livingRoom,
    required this.bedroom,
    required this.parking,
    required this.baths,
    required this.floors,
    required this.area,
    // required this.images,
  });

  @override
  List<Object?> get props => [
    id,
    type,
    userId,
    vrLink,
    location,
    status,
    dimensions,
    description,
    // features,
    rating,
    apartmentId,
    monthPrice,
    yearPrice,
    livingRoom,
    bedroom,
    parking,
    baths,
    floors,
    area,
    // images,
  ];
}
