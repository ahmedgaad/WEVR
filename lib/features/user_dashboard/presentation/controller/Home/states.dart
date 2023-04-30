import 'package:equatable/equatable.dart';
import 'package:wevr_app/features/user_dashboard/domain/entities/product_entity.dart';
import '../../../../authentication/domain/entities/logout.dart';
import '../../../domain/entities/banners_entity.dart';

abstract class HomeLayOutStates extends Equatable {
  const HomeLayOutStates();

  @override
  List<Object> get props => [];
}

class HomeLayOutInitialState extends HomeLayOutStates {}

class ChangeBottomNavState extends HomeLayOutStates {}

class LogoutSuccessfullyState extends HomeLayOutStates {
  final Logout logout;

  const LogoutSuccessfullyState({required this.logout});
}

class LogoutErrorState extends HomeLayOutStates {}

class ProductLoadingState extends HomeLayOutStates {}

class ProductLoadedState extends HomeLayOutStates {
  final List<ProductEntity> products;
  const ProductLoadedState({
    required this.products,
  });

  @override
  List<Object> get props => [products];
}

class ProductErrorState extends HomeLayOutStates {

  final String errorMessage;

  const ProductErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class BannersLoadingState extends HomeLayOutStates {}

class BannersLoadedState extends HomeLayOutStates {
  final List<Banners> banners;

  const BannersLoadedState({required this.banners});

  @override
  List<Object> get props => [banners];
}

class BannersErrorState extends HomeLayOutStates {
  final String errorMessage;

  const BannersErrorState({ required this.errorMessage });

  @override
  List<Object> get props => [errorMessage];
}
