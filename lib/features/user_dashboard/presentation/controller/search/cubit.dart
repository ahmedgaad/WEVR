import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/states.dart';

import '../../../domain/use_cases/search_filter_usecase.dart';
import '../../../domain/use_cases/search_usecase.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchUseCase searchUseCase;

  final SearchFilterUseCase searchFilterUseCase;

  SearchCubit({
    required this.searchUseCase,
    required this.searchFilterUseCase,
  }) : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  var searchController = TextEditingController();

  Future<void> search({required String query}) async {
    emit(SearchLoadingState());
    try {
      final searchResults = await searchUseCase.call(query: query);

      searchResults.fold(
        (failure) {
          emit(SearchErrorLoadedState(error: failure.toString()));
          print(failure.message);
        },
        (results) {
          emit(SearchSuccessLoadedState(results: results));
        },
      );
    } catch (e) {
      emit(SearchErrorLoadedState(error: e.toString()));
    }
  }

  Future<void> searchFilter(
    int? type,
    int? minPrice,
    int? bedroom,
    int? baths,
    int? livingRoom,
    int? maxPrice,
  ) async {
    emit(SearchFilterLoadingState());
    try {
      final searchResults = await searchFilterUseCase.call(
        type,
        minPrice,
        bedroom,
        baths,
        livingRoom,
        maxPrice,
      );

      searchResults.fold(
        (failure) {
          emit(SearchFilterErrorLoadedState(error: failure.toString()));
          print(failure.message);
        },
        (results) {
          emit(SearchFilterSuccessLoadedState(results: results));
        },
      );
    } catch (e) {
      emit(SearchFilterErrorLoadedState(error: e.toString()));
    }
  }
}
