import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/components/components.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/values_manager.dart';
import '../../../data/data_sources/local_data_source/cache_helper.dart';
import '../../screens/get_started/get_started_view.dart';
import '../../screens/profile/profile_view.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            navigatePush(context, ProfileView());
          },
          child: CircleAvatar(
            // backgroundColor: ColorManager.primary,
            radius: AppSize.s25.sp,
            child: Image.asset(
              ImagesAssetsManager.userPic,
            ),
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            signOut(context);
            print("Deleted Successfully ****************");
          },
          icon: SvgPicture.asset(
            ImagesAssetsManager.signOut,
          ),
        )
      ],
    );
  }
}
