import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import '../controller/map/map_cubit.dart';
import '../controller/map/map_states.dart';

class BuildFloatingSearchBar extends StatelessWidget {
  const BuildFloatingSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    MapCubit cubit = MapCubit.get(context);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return BlocBuilder<MapCubit, MapStates>(
      builder: (context, state) {
        return Container();
        //TODO: Resolve search bar manullay 
        // return FloatingSearchBar(
        //   controller: cubit.floatingSearchBarController,
        //   elevation: 6.0,
        //   hint: 'Find a place ...',
        //   hintStyle: const TextStyle(fontSize: 18.0),
        //   queryStyle: const TextStyle(fontSize: 18.0),
        //   padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
        //   margins: const EdgeInsets.fromLTRB(20, 70, 20, 0),
        //   scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        //   physics: const BouncingScrollPhysics(),
        //   actions: [
        //     FloatingSearchBarAction(
        //       showIfOpened: false,
        //       child: CircularButton(
        //         icon: Icon(
        //           Icons.place,
        //           color: Colors.black.withOpacity(0.6),
        //         ),
        //         onPressed: () {},
        //       ),
        //     ),
        //     FloatingSearchBarAction.searchToClear(
        //       showIfClosed: false,
        //     ),
        //   ],
        //   // borderRadius: BorderRadius.circular(5.0),
        //   border: BorderSide.none,
        //   axisAlignment: isPortrait ? 0.0 : -1.0,
        //   width: isPortrait ? 600 : 500,
        //   height: 52.0,
        //   transitionDuration: const Duration(milliseconds: 600),
        //   transitionCurve: Curves.easeInOut,
        //   transition: CircularFloatingSearchBarTransition(),
        //   onFocusChanged: (_) {},
        //   onQueryChanged: (query) {},
        //   builder: (BuildContext context, Animation<double> animation) {
        //     return ClipRRect(
        //       borderRadius: BorderRadius.circular(8),
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.min,
        //         children: [],
        //       ),
        //     );
        //   },
        // );
      },
    );
  }
}
