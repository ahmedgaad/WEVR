import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/core/network/network_info.dart';
import 'package:wevr_app/features/user_dashboard/data/datasources/home_remote_datasource.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/apartment_enitity.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/save_apartment_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/saved_apartment_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/search_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/search_filter_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/strings_manager.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImplementation({
    required this.homeRemoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ApartmentEntity>> getApartment() async {
    if (await networkInfo.isConnected) {
      try {
        final apartment = await homeRemoteDataSource.getApartments();
        return Right(apartment);
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, SaveApartmentEntity>> saveApartment({
    required int id,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final saveResponse = await homeRemoteDataSource.saveApartment(id: id);
        return Right(saveResponse);
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
    }
    throw ServerException();
  }

  @override
  Future<Either<Failure, SavedApartmentEntity>> getSavedApartments() async {
    if (await networkInfo.isConnected) {
      try {
        final apartment = await homeRemoteDataSource.getSavedApartments();
        return Right(apartment);
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Either<Failure, List<SearchResult>>> searchApartments(
      {required String query}) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await homeRemoteDataSource.searchApartments(query: query);
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<Either<Failure, List<SearchFilterEntity>>> searchFilter(
      int? type,
      int? minPrice,
      int? bedroom,
      int? baths,
      int? livingRoom,
      int? maxPrice,
      ) async {
    if (await networkInfo.isConnected) {
      try{
        final result = await homeRemoteDataSource.searchFilter(type, minPrice, bedroom, baths, livingRoom, maxPrice);
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
    }
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, dynamic>> bookVisit({
    required int id,
    required DateTime datetime,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await homeRemoteDataSource.bookVisit(
          id: id,
          dateTime: datetime,
        );
        return Right(result);
      } on ServerException {
        return const Left(ServerFailure(StringsManager.SERVER_FAILURE_MESSAGE));
      }
    }
    throw UnimplementedError();
  }



// @override
// Future<Either<Failure, SaveApartmentEntity>> saveApartment({required ApartmentEntity apartment}) async{
//   if (await networkInfo.isConnected) {
//     try{
//       final saveApartment = homeRemoteDataSource.saveApartment(id: apartment.data.apartments[0].id);
//       return Right(saveApartment);
//     }
//   }
//   throw UnimplementedError();
// }
}
