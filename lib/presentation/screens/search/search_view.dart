import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wevr_app/core/components/components.dart';
import 'package:wevr_app/core/managers/values_manager.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: PaddingSize.p25.w,
              vertical: PaddingSize.p10.h,
            ),
            child: filterWidget(),
          )
        ],
        title: searchBarWidget(),
      ),
    );
  }
}

Widget searchBarWidget(){
  return Container();
}