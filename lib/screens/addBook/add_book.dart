import 'dart:io';

import 'package:calendar_app/components/buttonItem/button_item.dart';
import 'package:calendar_app/components/customTextField/custom_text_field.dart';
import 'package:calendar_app/components/dialogs/delete_dialogs.dart';
import 'package:calendar_app/components/dialogs/discard_dialog.dart';
import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/provider/base_provider.dart';
import 'package:calendar_app/screens/addBook/arguments.dart';
import 'package:calendar_app/screens/book_list/book_list.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/common_functions.dart';
import 'package:calendar_app/utils/enums.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

part 'add_book_ui.dart';
part 'add_book_provider.dart';