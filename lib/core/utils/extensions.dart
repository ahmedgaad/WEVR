import 'package:flutter/material.dart';

extension EmptyPadding on num {
  SizedBox get ph => SizedBox(height: toDouble(),);
  SizedBox get pw => SizedBox(width: toDouble(),);
}
