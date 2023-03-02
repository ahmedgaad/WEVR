import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../core/utils/color_manager.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const GoogleMap(
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
  }
}
