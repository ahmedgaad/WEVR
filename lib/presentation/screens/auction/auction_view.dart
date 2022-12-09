// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/managers/color_manager.dart';

class AuctionView extends StatelessWidget {
  const AuctionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: Center(
        child: Text(
            'Auction view'
        ),
      ),


    );
  }
}
