

import 'package:calendar_app/utils/common_functions.dart';
import 'package:calendar_app/utils/enums.dart';
import 'package:flutter/material.dart';

extension Ext on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  NavigatorState get navigator => Navigator.of(this);

  dynamic get args => ModalRoute.of(this)?.settings.arguments;

  void showSuccessSnackBar({required String message}) {
    showSnackBar(context: this, msg: message, type: SnackBarType.success);

  }

  void showErrorSnackBar({required String message}) {
    showSnackBar(context: this, msg: message, type: SnackBarType.error);
  }
}
