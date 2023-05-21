import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/features/user_dashboard/presentation/controller/search/states.dart';

import '../../../domain/use_cases/search_usecase.dart';

class SearchCubit extends Cubit<SearchStates> {
  final SearchUseCase searchUseCase;
  SearchCubit({required this.searchUseCase}) : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  var  searchController = TextEditingController();


  Future<void> search({required String query}) async {
    emit(SearchLoadingState());
    try {
      final searchResults = await searchUseCase.call(query: query);

      searchResults.fold((failure) {
        emit(SearchErrorLoadedState(error: failure.toString()));
        print(failure.message);
      },
            (results) {
        emit(SearchSuccessLoadedState(results: results));
        },);
    }catch (e) {
      emit(SearchErrorLoadedState(error: e.toString()));
    }
  }
}
