import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../repository/home_repository.dart';

class BookVisitUseCase {
  final HomeRepository homeRepository;

  BookVisitUseCase({
    required this.homeRepository,
  });

  Future<Either<Failure, dynamic>> call({
    required int id,
    required DateTime dateTime,
  }) {
    return homeRepository.bookVisit(
      id: id,
      datetime: dateTime,
    );
  }
}
