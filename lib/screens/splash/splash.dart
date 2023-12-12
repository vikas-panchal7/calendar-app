
import 'dart:async';
import 'dart:developer';

import 'package:calendar_app/components/phoneNumberAndNameDialog/phone_number_and_name_dialog.dart';
import 'package:calendar_app/extensions/buildContext_ext.dart';
import 'package:calendar_app/extensions/int_ext.dart';
import 'package:calendar_app/gen/assets.gen.dart';
import 'package:calendar_app/core/base_provider.dart';
import 'package:calendar_app/screens/dashboard/dashboard.dart';
import 'package:calendar_app/services/firebase_helper/user_document.dart';
import 'package:calendar_app/services/repositories/admin_repository.dart';
import 'package:calendar_app/services/repositories/user_repository.dart';

import 'package:calendar_app/utils/commonButton/common_button.dart';
import 'package:calendar_app/utils/common_functions.dart';
import 'package:calendar_app/utils/enums.dart';
import 'package:calendar_app/utils/loading_helper/loading_handler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

part 'splash_provider.dart';
part 'splash_screen.dart';
