import 'package:equatable/equatable.dart';

class SaveApartmentEntity extends Equatable {
  final int status;
  final String massage;
  final int data;

  const SaveApartmentEntity({
    required this.status,
    required this.massage,
    required this.data,
  });

  @override
  List<Object?> get props => [
    status,
    massage,
    data,
  ];
}
