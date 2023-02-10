import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wevr_app/presentation/screens/home/cubit/cubit.dart';
import 'package:wevr_app/presentation/screens/home/cubit/states.dart';

import '../../../core/components/components.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/values_manager.dart';
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
        BlocBuilder<HomeLayOutCubit, HomeLayOutStates>(
          builder: (context, state) {
            return IconButton(
              onPressed: () {
                HomeLayOutCubit.get(context).signOut(context);
                print("Deleted Successfully ****************");
              },
              icon: SvgPicture.asset(
                ImagesAssetsManager.signOut,
              ),
            );
          },
        )
      ],
    );
  }
}
