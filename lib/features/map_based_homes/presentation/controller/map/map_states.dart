import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class MapStates extends Equatable {
  const MapStates();

  @override
  List<Object> get props => [];
}

class MapInitial extends MapStates {}
class MapLoadedSuccessfullyState extends MapStates {
  final Position position;
  const MapLoadedSuccessfullyState({required this.position});
}
