import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../screens/explore/product_container.dart';

class ContainerButton extends StatefulWidget {
  const ContainerButton({Key? key}) : super(key: key);

  @override
  _ContainerButtonState createState() => _ContainerButtonState();
}

class _ContainerButtonState extends State<ContainerButton> {
  bool isClickableLeft = true;
  bool isClickableRight = false;
  Color backgroundColor = ColorManager.primary;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: AppSize.s40.h,
        width: AppSize.s150.w,
        decoration: BoxDecoration(
            color: ColorManager.primary,
            borderRadius: BorderRadius.circular(AppSize.s10)
        ),
        child: Row(
          children: [
            spaceW(),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  setState((){
                    isClickableLeft = true;
                    isClickableRight = false;
                  });
                },
                color: isClickableLeft? ColorManager.elevatedButton : backgroundColor,
                height: AppSize.s25,
                elevation: AppSize.s0,
                padding: EdgeInsets.symmetric(horizontal: AppSize.s0),

                child: Text("monthly" ,
                  style: getRegularStylePoppins(
                      fontSize: AppSize.s16,
                      color: isClickableLeft? ColorManager.primary : ColorManager.white
                  ),
                ),
              ),
            ),
            spaceW(),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                  setState((){
                    isClickableRight = true;
                    isClickableLeft = false;
                  });
                },
                color: isClickableRight? ColorManager.elevatedButton : backgroundColor,
                height: AppSize.s25,
                elevation: AppSize.s0,
                padding: EdgeInsets.symmetric(horizontal: AppSize.s0),

                child: Text("Yearly" ,
                  style: getRegularStylePoppins(
                      fontSize: AppSize.s16,
                      color: isClickableRight? ColorManager.primary : ColorManager.white
                  ),
                ),
              ),
            ),
            spaceW(),
          ],
        ),
      ),
    );
  }
}
