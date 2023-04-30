import 'package:wevr_app/features/user_dashboard/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.type,
    required super.userId,
    required super.vrLink,
    required super.location,
    required super.status,
    required super.dimensions,
    required super.description,
    required super.features,
    required super.rating,
    required super.gallery,
    required super.monthPrice,
    required super.yearPrice,
    required super.livingRoom,
    required super.bedRoom,
    required super.parking,
    required super.baths,
    required super.floors,
    required super.erea,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['data']['data'][0]['id'],
      type: json['data']['data'][0]['type'],
      userId: json['data']['data'][0]['user_id'],
      vrLink: json['data']['data'][0]['vrlink'],
      location: json['data']['data'][0]['location'],
      status: json['data']['data'][0]['status'],
      dimensions: json['data']['data'][0]['dimensions'],
      description: json['data']['data'][0]['description'],
      features: List<String>.from(json['data']['data'][0]['features'].map((x) => x.toString())),
      rating: json['data']['data'][0]['rating'],
      gallery: List<String>.from(
          json['data']['data'][0]['gallary']['image'].map((image) => image.toString())),
      monthPrice: json['data']['data'][0]['info']['monthprice'],
      yearPrice: json['data']['data'][0]['info']['yearprice'],
      livingRoom: json['data']['data'][0]['info']['livingroom'],
      bedRoom: json['data']['data'][0]['info']['bedroom'],
      parking: json['data']['data'][0]['info']['parking'],
      baths: json['data']['data'][0]['info']['baths'],
      floors: json['data']['data'][0]['info']['floors'],
      erea: json['data']['data'][0]['info']['erea'],
    );
  }
}
