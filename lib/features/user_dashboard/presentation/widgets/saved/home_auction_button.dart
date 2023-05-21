import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../screens/explore/product_container.dart';

class HomeAuctionButton extends StatefulWidget {
  const HomeAuctionButton({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeAuctionButtonState createState() => _HomeAuctionButtonState();
}

class _HomeAuctionButtonState extends State<HomeAuctionButton> {

  bool isClickableLeft = true;
  bool isClickableRight = false;
  Color backgroundColor = ColorManager.primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 64.h,
          width: AppSize.s200.w,
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
                  height: 48.h,
                  elevation: AppSize.s0,
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s0),
                  child: Text( "Homes" ,
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
                  height: 48.h,
                  elevation: AppSize.s0,
                  padding: const EdgeInsets.symmetric(horizontal: AppSize.s0),

                  child: Text("Auction" ,
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
      ],
    );
  }
}
