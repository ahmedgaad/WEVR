import 'package:flutter/material.dart';
import 'package:wevr_app/presentation/resources/assets_manager.dart';
import 'package:wevr_app/presentation/resources/color_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: SvgPicture.asset('assets/images/logo/white_logo.svg')),
    );
  }
}
