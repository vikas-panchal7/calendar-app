import 'package:calendar_app/components/dialogs/delete_dialogs.dart';
import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditAndDeletePopUPMenu extends StatelessWidget {
  final String type;
  final  VoidCallback  onDelete;
  final VoidCallback onEdit;
  const EditAndDeletePopUPMenu({super.key, required this.type, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: context.colorScheme.onPrimary,
      padding: EdgeInsets.zero,
      onSelected: (value) {
        if (value == AppStrings.delete) {
          DeleteDialog.show(
            context: context,
            type: type,
            onDelete: onDelete,
          );
        }else{
          onEdit();
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              value: AppStrings.edit,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.icons.icEdit
                      .image(height: 25, color: context.colorScheme.primary),
                  const Gap(10),
                  Text(
                    AppStrings.edit,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              )),
          PopupMenuItem(
              value: AppStrings.delete,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete,
                    color: context.colorScheme.primary,
                  ),
                  const Gap(10),
                  Text(
                    AppStrings.delete,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              ))
        ];
      },
      child: Icon(
        Icons.more_vert_rounded,
        color: context.colorScheme.primary,
      ),
    );
  }
}
