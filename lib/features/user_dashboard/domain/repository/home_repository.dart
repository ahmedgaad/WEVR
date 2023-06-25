import 'package:dartz/dartz.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/save_apartment_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/search_filter_entity.dart';
import '../../../../core/errors/failures.dart';
import '../entities/apartment_enitity.dart';
import '../entities/saved_apartment_entity.dart';
import '../entities/search_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, ApartmentEntity>> getApartment();

  Future<Either<Failure, SaveApartmentEntity>> saveApartment({
    required int id,
  });

  Future<Either<Failure, SavedApartmentEntity>> getSavedApartments();

  Future<Either<Failure, List<SearchResult>>> searchApartments(
      {required String query});

  Future<Either<Failure, dynamic>> bookVisit({
    required int id,
    required DateTime datetime,
  });

  Future<Either<Failure, List<SearchFilterEntity>>> searchFilter(
    int? type,
    int? minPrice,
    int? bedroom,
    int? baths,
    int? livingRoom,
    int? maxPrice,
  );
}
