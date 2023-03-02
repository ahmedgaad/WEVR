import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class BuildUserImageAndName extends StatelessWidget {
  const BuildUserImageAndName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 160,
      child: Column(
        children: [
          GestureDetector(
            onTap: (){},
            child: CircleAvatar(
              backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80'),
              radius: 55,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18,
                  child: SvgPicture.asset(AssetsImagesManager.uploadIc),
                ),
              )
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 70,
          ),
          Text(
            'Ahmed Gad',
            style: getMediumStylePoppins(
              color: ColorManager.black,
              fontSize: FontSize.s20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
