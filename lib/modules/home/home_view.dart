import 'package:flutter/material.dart';
import 'package:wevr_app/shared/managers/color_manager.dart';

import '../../shared/managers/values_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.exploreBackground,
        elevation: AppSize.s0,
      ),
    );
  }
}
