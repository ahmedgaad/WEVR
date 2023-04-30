import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  final int status;
  final String message;
  final String id;
  final String image;
  final String beforeDiscountPrice;
  final String discountPrice;

  const Banners({
    required this.status,
    required this.message,
    required this.id,
    required this.image,
    required this.discountPrice,
    required this.beforeDiscountPrice,
  });

  @override
  List<Object?> get props => [
    status,
    message,
    id,
    image,
    discountPrice,
    beforeDiscountPrice,];
}
