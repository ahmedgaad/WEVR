import 'package:dartz/dartz.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';
import '../../../../core/errors/failures.dart';
import '../entities/apartment_enitity.dart';

class GetApartmentUseCase{
  final HomeRepository homeRepository;

  GetApartmentUseCase({required this.homeRepository});

  Future<Either<Failure, ApartmentEntity>> call() async{
    return await homeRepository.getApartment();
  }
}