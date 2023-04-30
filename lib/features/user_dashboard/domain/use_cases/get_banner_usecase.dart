import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/banners_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';

class GetBannersUseCase {

  final HomeRepo homeRepo;

  GetBannersUseCase({required this.homeRepo});

  Future<Either<Failure, List<Banners>>> call() async {
    return await homeRepo.getBanner();
  }
}