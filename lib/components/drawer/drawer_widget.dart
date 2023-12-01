import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/extensions/int_ext.dart';
import 'package:calendar_app/gen/assets.gen.dart';
import 'package:calendar_app/providers/language_provider.dart';
import 'package:calendar_app/services/preference_helper/pref_service.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

part 'drawer_provider.dart';

class DrawerWidget extends StatelessWidget {
  static Widget open(BuildContext context) {
    return ChangeNotifierProvider<_DrawerProvider>(
      create: (context) => _DrawerProvider(context: context),
      builder: (context, child) => const DrawerWidget(),
    );
  }

  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CalendarPreference preference = CalendarPreference.instance;
    return Drawer(
      backgroundColor: context.colorScheme.primary,
      shape: const RoundedRectangleBorder(),
      width: context.width * .7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(context.mPadding.top + 20),
          Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Assets.temp.appLogo.image(width: context.width * .3)),
          ),
          const Gap(20),
          if (preference.userName.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Text(
                '${context.l10n.hello}, ${preference.userName}',
                style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onSecondary,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
          if (preference.userId.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Text(
                preference.userId,
                style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.background,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
          const _LanguageChangeTile(),
          _CommonTile(
            title: context.l10n.logout,
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
          Center(
            child: Text(
              'Version 1.0.0',
              style: context.textTheme.titleSmall
                  ?.copyWith(color: context.colorScheme.onSecondary),
            ),
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

  const _CommonTile({required this.title, required this.onTap});

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
                  style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.w600),
                ),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: context.colorScheme.background, size: 15),
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



class _LanguageChangeTile extends StatelessWidget {
  const _LanguageChangeTile();

  @override
  Widget build(BuildContext context) {
    _DrawerProvider drawerProvider = Provider.of<_DrawerProvider>(context);
    return Column(
      children: [
        CommonButton.cupertino(
            padding: const EdgeInsets.all(10),
            onTap: drawerProvider.toggleLangTile,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.language,
                  style: context.textTheme.bodyLarge?.copyWith(
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.w600),
                ),


                RotatedBox(
                  quarterTurns: drawerProvider.langTileExpanded?1:0,
                  child: Icon(Icons.arrow_forward_ios_rounded,
                      color: context.colorScheme.background, size: 15),
                ),

              ],
            )),
        AnimatedSize(
          duration:  300.milliseconds,

          child: SizedBox(
            height: drawerProvider.langTileExpanded? null:0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _RadioTile(
                    value: SupportedLanguage.english,
                    groupValue: drawerProvider.selectedLanguage,
                    onChange: drawerProvider.changeLanguage,
                    title: 'English',
                  ),
                  _RadioTile(
                    value:  SupportedLanguage.gujarati,
                    groupValue:drawerProvider.selectedLanguage,
                    onChange: drawerProvider.changeLanguage,
                    title: 'ગુજરાતી',
                  ),
                  const Gap(10),
                ],
              ),
            ),
          ),
        ),
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

class _RadioTile extends StatelessWidget {
  final SupportedLanguage value;
  final SupportedLanguage groupValue;
  final Function(SupportedLanguage?) onChange;
  final String title;
  const _RadioTile({required this.value, required this.groupValue, required this.onChange, required this.title});

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: () => onChange(value),
      child: Row(
        children: [
          Radio<SupportedLanguage>(
            value: value,
            groupValue: groupValue,
            onChanged: onChange,
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeColor: context.colorScheme.onSecondary,

          ),
          Text(
            title,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

