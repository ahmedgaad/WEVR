import 'package:flutter/material.dart';
import 'package:wevr_app/core/components/empty_data_column.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../widgets/homes/container.dart';

class HomesView extends StatelessWidget {
  const HomesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.exploreBackground,
      body: SafeArea(
        child: Column(
          children: [
            const HomesButton(),
            150.ph,
            const EmptyDataColumn(),
          ],
        ),
      ),
    );
  }
}
