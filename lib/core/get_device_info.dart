// ignore_for_file: avoid_print

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

Future<String?> getDeviceInfo() async {
  //DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    print(androidInfo.id);
    return androidInfo.id;
  } else if (Platform.isIOS) {
    var iosInfo = await DeviceInfoPlugin().iosInfo;
    print(iosInfo.identifierForVendor);
    return iosInfo.identifierForVendor;
  } else if (Platform.isWindows) {
    var windowsInfo = await DeviceInfoPlugin().windowsInfo;
    return windowsInfo.productId;
  } else if (Platform.isMacOS) {
    var macOsInfo = await DeviceInfoPlugin().macOsInfo;
    return macOsInfo.systemGUID;
  } else if (Platform.isLinux) {
    var linuxInfo = await DeviceInfoPlugin().linuxInfo;
    return linuxInfo.id;
  } else {
    return "A7A";
  }
}