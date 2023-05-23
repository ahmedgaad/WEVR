import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../core/helpers/cache_helper.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../authentication/domain/entities/login.dart';
import '../../../../introduction/presentation/screens/get_started/get_started_view.dart';
import '../../controller/Home/cubit.dart';
import '../../controller/Home/states.dart';
import '../../../../user_profile/presentation/screens/profile/profile_view.dart';
import '../../../../../core/components/components.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class ProfileRow extends StatelessWidget {
  const ProfileRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayOutStates>(
      listener: (context, state) {
        if (state is LogoutSuccessfullyState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            // title: StringsManager.error.tr,
            text: state.logout.message,
            confirmBtnText: StringsManager.okay.tr,
            confirmBtnColor: Colors.green,
          ).then((value) {
            navigatePush(context, const GetStartedView());
          });
        } else if (state is LogoutErrorState) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: StringsManager.error.tr,
            text: state.error,
            confirmBtnText: StringsManager.okay.tr,
            confirmBtnColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                navigatePush(context, const ProfileView());
              },
              child: CircleAvatar(
                radius: AppSize.s25.sp,
                child: Image.asset(
                  AssetsImagesManager.userPic,
                ),
              ),
            ),
            const Spacer(),
            BlocBuilder<HomeLayoutCubit, HomeLayOutStates>(
              builder: (context, state) {
                if (!CacheHelper.getDataFromCache(key: 'isGuest')) {
                  return IconButton(
                    onPressed: () {
                      cubit
                          .logout(
                        token: Constants.kToken,
                      )
                          .then((value) {
                        CacheHelper.removeDataFromCache(key: 'userToken');
                      });
                    },
                    icon: SvgPicture.asset(
                      AssetsImagesManager.signOut,
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        );
      },
    );
  }
}
