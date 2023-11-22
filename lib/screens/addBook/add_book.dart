import 'dart:io';

import 'package:calendar_app/components/buttonItem/button_item.dart';
import 'package:calendar_app/components/customTextField/custom_text_field.dart';
import 'package:calendar_app/components/dialogs/delete_dialogs.dart';
import 'package:calendar_app/components/dialogs/discard_dialog.dart';
import 'package:calendar_app/constants/app_strings.dart';
import 'package:calendar_app/extensions/buildcontext_ext.dart';
import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/extensions/map_ext.dart';
import 'package:calendar_app/providers/language_provider.dart';
import 'package:calendar_app/services/EventBus/events.dart';
import 'package:calendar_app/utils/arguments.dart';
import 'package:calendar_app/screens/pdf_viewer/pdf_viewer.dart';
import 'package:calendar_app/services/firebase_helper/book_document.dart';
import 'package:calendar_app/services/repositories/book_repository.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/loading_helper/loading_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

part 'add_book_ui.dart';
part 'add_book_provider.dart';