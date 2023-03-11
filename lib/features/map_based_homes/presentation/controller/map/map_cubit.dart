import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wevr_app/core/helpers/location_helper.dart';
import 'package:wevr_app/features/map_based_homes/presentation/controller/map/map_states.dart';

class MapCubit extends Cubit<MapStates> {
  MapCubit() : super(MapInitial()) {
    getCurrentLocation();
  }
  static MapCubit get(context) => BlocProvider.of(context);

  static Position? position;
  final Completer<GoogleMapController> mapController = Completer();
  Future<void> getCurrentLocation() async {
    position = await LocationHelper.determinePosition();
    emit(MapLoadedSuccessfullyState(position: position!));
  }

  final CameraPosition myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(
        position?.latitude ?? 0.0,
        position?.longitude ?? 0.0,
      ),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 16.0);
}
