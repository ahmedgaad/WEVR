import 'package:equatable/equatable.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/save_apartment_entity.dart';

import '../../../domain/entities/saved_apartment_entity.dart';

abstract class SaveApartmentState extends Equatable{}

class SaveInitialState extends SaveApartmentState{
  @override
  List<Object?> get props => [];
}

class SaveLoadingState extends SaveApartmentState{
  @override
  List<Object?> get props => [];
}

class SaveSuccessState extends SaveApartmentState{
  final SaveApartmentEntity saveApartmentEntity;

  SaveSuccessState(this.saveApartmentEntity);

  @override
  List<Object?> get props => [saveApartmentEntity];
}

class SaveErrorState extends SaveApartmentState{
  final String error;

  SaveErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class SavedApartmentsLoadingStates extends SaveApartmentState {
  @override
  List<Object?> get props => [];
}

class SavedApartmentsSuccessLoadedStates extends SaveApartmentState {
  final SavedApartmentEntity savedApartments;

  SavedApartmentsSuccessLoadedStates({required this.savedApartments});



  @override
  List<Object?> get props => [savedApartments];
}

class SavedApartmentsErrorLoadedStates extends SaveApartmentState {
  final String error;

  SavedApartmentsErrorLoadedStates({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}