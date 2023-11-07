import 'package:calendar_app/components/buttonItem/button_item.dart';
import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class DiscardDialog extends StatelessWidget {
  static void show({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            // insetPadding: EdgeInsets.symmetric(horizontal: context.width),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const DiscardDialog());
      },
    );
  }

  const DiscardDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AppStrings.discardChanges,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          Text(AppStrings.youWillLooseAllTheChanges,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium
                  ?.copyWith(color: context.colorScheme.onSurface)),
          Gap(context.height * .03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonItem.outline(
                  onTap: () {
                    context.navigator.pop();
                    context.navigator.pop();
                  },
                  text: AppStrings.discard,
                  width: context.width * .3,
                  fontSize: 16,
                  height: 40,
                ),
                ButtonItem.filled(
                  onTap: () {
                    context.navigator.pop();
                  },
                  text: AppStrings.cancel,
                  width: context.width * .3,
                  fontSize: 16,
                  height: 40,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
