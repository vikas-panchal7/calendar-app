import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final double width;
  final double? height;
  final List<String> tabList;
  final void Function(int) onSelect;
  final int selectedTab;
  const CustomTabBar({
    super.key,
    required this.width,
    this.height = 46,
    required this.tabList,
    required this.onSelect,
    required this.selectedTab,
  });

  final double padding = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      // duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(top: 8, bottom: 15),
      padding: EdgeInsets.all(padding),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: context.colorScheme.onSecondary,
          borderRadius: BorderRadius.circular(36)),
      child: Stack(
        children: [
          //white box
// (width - (padding * 2) meaning is  width - left and right side padding to get perfext width
          AnimatedPositioned(
            left: (((width - (padding * 2)) / tabList.length) * selectedTab)
                .roundToDouble(),
            top: 0,
            bottom: 0,
            duration: const Duration(milliseconds: 200),
            child: Container(
              width: (width - (2 * padding)) / tabList.length,
              decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(56)),
            ),
          ),

          Row(
              children: List.generate(
                  tabList.length,
                      (index) => Expanded(
                      child: CommonButton.cupertino(
                        onTap: () => onSelect(index),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              tabList[index],
                              style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: selectedTab == index
                                      ? context.colorScheme.onSecondary
                                      : context.colorScheme.onBackground),
                            )),
                      )))),
        ],
      ),
    );
  }
}
