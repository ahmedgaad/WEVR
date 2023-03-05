import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class VirtualTour extends StatelessWidget {
  const VirtualTour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Virtual Tour",
          style: getSemiBoldStylePoppins(
              color: ColorManager.black
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        child: const WebView(
          initialUrl: "https://eyes360.cloud/lacville/twinhousedecor/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
