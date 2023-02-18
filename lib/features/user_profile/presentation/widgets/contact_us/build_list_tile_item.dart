import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';

class BuildListTileItem extends StatelessWidget {
  const BuildListTileItem({
    Key? key,
    required this.leadingIcon,
    required this.title,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final String leadingIcon;
  final String title;
  final Widget? trailing;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        leadingIcon,
        fit: BoxFit.scaleDown,
      ),
      title: Text(
        title,
        style: getRegularStylePoppins(
          fontSize: 16.0,
        ),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios_outlined,
            color: ColorManager.primary,
          ),
      onTap: onTap,
    );
  }
}
