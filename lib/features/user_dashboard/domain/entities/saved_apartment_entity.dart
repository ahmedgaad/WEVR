import 'package:equatable/equatable.dart';

class SavedApartmentEntity extends Equatable {
  final List<SavedApartments> apartments;

  const SavedApartmentEntity({
    required this.apartments,
  });

  @override
  List<Object?> get props => [apartments];
}

class SavedApartments extends Equatable {
  final int id;
  final String type;
  final String userId;
  final String vrlink;
  final String location;
  final String status;
  final String descrption;
  final List<String> features;
  final String rating;
  final SavedInfo info;
  final List<String> image;

  const SavedApartments({
    required this.id,
    required this.type,
    required this.userId,
    required this.vrlink,
    required this.location,
    required this.status,
    required this.descrption,
    required this.features,
    required this.rating,
    required this.info,
    required this.image,
  });

  @override
  List<Object?> get props => [
    id,
    type,
    userId,
    vrlink,
    location,
    // status,
    // descrption,
    // features,
    // rating,
    // info,
    // image,
  ];
}

class SavedInfo extends Equatable {
  final String monthprice;
  final String yearprice;
  final String livingroom;
  final String bedroom;
  final String parking;
  final String baths;
  final String floors;
  final String erea;

  const SavedInfo({
    required this.monthprice,
    required this.yearprice,
    required this.livingroom,
    required this.bedroom,
    required this.parking,
    required this.baths,
    required this.floors,
    required this.erea,
  });

  @override
  List<Object?> get props => [
    monthprice,
    yearprice,
    livingroom,
    bedroom,
    parking,
    baths,
    floors,
    erea,
  ];
}
