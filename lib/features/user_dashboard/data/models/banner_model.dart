import 'package:wevr_app/features/user_dashboard/domain/entities/banners_entity.dart';

class BannerModel extends Banners{
  const BannerModel({
    required super.status,
    required super.message,
    required super.id,
    required super.image,
    required super.discountPrice,
    required super.beforeDiscountPrice,
  });
  factory BannerModel.fromJson(Map<String,dynamic> json) => BannerModel(
      status: json['status'],
      message: json['message'],
      id: json['data']['id'],
      image: json['data']['image'],
      discountPrice: json['data']['price_after_discount'],
      beforeDiscountPrice: json['data']['price_before_discount'],
  );
}