import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/routes_manager.dart';
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
      appBar: AppBar(
        elevation: AppSize.s0,
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
                      icon: AssetsImagesManager.person,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.personalInfoRoute);
                      },
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.accountSetting.tr(),
                      icon: AssetsImagesManager.setting,
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.accountSettingRoute);
                      },
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.payment.tr(),
                      icon: AssetsImagesManager.payment,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.paymentRoute);
                      },
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.lang.tr(),
                      icon: AssetsImagesManager.language,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.languageRoute);
                      },
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.contactUs.tr(),
                      icon: AssetsImagesManager.contactUs,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.contactUsRoute);
                      },
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.privacy.tr(),
                      icon: AssetsImagesManager.privacy,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.privacyPolicyRoute);
                      },
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.myProperties.tr(),
                      icon: AssetsImagesManager.myProperties,
                      onTap: () {
                        Navigator.pushNamed(context, Routes.myPropertiesRoute);
                      },
                    ),
                    const BuildDivider(),
                    BuildListItem(
                      label: AppStrings.showYourProperties.tr(),
                      icon: AssetsImagesManager.showYourProperty,
                      onTap: () {
                        Navigator.pushNamed(
                            context, Routes.showYourPropertiesRoute);
                      },
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
