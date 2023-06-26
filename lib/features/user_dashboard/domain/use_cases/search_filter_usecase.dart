import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/search_filter_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';

class SearchFilterUseCase {
  final HomeRepository homeRepository;

  SearchFilterUseCase({required this.homeRepository});

  Future<Either<Failure, List<SearchFilterEntity>>> call(
    int? type,
    int? minPrice,
    int? bedroom,
    int? baths,
    int? livingRoom,
    int? maxPrice,
  ) async {
    return await homeRepository.searchFilter(
      type,
      minPrice,
      bedroom,
      baths,
      livingRoom,
      maxPrice,
    );
  }
}
