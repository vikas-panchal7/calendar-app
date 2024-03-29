import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/gen/assets.gen.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final TextEditingController controller;
  final String hintText;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final int? maxLine;
  final int? maxLength;
  final TextInputType? keyboardType;

  const CustomTextField(
      {super.key,
       this.title,
      required this.controller,
      required this.hintText,
      this.suffix,
      this.validator, this.maxLine, this.maxLength, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title !=null)...[
          Text(
            title??'',
            style: context.textTheme.bodySmall?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.w600),
          ),
          const Gap(8),
        ],

        TextFormField(

          controller: controller,
          validator: validator,
          maxLines: maxLine,
          maxLength: maxLength,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              hintText: hintText,
              helperText: '',
counterText: '',
              suffixIcon:suffix?? CommonButton.cupertino(
                  onTap: () async {
                    ClipboardData? data = await Clipboard.getData('text/plain');
                    if (data != null) {
                      controller.text = data.text ?? '';
                    }
                  },
                  child: Assets.icons.icPaste.image(height: 25,color: context.colorScheme.primary))),
        )
      ],
    );
  }

// InputBorder get _border(BuildContext context)=>OutlineInputBorder(
//   borderRadius: BorderRadius.circular(8)
// );
}
