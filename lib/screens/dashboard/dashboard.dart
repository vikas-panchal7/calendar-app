import 'package:calendar_app/components/dialogs/exit_dialog.dart';
import 'package:calendar_app/components/drawer/drawer_widget.dart';
import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/gen/assets.gen.dart';
import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/screens/addBook/add_book.dart';
import 'package:calendar_app/screens/addNews/add_news.dart';
import 'package:calendar_app/screens/addVideo/add_video.dart';
import 'package:calendar_app/screens/book_list/book_list.dart';
import 'package:calendar_app/screens/calendar/calendar.dart';
import 'package:calendar_app/screens/newsList/news_list.dart';
import 'package:calendar_app/screens/videos_list/video_list.dart';
import 'package:calendar_app/services/preference_helper/pref_service.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

part 'dashboard_provider.dart';
part 'dashboard_ui.dart';
