import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../screens/explore/product_container.dart';

class HomesButton extends StatefulWidget {
  const HomesButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomesButtonState createState() => _HomesButtonState();
}

class _HomesButtonState extends State<HomesButton> {

  bool isClickableLeft = true;
  bool isClickableRight = false;
  bool isClickableMiddle = false;
  Color backgroundColor = ColorManager.primary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0,),
      child: Container(
        height: 57.h,
        width: 320.w,
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
                    isClickableMiddle = false;
                  });
                },
                color: isClickableLeft? ColorManager.elevatedButton : backgroundColor,
                height: 35.h,
                elevation: AppSize.s0,
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s0),
                child: Text( "Buy" ,
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
                    isClickableMiddle = true;
                    isClickableLeft = false;
                    isClickableRight = false;
                  });
                },
                color: isClickableMiddle? ColorManager.elevatedButton : backgroundColor,
                height: 35.h,
                elevation: AppSize.s0,
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s0),
                child: Text( "Rent" ,
                  style: getRegularStylePoppins(
                      fontSize: AppSize.s16,
                      color: isClickableMiddle? ColorManager.primary : ColorManager.white
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
                    isClickableMiddle = false;
                  });
                },
                color: isClickableRight? ColorManager.elevatedButton : backgroundColor,
                height: 35.h,
                elevation: AppSize.s0,
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s0),

                child: Text("Visit" ,
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
