import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/extensions/int_ext.dart';
import 'package:calendar_app/utils/enums.dart';
import 'package:flutter/material.dart';

void closeKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

void showSnackBar(
    {required BuildContext context,
    required String msg,
    SnackBarType type = SnackBarType.success}) {
  var snackBar = SnackBar(
    content: Text(
      msg,
      style: context.textTheme.bodyLarge
          ?.copyWith(color: context.colorScheme.onBackground),
    ),
    backgroundColor: type == SnackBarType.success
        ? context.colorScheme.primary
        : context.colorScheme.error,
    duration: 1.seconds,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
