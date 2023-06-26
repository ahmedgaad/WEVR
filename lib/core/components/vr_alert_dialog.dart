import 'package:flutter/material.dart';
import 'package:wevr_app/core/utils/color_manager.dart';
import 'package:wevr_app/core/utils/styles_manager.dart';
import 'package:wevr_app/core/utils/values_manager.dart';

void showAlertDialogWidget(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0))),
        title: AppBar(
          title: Text(
            'information',
            style: getMediumStylePoppins(fontSize: AppSize.s14),
          ),
        ),
        content: Text(
          'last update : 19/5/2023, at 10:00',
          style: getMediumStylePoppins(fontSize: AppSize.s14),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: ColorManager.primary),
            ),
          ),
        ],
      );
    },
  );
}
