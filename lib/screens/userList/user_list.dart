import 'package:calendar_app/components/placeholder/empty_list_placeholder.dart';
import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/gen/assets.gen.dart';
import 'package:calendar_app/services/firebase_helper/user_document.dart';
import 'package:calendar_app/services/repositories/user_repository.dart';
import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/loading_helper/loading_handler.dart';
import 'package:calendar_app/utils/pagination/pagination_helper.dart';
import 'package:calendar_app/utils/pagination/pagination_listener.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

part 'user_list_screen.dart';
part 'user_list_provider.dart';