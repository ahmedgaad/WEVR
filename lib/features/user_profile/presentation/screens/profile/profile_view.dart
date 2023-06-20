import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/config/routes/routes_manager.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BuildUserImageAndName(),
            Column(
              children: [
                BuildListItem(
                  label: StringsManager.personalInfo.tr,
                  icon: AssetsImagesManager.person,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.personalInfoRoute);
                  },
                ),
                const BuildDivider(),
                BuildListItem(
                  label: StringsManager.accountSetting.tr,
                  icon: AssetsImagesManager.setting,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.accountSettingRoute,
                    );
                  },
                ),
                const BuildDivider(),
                BuildListItem(
                  label: StringsManager.payment.tr,
                  icon: AssetsImagesManager.payment,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.paymentRoute);
                  },
                ),
                const BuildDivider(),
                BuildListItem(
                  label: StringsManager.lang.tr,
                  icon: AssetsImagesManager.language,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.languageRoute);
                  },
                ),
                const BuildDivider(),
                BuildListItem(
                  label: StringsManager.contactUs.tr,
                  icon: AssetsImagesManager.contactUs,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.contactUsRoute);
                  },
                ),
                const BuildDivider(),
                BuildListItem(
                  label: StringsManager.privacy.tr,
                  icon: AssetsImagesManager.privacy,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.privacyPolicyRoute);
                  },
                ),
                const BuildDivider(),
                BuildListItem(
                  label: StringsManager.myProperties.tr,
                  icon: AssetsImagesManager.myProperties,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.myPropertiesRoute);
                  },
                ),
                const BuildDivider(),
                BuildListItem(
                  label: StringsManager.showYourProperties.tr,
                  icon: AssetsImagesManager.showYourProperty,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.showYourPropertiesRoute,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
