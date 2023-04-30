import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String type;
  final String userId;
  final String vrLink;
  final String location;
  final String status;
  final String dimensions;
  final String description;
  final String monthPrice;
  final String yearPrice;
  final String livingRoom;
  final String bedRoom;
  final String parking;
  final String baths;
  final String floors;
  final String erea;
  final List<String> features;
  final String rating;
  final List<String> gallery;

  const ProductEntity({
    required this.monthPrice,
    required this.yearPrice,
    required this.livingRoom,
    required this.bedRoom,
    required this.parking,
    required this.baths,
    required this.floors,
    required this.erea,
    required this.id,
    required this.type,
    required this.userId,
    required this.vrLink,
    required this.location,
    required this.status,
    required this.dimensions,
    required this.description,
    required this.features,
    required this.rating,
    required this.gallery,
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
        features,
        rating,
        gallery,
        monthPrice,
        yearPrice,
        livingRoom,
        bedRoom,
        parking,
        baths,
        floors,
        erea,
      ];
}
