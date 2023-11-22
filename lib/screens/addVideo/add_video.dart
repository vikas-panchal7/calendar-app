import 'package:calendar_app/components/buttonItem/button_item.dart';
import 'package:calendar_app/components/customTextField/custom_text_field.dart';
import 'package:calendar_app/components/dialogs/delete_dialogs.dart';
import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/screens/addVideo/arguments.dart';
import 'package:calendar_app/services/firebase_helper/video_document.dart';
import 'package:calendar_app/services/repositories/videos_repository.dart';
import 'package:calendar_app/utils/loading_helper/loading_handler.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

part 'add_video_dialog.dart';
part 'add_video_provider.dart';