import 'package:flutter/material.dart';
import '../../shared/managers/color_manager.dart';
import '../../shared/managers/values_manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        elevation: AppSize.s0,
        backgroundColor: ColorManager.exploreBackground,
      ),
    );
  }
}
