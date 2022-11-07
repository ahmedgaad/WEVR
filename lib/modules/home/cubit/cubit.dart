import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/modules/auction/auction_view.dart';
import 'package:wevr_app/modules/explore/explore_view.dart';
import 'package:wevr_app/modules/home/cubit/states.dart';
import 'package:wevr_app/modules/homes/homes_view.dart';
import 'package:wevr_app/modules/saved/saved_view.dart';
class HomeLayOutCubit extends Cubit<HomeLayOutStates>{
  HomeLayOutCubit() : super(HomeLayOutInitialState());

  static HomeLayOutCubit get(context)=> BlocProvider.of(context);

  // int currentIndex=0;
  int currentTap =0;

  List<Widget> screens =[
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