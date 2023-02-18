import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wevr_app/core/utils/assets_manager.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/features/user_profile/presentation/widgets/contact_us/build_list_tile_item.dart';
import 'package:wevr_app/features/user_profile/presentation/widgets/profile/build_divider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  void launchWhatsApp() async {
    final Uri whatsappUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '/+201061293297',
    );

    // ignore: deprecated_member_use
    if (await canLaunch(whatsappUri.toString())) {
      // ignore: deprecated_member_use
      await launch(whatsappUri.toString());
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }



void launchEmail() async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'softagi.tech@gmail.com',
  );
  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch $emailLaunchUri';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.contactUs.tr(),
          style: getBoldStylePoppins(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 35,
          ),
          BuildListTileItem(
            onTap: () {
              launchWhatsApp();
            },
            leadingIcon: AssetsImagesManager.whatsApp,
            title: 'WhatsApp',
          ),
          const BuildDivider(),
          BuildListTileItem(
            onTap: () {
              launchEmail();
            },
            leadingIcon: AssetsImagesManager.email,
            title: 'Email',
          ),
        ],
      ),
    );
  }
}
