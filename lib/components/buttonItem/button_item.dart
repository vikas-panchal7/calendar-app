// ignore_for_file: library_private_types_in_public_api


import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:flutter/material.dart';

enum _ButtonEnum { outline, filled, text }

class ButtonItem extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? textColor;
  final bool? isEnable;
  late final _ButtonEnum buttonType;
  ButtonItem.filled({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
    this.radius,
    this.height,
    this.width,
    this.fontSize,
    this.textColor,
    this.isEnable = true,
  }) : super(key: key) {
    buttonType = _ButtonEnum.filled;
  }

  ButtonItem.outline({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
    this.radius,
    this.height,
    this.width,
    this.fontSize,
    this.textColor,
    this.isEnable = true,
  }) : super(key: key) {
    buttonType = _ButtonEnum.outline;
  }
  ButtonItem.text({
    Key? key,
    required this.onTap,
    required this.text,
    this.color,
    this.radius,
    this.height,
    this.width,
    this.fontSize,
    this.textColor,
    this.isEnable = true,
  }) : super(key: key) {
    buttonType = _ButtonEnum.text;
  }
  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case _ButtonEnum.filled:
        return _FilledButton(
          onTap: onTap,
          text: text,
          color: color,
          fontSize: fontSize,
          height: height,
          radius: radius,
          width: width,
          textColor: textColor,
          isEnable: isEnable??true,
        );
      case _ButtonEnum.outline:
        return _OutlineBorderButton(
          onTap: onTap,
          text: text,
          color: color,
          fontSize: fontSize,
          height: height,
          radius: radius,
          width: width,
          textColor: textColor,
          isEnable: isEnable??true,

        );
      case _ButtonEnum.text:
        return _TextButton(
          onTap: onTap,
          text: text,
          color: color,
          fontSize: fontSize,
          height: height,
          radius: radius,
          width: width,
          textColor: textColor,
          isEnable: isEnable??true,

        );
    }
  }
}

class _FilledButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? textColor;
  final bool isEnable;
  const _FilledButton(
      {required this.onTap,
      required this.text,
      this.color,
      this.radius,
      this.height,
      this.width,
      this.fontSize,
      this.textColor,
      required this.isEnable});

  @override
  Widget build(BuildContext context) {
    return CommonButton.material(
      onTap: onTap,
      radius: radius ?? 8,
      child: Container(
        height: height ?? context.height * .06,
        width: width ??double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isEnable? color ?? context.colorScheme.primary:context.colorScheme.surface,

            borderRadius: BorderRadius.circular(radius ?? 8)),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: textColor ?? context.colorScheme.background,
              fontSize: fontSize ?? 20,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _OutlineBorderButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? textColor;
  final bool isEnable;
  const _OutlineBorderButton(
      {required this.onTap,
      required this.text,
      this.color,
      this.radius,
      this.height,
      this.width,
      this.fontSize,
      this.textColor,
      required this.isEnable});

  @override
  Widget build(BuildContext context) {
    return CommonButton.material(
      onTap: onTap,
      radius: radius ?? 8,
      child: Container(
        height: height ?? context.height * .06,
        width: width ??double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color:isEnable? color ?? context.colorScheme.primary:context.colorScheme.surface),
            borderRadius: BorderRadius.circular(
              radius ?? 8,
            )),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:isEnable? textColor ?? context.colorScheme.primary:context.colorScheme.surface,
              fontSize: fontSize ?? 20,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _TextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? color;
  final double? radius;
  final double? height;
  final double? width;
  final double? fontSize;
  final Color? textColor;
  final bool isEnable;
  const _TextButton(
      {required this.onTap,
      required this.text,
      this.color,
      this.radius,
      this.height,
      this.width,
      this.fontSize,
      this.textColor, required this.isEnable});

  @override
  Widget build(BuildContext context) {
    return CommonButton.material(
      onTap: onTap,
      radius: radius ?? 8,
      child: Container(
        height: height ?? context.height * .06,
        width: width ??double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
          radius ?? 8,
        )),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color:isEnable? textColor ?? context.colorScheme.primary:context.colorScheme.surface,
              fontSize: fontSize ?? 20,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
