import '../../domain/entities/save_apartment_entity.dart';

class SaveApartmentModel extends SaveApartmentEntity {
  const SaveApartmentModel({
    required super.status,
    required super.massage,
    required super.data,
  });

  factory SaveApartmentModel.fromJson(Map<String, dynamic> json) =>
      SaveApartmentModel(
        status: json['status'],
        massage: json['massage'],
        data: json['data'],
      );
}
