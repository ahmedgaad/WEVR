import 'package:equatable/equatable.dart';

class ApartmentEntity extends Equatable {
  final List<Apartments> apartments;

  const ApartmentEntity({
    required this.apartments,
  });

  @override
  List<Object?> get props => [apartments];
}

class Apartments extends Equatable {
  final int id;
  final String type;
  final String userId;
  final String vrlink;
  final String location;
  final String status;
  final String descrption;
  final List<String> features;
  final String rating;
  final Info info;
  final List<String> image;

  const Apartments({
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
        status,
        descrption,
        features,
        rating,
        info,
        image,
      ];
}

class Info extends Equatable {
  final String monthprice;
  final String yearprice;
  final String livingroom;
  final String bedroom;
  final String parking;
  final String baths;
  final String floors;
  final String erea;

  const Info({
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
