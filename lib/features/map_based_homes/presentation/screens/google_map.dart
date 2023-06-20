import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/map/map_cubit.dart';
import '../controller/map/map_states.dart';
import '../../../../core/utils/color_manager.dart';
import '../widgets/build_floating_search_bar.dart';
import '../widgets/build_google_map.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MapCubit, MapStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        MapCubit cubit = MapCubit.get(context);
        return Scaffold(
          body: Stack(
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
              BuildFloatingSearchBar(),
            ],
          ),
          floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          onPressed: cubit.goToMyCurrentLocation,
          backgroundColor: ColorManager.primary,
          child: const Icon(Icons.place, color: Colors.white,),
        ),
      ),
        );
      },
    );
  }
}
