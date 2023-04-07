import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../authentication/domain/use_cases/logout_usecase.dart';
import '../../screens/auction/auction_view.dart';
import '../../screens/explore/explore_view.dart';
import '../../screens/homes/homes_view.dart';
import '../../screens/saved/saved_view.dart';
import 'states.dart';

class HomeLayoutCubit extends Cubit<HomeLayOutStates> {
  final LogoutUseCase logoutUseCase;
  HomeLayoutCubit({required this.logoutUseCase})
      : super(HomeLayOutInitialState());
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



  // int currentIndex=0;
  int currentTap = 0;

  List<Widget> screens = const [
    ExploreView(),
    SavedView(),
    HomesView(),
    AuctionView(),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ExploreView();
  // void changeBottom(int index) {
  //   currentIndex = index;
  //   emit(ChangeBottomNavState());
  // }
}
