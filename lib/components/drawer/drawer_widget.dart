import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/gen/assets.gen.dart';
import 'package:calendar_app/screens/donateUs/donate_us.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.colorScheme.primary,
      shape: const RoundedRectangleBorder(),
      width: context.width * .7,
      child: Column(
        children: [
          Gap(context.mPadding.top + 20),
          ClipRRect(
              borderRadius: BorderRadius.circular(12.0), child: Assets.temp.appLogo.image(width: context.width * .3)),
          const Gap(20),
          _CommonTile(
            title: AppStrings.selectLanguage,
            onTap: () {},
          ),
          _CommonTile(
            title: "Logout",
            onTap: () {
              logout(context);
            },
          ),
          // _CommonTile(
          //   title: AppStrings.donateUs,
          //   onTap: () {
          //     context.navigator.pop();
          //     context.navigator.pushNamed(DonateUsScreenUI.routeName);
          //   },
          // ),
          // _CommonTile(
          //   title: AppStrings.social,
          //   onTap: () {},
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       Assets.images.whatsapp.image(width: context.width *.08),
          //       Assets.images.facebook.image(width: context.width *.08),
          //       Assets.images.instagram.image(width: context.width *.08),
          //     ],
          //   ),
          // ),
          const Spacer(),
          Text(
            'Version 1.0.0',
            style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.onSecondary),
          ),
          const Gap(10),
        ],
      ),
    );
  }
}

class _CommonTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _CommonTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonButton.cupertino(
            padding: const EdgeInsets.all(10),
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(color: context.colorScheme.onSecondary, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_forward_ios_rounded, color: context.colorScheme.background, size: 15),
              ],
            )),
        Divider(
          height: 0,
          color: context.colorScheme.background.withOpacity(.5),
          endIndent: 10,
          indent: 10,
        )
      ],
    );
  }
}
