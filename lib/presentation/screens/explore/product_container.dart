import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';

import '../../../core/components/components.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/values_manager.dart';

class ProductContainer extends StatelessWidget {
  const ProductContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingSize.p20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              ImagesAssetsManager.apartment,
            ),
            spaceH(),
            Row(
              children: [
                icon(
                  icon: Icons.house_outlined,
                ),
                spaceW(),
                Text(
                    'Duplex',
                  style: getMediumStylePoppins(

                      color: ColorManager.lightPink,
                    fontSize: AppSize.s16,
                  ),
                ),
                const Spacer(),
                favIcon(),
              ],
            ),
            spaceH(),
            Row(
              children: [
                icon(
                  icon: Icons.location_on_outlined,
                ),
                spaceW(),
                Text(
                  'Cairo',
                  style: getMediumStylePoppins(
                    color: ColorManager.smokyGray,
                    fontSize: AppSize.s16,
                  ),
                ),
              ],
            ),
            spaceH(),
            Row(
              children: [
                moneyIcon(),
                spaceW(),
                Text(
                  '1.700EGP',
                  style: getSemiBoldStylePoppins(
                    color: ColorManager.primary,
                    fontSize: AppSize.s16,
                  ),
                ),
                Text('/month'),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Padding(
//                     padding: const EdgeInsets.all(PaddingSize.p20),
//                     child: Image.asset(
//                       ImagesAssetsManager.apartment,
//                     ),
//                   ),

Widget icon({
  required IconData icon,
}) {
  return Icon(
    icon,
    color: ColorManager.darkGrey,
    size: AppSize.s30,
  );
}


Widget spaceH() {
  return SizedBox(
    height: AppSize.s10.h,
  );
}

Widget spaceW() {
  return SizedBox(
    width: AppSize.s10.w,
  );
}

Widget favIcon ({
  double? iconsSize,
}){
  return Icon(
    Icons.favorite_border_outlined,
    size: iconsSize,
  );
}