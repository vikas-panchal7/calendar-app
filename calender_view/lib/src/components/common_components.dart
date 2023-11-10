// Copyright (c) 2021 Simform Solutions. All rights reserved.
// Use of this source code is governed by a MIT-style license
// that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../style/header_style.dart';
import '../typedefs.dart';

class CalendarPageHeader extends StatelessWidget {
  /// When user taps on right arrow.
  final VoidCallback? onNextDay;

  /// When user taps on left arrow.
  final VoidCallback? onPreviousDay;

  /// When user taps on title.
  final AsyncCallback? onTitleTapped;

  /// Date of month/day.
  final DateTime date;

  /// Secondary date. This date will be used when we need to define a
  /// range of dates.
  /// [date] can be starting date and [secondaryDate] can be end date.
  final DateTime? secondaryDate;

  /// Provides string to display as title.
  final StringProvider dateStringBuilder;

  /// Style for Calendar's header
  final HeaderStyle headerStyle;

  /// Common header for month and day view In this header user can define format
  /// in which date will be displayed by providing [dateStringBuilder] function.
  const CalendarPageHeader({
    Key? key,
    required this.date,
    required this.dateStringBuilder,
    this.onNextDay,
    this.onTitleTapped,
    this.onPreviousDay,
    this.secondaryDate,
    this.headerStyle = const HeaderStyle(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (headerStyle.leftIconVisible)
              IconButton(
                onPressed: onPreviousDay,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: headerStyle.leftIconPadding,
                icon: headerStyle.leftIcon ??
                    Icon(
                      Icons.chevron_left_rounded,
                      size: 30,
                      color: const Color(0xFF26282C),
                    ),
              ),
            Expanded(
              child: InkWell(
                onTap: onTitleTapped,
                child: Text(
                  dateStringBuilder(date, secondaryDate: secondaryDate),
                  textAlign: headerStyle.titleAlign,
                  style: TextStyle(color: const Color(0xFF26282C), fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            if (headerStyle.rightIconVisible)
              IconButton(
                onPressed: onNextDay,
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                padding: headerStyle.rightIconPadding,
                icon: headerStyle.rightIcon ??
                    Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: const Color(0xFF26282C),
                    ),
              ),
          ],
        ));

    Container(
      margin: headerStyle.headerMargin,
      padding: headerStyle.headerPadding,
      decoration: BoxDecoration(color: Color(0xFF445CFE)),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (headerStyle.leftIconVisible)
            IconButton(
              onPressed: onPreviousDay,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: headerStyle.leftIconPadding,
              icon: headerStyle.leftIcon ??
                  Icon(
                    Icons.chevron_left,
                    size: 30,
                    color: Colors.white,
                  ),
            ),
          Expanded(
            child: InkWell(
              onTap: onTitleTapped,
              child: Text(
                dateStringBuilder(date, secondaryDate: secondaryDate),
                textAlign: headerStyle.titleAlign,
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          if (headerStyle.rightIconVisible)
            IconButton(
              onPressed: onNextDay,
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: headerStyle.rightIconPadding,
              icon: headerStyle.rightIcon ??
                  Icon(
                    Icons.chevron_right,
                    size: 30,
                    color: Colors.white,
                  ),
            ),
        ],
      ),
    );
  }
}
