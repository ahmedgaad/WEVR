import 'package:dartz/dartz.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';

import '../../../../core/errors/failures.dart';
import '../entities/saved_apartment_entity.dart';

class GetSavedApartmentsUseCase {
  final HomeRepository homeRepository;

  const GetSavedApartmentsUseCase({
    required this.homeRepository,
  });
  Future<Either<Failure, SavedApartmentEntity>> call()async{
    return await homeRepository.getSavedApartments();
  }
}
