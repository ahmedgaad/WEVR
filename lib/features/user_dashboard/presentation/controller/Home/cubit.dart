import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wevr_app/features/user_dashboard/domain/use_cases/get_product_usecase.dart';
import 'package:wevr_app/features/user_dashboard/domain/use_cases/get_banner_usecase.dart';
import '../../../../authentication/domain/use_cases/logout_usecase.dart';
import '../../screens/auction/auction_view.dart';
import '../../screens/explore/explore_view.dart';
import '../../screens/homes/homes_view.dart';
import '../../screens/saved/saved_view.dart';
import 'states.dart';

class HomeLayoutCubit extends Cubit<HomeLayOutStates> {
  final LogoutUseCase logoutUseCase;
  final GetProductUseCase getProductUseCase;
  final GetBannersUseCase getBannerUseCase;

  HomeLayoutCubit(
      {required this.getProductUseCase, required this.logoutUseCase, required this.getBannerUseCase})
      : super(ProductLoadingState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  Future<void> logout({
    required String? token,
  }) async {
    final failureOrDelete = await logoutUseCase.call(
      token: token!,
    );

    failureOrDelete.fold(
      (failure) {
        emit(LogoutErrorState());
      },
      (delete) {
        emit(LogoutSuccessfullyState(logout: delete));
      },
    );
  }

  int currentTap = 0;

  List<Widget> screens = const [
    ExploreView(),
    SavedView(),
    HomesView(),
    AuctionView(),
  ];

  bool isFav = false;

  void changeFavorites(){
    isFav = !isFav;
  }
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const ExploreView();

  Future<void> getProducts() async {
    emit(ProductLoadingState());
    try {
      final products = await getProductUseCase.call();
      products.fold((failure) {
        emit(ProductErrorState(errorMessage: failure.toString()));
      }, (product) {
        emit(ProductLoadedState(products: product,));
      });
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }

  // Future<void> getBanners() async {
  //   emit(BannersLoadingState());
  //   try {
  //     final banners = await getBannerUseCase.call();
  //     banners.fold((failure) {
  //       emit(BannersErrorState(errorMessage: failure.toString()));
  //     }, (banner) {
  //       emit(BannersLoadedState(banners: banner));
  //     });
  //   } catch (e) {
  //     emit(ProductErrorState(errorMessage: e.toString()));
  //   }
  // }
}
