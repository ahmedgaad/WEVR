import 'package:flutter/material.dart';
import '../../../core/utils/color_manager.dart';

class SavedView extends StatelessWidget {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: Center(
        child: Text(
            'Saved view'
        ),
      ),

    );
  }
}
