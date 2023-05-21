import 'package:dartz/dartz.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';
import '../../../../core/errors/failures.dart';
import '../entities/save_apartment_entity.dart';

class SaveApartmentUsecCase{
  final HomeRepository homeRepository;

  SaveApartmentUsecCase({required this.homeRepository});

  Future<Either<Failure, SaveApartmentEntity>> call({required int id})async{
    return await homeRepository.saveApartment(id: id);
  }
}