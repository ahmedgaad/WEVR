import 'package:dartz/dartz.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/save_apartment_entity.dart';
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

  Future<Either<Failure, List<SearchResult>>> searchApartments({required String query});
}
