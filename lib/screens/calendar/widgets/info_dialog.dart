import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  static void show(
      {required BuildContext context, required String title,
        }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          // insetPadding: EdgeInsets.symmetric(horizontal: context.width),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child:  InfoDialog(title:title));
      },
    );
  }

  final String title;
  const InfoDialog({super.key, required this.title,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: context.width,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 7),
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0))
          ),
          child: Text('Information',style:  context.textTheme.bodyLarge?.copyWith(color: context.colorScheme.onSecondary,fontWeight: FontWeight.w600),),

        ),
       Padding(
         padding: const EdgeInsets.all(16.0),
         child: Text(title,style:  context.textTheme.titleSmall?.copyWith(),),
       )
      ],
    );
  }
}
