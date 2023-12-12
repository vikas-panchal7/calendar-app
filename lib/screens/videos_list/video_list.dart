import 'package:calendar_app/components/dialogs/delete_dialogs.dart';
import 'package:calendar_app/components/placeholder/empty_list_placeholder.dart';
import 'package:calendar_app/core/event_bus.dart';
import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/screens/addVideo/add_video.dart';
import 'package:calendar_app/services/EventBus/events.dart';
import 'package:calendar_app/services/firebase_helper/video_document.dart';
import 'package:calendar_app/services/preference_helper/pref_service.dart';
import 'package:calendar_app/services/repositories/videos_repository.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/common_functions.dart';
import 'package:calendar_app/utils/loading_helper/loading_handler.dart';
import 'package:calendar_app/utils/pagination/pagination_helper.dart';
import 'package:calendar_app/utils/pagination/pagination_listener.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

part 'video_list_provider.dart';
part 'video_list_ui.dart';
