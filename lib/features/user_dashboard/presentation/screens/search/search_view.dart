import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/utils/strings_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';
import 'package:wevr_app/features/user_dashboard/presentation/screens/home/home_view.dart';
import 'package:wevr_app/features/user_dashboard/presentation/widgets/search/search_bar_widget.dart';
import '../../widgets/search/filter_widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(
          top: 50.0.h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    navigatePush(context, const HomeView());
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                15.pw,
                const Expanded(
                  child: SearchBarWidget(),
                ),
                15.pw,
                const FilterWidget(),
              ],
            ),
            //TODO: List of search results
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: defaultButton(
                function: () {},
                text: StringsManager.showYourProperties.tr(),
                isUpperCase: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
