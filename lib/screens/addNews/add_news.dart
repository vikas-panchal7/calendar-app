import 'dart:io';

import 'package:calendar_app/components/buttonItem/button_item.dart';
import 'package:calendar_app/components/customTextField/custom_text_field.dart';
import 'package:calendar_app/components/dialogs/delete_dialogs.dart';
import 'package:calendar_app/components/dialogs/discard_dialog.dart';
import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/screens/addNews/arguments.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/image_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

part 'add_news_ui.dart';
part 'add_news_provider.dart';