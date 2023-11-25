import 'package:calendar_app/components/buttonItem/button_item.dart';
import 'package:calendar_app/components/customTabBar/customTabBar.dart';
import 'package:calendar_app/components/customTextField/custom_text_field.dart';
import 'package:calendar_app/components/dialogs/delete_dialogs.dart';
import 'package:calendar_app/components/dialogs/discard_dialog.dart';
import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/extensions/map_ext.dart';
import 'package:calendar_app/providers/language_provider.dart';
import 'package:calendar_app/screens/addCalendarData/arguments.dart';
import 'package:calendar_app/services/firebase_helper/calendar_document.dart';
import 'package:calendar_app/services/repositories/calendar_repository.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/loading_helper/loading_handler.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

part 'add_calendar_data_ui.dart';
part 'add_calendar_data_provider.dart';