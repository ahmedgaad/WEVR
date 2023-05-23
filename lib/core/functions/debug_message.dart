import 'dart:developer';

import 'package:flutter/foundation.dart';

void debugMessage(
  String message, {
  String name = '',
  Object? error,
  StackTrace? stackTrace,
}) {
  if (kDebugMode) {
    log(
      message,
      name: name,
      error: error,
      stackTrace: stackTrace,
    );
  }
}
