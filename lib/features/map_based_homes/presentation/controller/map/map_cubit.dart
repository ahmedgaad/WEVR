import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../../../../../core/helpers/location_helper.dart';
import 'map_states.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapInitial()) {
    getCurrentLocation();
  }
  static MapCubit get(context) => BlocProvider.of(context);

  static Position? position;
  final Completer<GoogleMapController> mapController = Completer();
  // FloatingSearchBarController floatingSearchBarController =
  //     FloatingSearchBarController();
  late final CameraPosition myCurrentLocationCameraPosition;
  Future<void> getCurrentLocation() async {
    position = await LocationHelper.determinePosition();
    myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(
        position?.latitude ?? 0.0,
        position?.longitude ?? 0.0,
      ),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 16.0,
    );
    emit(MapLoadedSuccessfullyState(position: position!));
  }

  Future<void> goToMyCurrentLocation() async {
    final GoogleMapController googleMapController = await mapController.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(myCurrentLocationCameraPosition),
    );
  }

  // final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
  //     target: LatLng(
  //       position?.latitude ?? 0.0,
  //       position?.longitude ?? 0.0,
  //     ),
  //     bearing: 0.0,
  //     tilt: 0.0,
  //     zoom: 16.0);
}
