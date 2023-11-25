import 'package:calendar_app/services/firebase_helper/calendar_document.dart';

class AddCalendarDataScreenArgument{
  final DateTime calendarDate;
  final CalendarDateInfo? calendarDateInfo;

  AddCalendarDataScreenArgument({required this.calendarDate,  this.calendarDateInfo});
}