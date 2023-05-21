import 'package:equatable/equatable.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/search_entity.dart';

import '../../../data/models/search_model.dart';

abstract class SearchStates extends Equatable {
  const SearchStates();

  @override
  List<Object?> get props => [];
}

class SearchInitialState extends SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchSuccessLoadedState extends SearchStates {
  final List<SearchResult> results;

  const SearchSuccessLoadedState({
    required this.results,
  });

  @override
  List<Object?> get props => [
        results,
      ];
}

class SearchErrorLoadedState extends SearchStates {
  final String error;

  const SearchErrorLoadedState({
    required this.error,
  });

  @override
  List<Object?> get props => [
        error,
      ];
}
