import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../authentication/domain/use_cases/logout_usecase.dart';
import '../../../domain/use_cases/get_apartment_use_case.dart';
import '../../../domain/use_cases/get_saved_apartments_usecase.dart';
import '../../screens/auction/auction_view.dart';
import '../../screens/explore/explore_view.dart';
import '../../screens/homes/homes_view.dart';
import '../../screens/saved/saved_view.dart';
import 'states.dart';

class HomeLayoutCubit extends Cubit<HomeLayOutStates> {
  final LogoutUseCase logoutUseCase;
  final GetApartmentUseCase getApartmentUseCase;
  // final SaveApartmentUsecCase saveApartmentUsecCase;
  final GetSavedApartmentsUseCase getSavedApartmentsUseCase;


  HomeLayoutCubit({
    // required this.saveApartmentUsecCase,
    required this.getApartmentUseCase,
    required this.logoutUseCase,
    required this.getSavedApartmentsUseCase,
  }) : super(HomeLayOutInitialState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  Future<void> logout({
    required String? token,
  }) async {
    final failureOrDelete = await logoutUseCase.call(
      token: token!,
    );

    failureOrDelete.fold(
      (failure) {
        emit(LogoutErrorState(error: failure.message));
      },
      (delete) {
        emit(LogoutSuccessfullyState(logout: delete));
      },
    );
  }

  Future<void> getApartment() async {
    emit(ApartmentLoadingState());
    try {
      final apartments = await getApartmentUseCase.call();
      apartments.fold(
        (failure) {
          emit(ApartmentErrorState(error: failure.toString()));
        },
        (apartments) {
          emit(ApartmentLoadedState(apartment: apartments));
        },
      );
    } catch (e) {
      emit(ApartmentErrorState(error: e.toString()));
    }
  }

  // Future<void> saveApartment({
  //   required int id,
  // }) async {
  //   try {
  //     final saveApartment = await saveApartmentUsecCase.call(id: id);
  //     saveApartment.fold((failure) {
  //       emit(ErrorApartmentSavedState(error: failure.toString()));
  //     }, (saveApartment) {
  //       emit(SuccessApartmentSavedState(saveApartment: saveApartment,));
  //     });
  //   } catch (e) {
  //     emit(ErrorApartmentSavedState(error: e.toString()));
  //   }
  // }

  Future<void> getSavedApartments() async {
    emit(SavedApartmentsLoadingStates());
    try {
      final apartments = await getSavedApartmentsUseCase.call();
      apartments.fold(
            (failure) {
          emit(SavedApartmentsErrorLoadedStates(error: failure.toString()));
        },
            (apartments) {
          emit(SavedApartmentsSuccessLoadedStates(savedApartments: apartments));
        },
      );
    } catch (e) {
      emit(SavedApartmentsErrorLoadedStates(error: e.toString()));
    }
  }
  // int currentIndex=0;
  int currentTap = 0;

  List<Widget> screens = const [
    ExploreView(),
    SavedView(),
    HomesView(),
    AuctionView(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const ExploreView();

  String? price;
}
