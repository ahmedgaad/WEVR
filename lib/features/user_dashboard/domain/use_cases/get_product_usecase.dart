import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/product_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';

class GetProductUseCase {
  final HomeRepo homeRepo;

  GetProductUseCase( {required this.homeRepo});

  Future<Either<Failure, List<ProductEntity>>> call() async {
    return await homeRepo.getProduct();
  }
}
