import 'package:equatable/equatable.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/apartment_enitity.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/save_apartment_entity.dart';
import '../../../../authentication/domain/entities/logout.dart';
import '../../../domain/entities/saved_apartment_entity.dart';

abstract class HomeLayOutStates extends Equatable {
  const HomeLayOutStates();

  @override
  List<Object?> get props => [];
}

class HomeLayOutInitialState extends HomeLayOutStates {}

class ChangeBottomNavState extends HomeLayOutStates {}

class ChangeFavState extends HomeLayOutStates {}

class BookingSuccess extends HomeLayOutStates {}

class BookingFailed extends HomeLayOutStates {}

class LogoutSuccessfullyState extends HomeLayOutStates {
  final Logout logout;

  const LogoutSuccessfullyState({required this.logout});
}

class LogoutErrorState extends HomeLayOutStates {
  final String error;

  const LogoutErrorState({required this.error});
}

class ApartmentLoadingState extends HomeLayOutStates {}

class ApartmentLoadedState extends HomeLayOutStates {
  final ApartmentEntity apartment;

  const ApartmentLoadedState({
    required this.apartment,
  });
}

class ApartmentErrorState extends HomeLayOutStates {
  final String error;

  const ApartmentErrorState({
    required this.error,
  });
}

class SuccessApartmentSavedState extends HomeLayOutStates {
  final SaveApartmentEntity saveApartment;

  const SuccessApartmentSavedState({
    required this.saveApartment,
  });
}

class ErrorApartmentSavedState extends HomeLayOutStates {
  final String error;

  const ErrorApartmentSavedState({
    required this.error,
  });
}

class SavedApartmentsLoadingStates extends HomeLayOutStates {}

class SavedApartmentsSuccessLoadedStates extends HomeLayOutStates {
  final SavedApartmentEntity savedApartments;

  const SavedApartmentsSuccessLoadedStates({
    required this.savedApartments,
  });

  @override
  List<Object?> get props => [savedApartments];
}

class SavedApartmentsErrorLoadedStates extends HomeLayOutStates {
  final String error;

  const SavedApartmentsErrorLoadedStates({
    required this.error,
  });
}
