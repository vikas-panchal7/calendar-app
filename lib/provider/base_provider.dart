import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  BaseProvider({required this.context});
  final BuildContext context;
}
