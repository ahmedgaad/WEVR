import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

import '../utils/assets_manager.dart';

class EmptyDataColumn extends StatelessWidget {
  const EmptyDataColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AssetsImagesManager.emptySaved),
          20.ph,
          Text(
            'There are no saved homes',
            style: getMediumStylePoppins(fontSize: 16.0),
          ),
          20.ph,
          SizedBox(
            width: 152.w,
            child: Text(
              'explore homes to find what matches you',
              textAlign: TextAlign.center,
              style: getRegularStylePoppins(fontSize: 14.0),
            ),
          ),
        ],
      ),
    );
  }
}
