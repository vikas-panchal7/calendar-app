import 'package:calendar_app/services/firebase_helper/book_document.dart';
import 'package:calendar_app/services/firebase_helper/calendar_document.dart';

import 'package:calendar_app/services/firebase_helper/video_document.dart';

class BookUpdateEvent{
  final BookInfo bookInfo;

  BookUpdateEvent({required this.bookInfo});
}

class BookAddEvent{
  final BookInfo bookInfo;

  BookAddEvent({required this.bookInfo});
}
class BookDeleteEvent{
  final String id;

  BookDeleteEvent({required this.id});
}

class VideoAddEvent{
  final VideoInfo videoInfo;

  VideoAddEvent({required this.videoInfo});
}

class VideoDeleteEvent{
  final String id;

  VideoDeleteEvent({required this.id});
}


class CalendarDeleteDataEvent{
  final String id;
  CalendarDeleteDataEvent({required this.id});
}


class CalendarDataAddEvent{
  final CalendarDateInfo calendarDateInfo;
  CalendarDataAddEvent({required this.calendarDateInfo});
}

class CalendarDataUpdateEvent{
  final CalendarDateInfo calendarDateInfo;
  CalendarDataUpdateEvent({required this.calendarDateInfo});
}