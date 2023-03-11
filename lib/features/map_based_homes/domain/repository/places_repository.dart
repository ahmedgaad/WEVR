import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/places.dart';

abstract class PlacesRepository {
  Future<Either<Failure, List<PlacesSuggestion>>> autoCompletePlacesOnSearch(
    String place,
    String sessionToken,
  );
}
