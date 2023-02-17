import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../widgets/profile/build_divider.dart';
import '../../widgets/profile/build_list_item.dart';
import '../../widgets/profile/build_user_image_and_name.dart';

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
      body: Column(
        children: [
          const BuildUserImageAndName(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: PaddingSize.p10.w, vertical: PaddingSize.p30.h),
                child: Column(
                  children: [
                    BuildListItem(
                      label: AppStrings.personalInfo.tr(),
                      icon: ImagesAssetsManager.person,
                      onTap: () {},
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.accountSetting.tr(),
                      icon: ImagesAssetsManager.setting,
                      onTap: () {},
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.payment.tr(),
                      icon: ImagesAssetsManager.payment,
                      onTap: () {},
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.lang.tr(),
                      icon: ImagesAssetsManager.language,
                      onTap: () {},
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.contactUs.tr(),
                      icon: ImagesAssetsManager.contactUs,
                      onTap: () {},
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.privacy.tr(),
                      icon: ImagesAssetsManager.privacy,
                      onTap: () {},
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.myProperties.tr(),
                      icon: ImagesAssetsManager.myProperties,
                      onTap: () {},
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.showYourProperties.tr(),
                      icon: ImagesAssetsManager.showYourProperty,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
