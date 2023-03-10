import 'package:equatable/equatable.dart';
import '../../../../authentication/domain/entities/logout.dart';

abstract class HomeLayOutStates extends Equatable {
  const HomeLayOutStates();
  
  @override
  List<Object?> get props => [];
}

class HomeLayOutInitialState extends HomeLayOutStates {}

class ChangeBottomNavState extends HomeLayOutStates {}

class LogoutSuccessfullyState extends HomeLayOutStates {
  final Logout logout;
  const LogoutSuccessfullyState({required this.logout});
}

class LogoutErrorState extends HomeLayOutStates{}