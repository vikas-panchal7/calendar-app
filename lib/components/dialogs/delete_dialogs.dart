import 'package:calendar_app/components/buttonItem/button_item.dart';
import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DeleteDialog extends StatelessWidget {
  static void show(
      {required BuildContext context,
      required String type,
      required VoidCallback onDelete}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            // insetPadding: EdgeInsets.symmetric(horizontal: context.width),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: DeleteDialog(type: type, onDelete: onDelete));
      },
    );
  }

  final String type;
  final VoidCallback onDelete;

  const DeleteDialog({super.key, required this.type, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${AppStrings.areYouSureYouWantToDeleteThis} $type?',textAlign: TextAlign.center,style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          Gap(context.height * .03),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonItem.outline(
                  onTap: () {},
                  text: AppStrings.delete,
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
