import 'package:flutter/material.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

class FiltersView extends StatelessWidget {
  const FiltersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters" , style: getSemiBoldStylePoppins(fontSize: AppSize.s20),),
      ),
    );
  }
}
