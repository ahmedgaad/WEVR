import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/authentication/data/models/login_model.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../widgets/personal_information/form_field_widget.dart';
import '../../widgets/personal_information/national_id_widget.dart';
import '../../widgets/personal_information/text_widget.dart';

class PersonalInformation extends StatefulWidget {
  PersonalInformation({Key? key, }) : super(key: key);
  // LoginModel? loginModel;

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  var nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // nameController.text = widget.loginModel.data.user.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      appBar: AppBar(
        backgroundColor: ColorManager.exploreBackground,
        title: Text(
          'Personal information',
          style: getBoldStylePoppins(
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextWidget(
                text: 'Name',
              ),
              10.ph,
              FormFieldWidget(
                controller: nameController,
                height: 48.h,
              ),
              50.ph,
              const TextWidget(
                text: 'Address',
              ),
              10.ph,
              FormFieldWidget(
                height: 80.h,
              ),
              35.ph,
              NationalIdWidget(),
              20.ph,
              Row(
                children: [
                  Expanded(
                    child: defaultButton(
                      function: () {},
                      text: 'Save',
                      isUpperCase: false,
                    ),
                  ),
                  10.pw,
                  Expanded(
                    child: defaultButton(
                        function: () {},
                        text: 'Cancel',
                        isUpperCase: false,
                        borderColor: ColorManager.primary,
                        background: ColorManager.white,
                        textColor: ColorManager.primary,
                        borderRadius: 1),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
