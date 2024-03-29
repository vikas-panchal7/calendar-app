import 'package:calendar_app/components/dialogs/delete_dialogs.dart';
import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditAndDeletePopUPMenu extends StatelessWidget {
  final String type;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const EditAndDeletePopUPMenu({super.key, required this.type, required this.onDelete, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(

      position: PopupMenuPosition.under,
      constraints: BoxConstraints(maxWidth: context.width * .45),
      color: context.colorScheme.background,
      padding: EdgeInsets.zero,
      onSelected: (value) {
        if (value == 'delete') {
          DeleteDialog.show(
            context: context,
            type: type,
            onDelete: onDelete,
          );
        } else {
          onEdit();
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
              value: 'edit',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.icons.icEdit.image(height: 25, color: context.colorScheme.primary),
                  const Gap(10),
                  Text(
                    context.l10n.edit,
                    style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: context.colorScheme.primary),
                  )
                ],
              )),
          PopupMenuItem(
              value:'delete',
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.delete,
                    color: context.colorScheme.primary,
                  ),
                  const Gap(10),
                  Text(
                    context.l10n.delete,
                    style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,color: context.colorScheme.primary),
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
