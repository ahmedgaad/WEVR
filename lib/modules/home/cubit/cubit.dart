import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auction/auction_view.dart';
import '../../explore/explore_view.dart';
import 'states.dart';
import '../../homes/homes_view.dart';
import '../../saved/saved_view.dart';
class HomeLayOutCubit extends Cubit<HomeLayOutStates>{
  HomeLayOutCubit() : super(HomeLayOutInitialState());

  static HomeLayOutCubit get(context)=> BlocProvider.of(context);

  // int currentIndex=0;
  int currentTap =0;

  List<Widget> screens = const[
    ExploreView(),
    SavedView(),
    HomesView(),
    AuctionView(),
  ];
  final PageStorageBucket bucket= PageStorageBucket();
  Widget currentScreen = ExploreView();
  // void changeBottom(int index) {
  //   currentIndex = index;
  //   emit(ChangeBottomNavState());
  // }
}