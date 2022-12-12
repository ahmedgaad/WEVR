import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/managers/assets_manager.dart';
import '../../core/managers/color_manager.dart';
import '../../core/managers/routes_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/components/constants.dart';

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
      statusBarBrightness: Brightness.light,
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
      child: Padding(
        padding: EdgeInsets.all(
            MediaQuery.of(context).size.width /8
        ),
        child: SvgPicture.asset(
          ImagesAssetsManager.splashLogoBlack,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
