import 'package:dartz/dartz.dart';
import 'package:wevr_app/core/errors/failures.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/search_entity.dart';
import 'package:wevr_app/features/user_dashboard/domain/repository/home_repository.dart';

class SearchUseCase {
  final HomeRepository homeRepository;

  SearchUseCase({required this.homeRepository});

  Future<Either<Failure, List<SearchResult>>> call({required String query}) async {
    return await homeRepository.searchApartments(query: query);
  }
}
