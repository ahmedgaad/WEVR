import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wevr_app/features/map_based_homes/presentation/controller/map/map_cubit.dart';
import 'package:wevr_app/features/map_based_homes/presentation/controller/map/map_states.dart';

class BuildGoogleMap extends StatelessWidget {
  const BuildGoogleMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapCubit, MapStates>(
      builder: (context, state) {
        MapCubit cubit = MapCubit.get(context);
        return GoogleMap(
          initialCameraPosition: cubit.myCurrentLocationCameraPosition,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          onMapCreated: (GoogleMapController googleMapController) {
            if (!cubit.mapController.isCompleted) {
              cubit.mapController.complete(googleMapController);
            }
            // cubit.mapController.complete(googleMapController);
          },
        );
      },
    );
  }
}
