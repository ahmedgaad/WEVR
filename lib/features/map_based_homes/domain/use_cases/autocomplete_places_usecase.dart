import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/places.dart';
import '../repository/places_repository.dart';

class AutoCompletePlacesUsecase {
  final PlacesRepository autoCompletePlacesRepo;

  AutoCompletePlacesUsecase(this.autoCompletePlacesRepo);

  Future<Either<Failure, List<PlacesSuggestion>>> call(
    String place,
    String sessionToken,
  ) async {
    return await autoCompletePlacesRepo.autoCompletePlacesOnSearch(
      place,
      sessionToken,
    );
  }
}
