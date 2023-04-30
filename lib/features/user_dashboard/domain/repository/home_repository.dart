import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import '../entities/banners_entity.dart';
import '../entities/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<ProductEntity>>> getProduct();

  Future<Either<Failure, List<Banners>>> getBanner();
}
