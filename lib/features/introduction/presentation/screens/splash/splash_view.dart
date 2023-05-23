import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
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
        padding: const EdgeInsets.all(86.0),
        child: SvgPicture.asset(
          AssetsImagesManager.splashLogoBlack,
        ),
      ),
    );
  }
}
