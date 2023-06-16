import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/user_profile/presentation/widgets/personal_information/image_pick_container.dart';

import '../../../../../core/utils/assets_manager.dart';
import 'form_field_widget.dart';

class NationalIdWidget extends StatelessWidget {
  const NationalIdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 320.h,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            border: Border.all(
              color: ColorManager.primary,
              width: 1.w,
            )),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'National Number',
                style: getMediumStylePoppins(
                  fontSize: AppSize.s16,
                  color: ColorManager.smokyGray,
                ),
              ),
              15.ph,
              FormFieldWidget(
                height: 50.h,
              ),
              20.ph,
              const Expanded(
                child: Row(
                  children: [
                    ImagePickerContainer(
                        text: 'Front',
                        defaultImage: AssetsImagesManager.frontNationalId),
                    Spacer(),
                    ImagePickerContainer(
                      text: 'Back',
                      defaultImage: AssetsImagesManager.backNationalId,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
