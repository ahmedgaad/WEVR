import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wevr_app/shared/managers/font_manager.dart';
import 'package:wevr_app/shared/managers/strings_manager.dart';
import 'package:wevr_app/shared/managers/style_manager.dart';

import '../../shared/components/components.dart';
import '../../shared/managers/assets_manager.dart';
import '../../shared/managers/color_manager.dart';
import '../../shared/managers/routes_manager.dart';
import '../../shared/managers/values_manager.dart';
import 'package:flutter_svg/svg.dart';

class ResetPhoneView extends StatefulWidget {
  const ResetPhoneView({Key? key}) : super(key: key);

  @override
  State<ResetPhoneView> createState() => _ResetPhoneViewState();
}

class _ResetPhoneViewState extends State<ResetPhoneView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      /*appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
        leading: IconButton(
          onPressed: () {},
          icon: const Padding(
            padding: EdgeInsets.all(PaddingSize.p20),
            child: Icon(
              Icons.arrow_back_ios,
              size: AppSize.s24,
            ),
          ),
        ),
      ),*/
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.forgetPasswordRoute);
                },
                icon: const Padding(
                  padding: EdgeInsets.all(PaddingSize.p25),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: AppSize.s24,
                  ),
                ),
              ),
              Align(
                child: SvgPicture.asset(
                  ImagesAssetsManager.mobileReset,
                  fit: BoxFit.scaleDown,
                  width: AppSize.s128,
                  height: AppSize.s224,
                  alignment: Alignment.center,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: PaddingSize.p25,
                  top: PaddingSize.p25,
                ),
                child: Text(
                  AppStrings.recoveryCode,
                  style: getBoldStylePoppins(
                      color: ColorManager.black,
                      fontSize: FontSize.s24
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: PaddingSize.p25,
                ),
                child: Text(
                  AppStrings.subTitleRecoveryCode,
                  style: getRegularStyleInter(
                    color: ColorManager.darkGrey,
                    fontSize: FontSize.s20,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSize.p78,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: AppSize.s60,
                        height: AppSize.s60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ColorManager.viaPhoneContainer,
                        ),
                        child: TextFormField(
                          onChanged: (value){
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "8",
                            border: InputBorder.none
                          ),
                          style: getBoldStylePoppins(
                              color: ColorManager.black,
                            fontSize: FontSize.s24,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s15,),
                    Expanded(
                      child: Container(
                        width: AppSize.s60,
                        height: AppSize.s60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ColorManager.viaPhoneContainer,
                        ),
                        child: TextFormField(
                          onChanged: (value){
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "-",
                            border: InputBorder.none,
                          ),
                          style: getBoldStylePoppins(
                            color: ColorManager.black,
                            fontSize: FontSize.s24,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s15,),
                    Expanded(
                      child: Container(
                        width: AppSize.s60,
                        height: AppSize.s60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ColorManager.viaPhoneContainer,
                        ),
                        child: TextFormField(
                          onChanged: (value){
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "-",
                            border: InputBorder.none,
                          ),
                          style: getBoldStylePoppins(
                            color: ColorManager.black,
                            fontSize: FontSize.s24,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s15,),
                    Expanded(
                      child: Container(
                        width: AppSize.s60,
                        height: AppSize.s60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: ColorManager.viaPhoneContainer,
                        ),
                        child: TextFormField(
                          onChanged: (value){
                            if(value.length == 1){
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          decoration: const InputDecoration(
                            hintText: "-",
                            border: InputBorder.none,
                          ),
                          style: getBoldStylePoppins(
                            color: ColorManager.black,
                            fontSize: FontSize.s24,
                          ),
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(35.0),
                child: Align(
                  alignment: Alignment.center,
                  child: defaultButton(
                    function: () {},
                    text: AppStrings.submit,
                    width: AppSize.s250,
                    height: AppSize.s60,
                    isUpperCase: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
