import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wevr_app/features/map_based_homes/presentation/controller/map/map_cubit.dart';
import 'package:wevr_app/features/map_based_homes/presentation/controller/map/map_states.dart';

import '../../../../core/utils/color_manager.dart';
import '../widgets/build_google_map.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MapCubit cubit = MapCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ConditionalBuilder(
                  condition: state is MapLoadedSuccessfullyState,
                  builder: (BuildContext context) {
                    return const BuildGoogleMap();
                  },
                  fallback: (BuildContext context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                Positioned(
                  top: 19,
                  left: 19,
                  child: Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                        color: ColorManager.darkGrey,
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 35,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
