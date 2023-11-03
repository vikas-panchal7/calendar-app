

import 'package:calendar_app/utils/configs.dart';

extension Ext on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  NavigatorState get navigator => Navigator.of(this);
}
