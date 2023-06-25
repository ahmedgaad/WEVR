import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/routes/routes_manager.dart';
import '../utils/strings_manager.dart';

class SnackbarMessages{
    static void showLoginMessage({
    required BuildContext context,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 14.0,
                child: IconButton(
                  onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar,
                  iconSize: 13.0,
                  icon: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                StringsManager.loginAsGeustWarnning.tr,
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed(Routes.loginRoute);
                ScaffoldMessenger.of(context).hideCurrentSnackBar;
              },
              child: Text(
                StringsManager.signIn.tr,
                style: const TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.all(5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}