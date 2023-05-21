import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class LinksButton extends StatefulWidget {
   LinksButton(
      {super.key,
      required this.text,
      required this.function,
      required this.icon, required this.background});

  final String text;
  final VoidCallback function;
  final Icon icon;
  final Color background;

  @override
  State<LinksButton> createState() => _LinksButtonState();
}

class _LinksButtonState extends State<LinksButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: width,
      height: 48.h,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: borderColor,
        //   width: borderRadius,
        // ),
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: widget.background ,
      ),
      child: MaterialButton(
         padding: EdgeInsets.only(left: 10),
        onPressed: widget.function,
        child: Row(
          children: [
            widget.icon,
            8.pw,
            Text(
              widget.text,
              style: getMediumStylePoppins(
                color: ColorManager.white,
                fontSize: AppSize.s12,
              ),
               // textAlign: TextAlign.start,
            ),
          ],
        ),
      ),
    );
  }
}
