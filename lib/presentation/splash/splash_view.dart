import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/presentation/resources/assets_manager.dart';
import 'package:wevr_app/presentation/resources/color_manager.dart';
import 'package:wevr_app/presentation/resources/constants_manager.dart';
import 'package:wevr_app/presentation/resources/routes_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: ColorManager.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [
          ColorManager.white,
          ColorManager.primary,
        ],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
      )),
      child: SvgPicture.asset(
        ImagesAssetsManager.splashLogoBlack,
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
