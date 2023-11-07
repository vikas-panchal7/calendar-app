
import 'package:intl/intl.dart';

extension DateTimeExt on DateTime{
  String get toDDMMMYYYY{
      return DateFormat('dd MMM, yyyy').format(this);
  }
}