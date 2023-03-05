import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';


class HomesView extends StatelessWidget {
  const HomesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: Center(
        child: Text(
          'Homes view'
        ),
      ),

    );
  }
}
