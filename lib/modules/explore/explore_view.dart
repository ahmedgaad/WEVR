import 'package:flutter/material.dart';
import 'package:wevr_app/shared/managers/color_manager.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: Center(
        child: Text(
            'Explore view'
        ),
      ),
    );
  }
}
