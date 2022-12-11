import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wevr_app/core/managers/color_manager.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(30.0444, 31.2357),
                zoom: 14,
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
                 borderRadius: BorderRadius.circular(50)
               ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
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
  }
}
