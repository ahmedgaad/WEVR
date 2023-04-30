import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/core/network/network_info.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/features/user_dashboard/data/data_sources/remote_datasource.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/banners_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/product_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';

import '../../../../core/errors/exceptions.dart';

class HomeRepositoryImpl implements HomeRepo {
  final HomeDataSource homeDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.homeDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
     if (await networkInfo.isConnected){
      try {
        final products = await homeDataSource.getProduct();
        return Right(products );
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
     } else{
      throw ServerException();
     }
  }

  @override
  Future<Either<Failure, List<Banners>>> getBanner() async {
    if (await networkInfo.isConnected){
      try {
        final banners = await homeDataSource.getBanner();
        return Right(banners);
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
    } else{
      throw ServerException();
    }
  }
}
