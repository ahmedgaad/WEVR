import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/domain/usecases/logout.dart';

import '../../../../core/components/components.dart';
import '../../../../data/data_sources/local_data_source/cache_helper.dart';
import '../../auction/auction_view.dart';
import '../../explore/explore_view.dart';
import '../../get_started/get_started_view.dart';
import '../../homes/homes_view.dart';
import '../../saved/saved_view.dart';
import 'states.dart';

class HomeLayOutCubit extends Cubit<HomeLayOutStates> {
  final LogoutUseCase logoutUseCase;
  HomeLayOutCubit(
      {
    required this.logoutUseCase,
  }
  ) : super(HomeLayOutInitialState());

  static HomeLayOutCubit get(context) => BlocProvider.of(context);

  void logout(String token) async{
    var response = await logoutUseCase(token);

  }

  void signOut(context) {
    CacheHelper.removeData(key: 'token').then((value) {
      navigatePush(context, const GetStartedView());
    });
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
