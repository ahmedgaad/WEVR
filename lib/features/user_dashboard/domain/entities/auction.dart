import 'package:equatable/equatable.dart';

class Auction extends Equatable{
  final String startingPrice;
  final String startDate;
  final String endDate;
  final Apartment apartment;

  const Auction({
    required this.startingPrice,
    required this.startDate,
    required this.endDate,
    required this.apartment
  });


@override
List<Object?> get props => [startingPrice, startDate, endDate, apartment];
}

class Apartment extends Equatable{
  final int id;
  final String location;
  final String image;
  final String type;

  
  const Apartment({
    required this.id,
    required this.location,
    required this.image,
    required this.type
  });

@override
List<Object?> get props => [id, location, image,type];
}