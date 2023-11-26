import 'package:calendar_app/core/event_bus.dart';
import 'package:calendar_app/services/EventBus/events.dart';
import 'package:calendar_app/services/firebase_helper/calendar_document.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class CalendarRepository {
  final calendarCollectionRef = FirebaseFireStoreHelper.calendarCollectionRef;
  final calendarRef = FirebaseFireStoreHelper.calendarRef;

  Future<bool> addEditDate({
    required String englishTitle,
    required String gujaratiTitle,
    required String englishDesc,
    required String gujaratiDesc,
    required String id,
    required DateTime calendarDate,
    required CalendarDataType calendarDataType,
    required String videoUrl,
    required bool isEdit,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) async {
    var titleMap = {
      'en': englishTitle,
      'gu': gujaratiTitle,
    };
    var descMap = {
      'en': englishDesc,
      'gu': gujaratiDesc,
    };

    (String thumbnail, String title) videoData = ('', '');
    if (videoUrl.isNotEmpty) {
      videoData = await getThumbnailAndUrl(videoUrl);
    }

    var data = {
      CalendarDateInfoDocumentFields.title: titleMap,
      CalendarDateInfoDocumentFields.description: descMap,
      CalendarDateInfoDocumentFields.createdAt: createdAt,
      CalendarDateInfoDocumentFields.updatedAt: updatedAt,
      CalendarDateInfoDocumentFields.calendarDate: calendarDate,
      CalendarDateInfoDocumentFields.dataType: calendarDataType.value,
      CalendarDateInfoDocumentFields.videoUrl: videoUrl,
      CalendarDateInfoDocumentFields.ytThumbnail: videoData.$1,
      CalendarDateInfoDocumentFields.ytTitle: videoData.$2,
    };

    await calendarCollectionRef.doc(id).set(data).onError((error, stackTrace) => false);
    if (isEdit) {
      eventBus.fire(CalendarDataUpdateEvent(
          calendarDateInfo: CalendarDateInfo(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        calendarDate: calendarDate,
        dataType: calendarDataType,
        title: titleMap,
        description: descMap,
        videoUrl: videoUrl,
        ytThumbnail: videoData.$1,
        ytTitle: videoData.$2,
      )));
    } else {
      eventBus.fire(CalendarDataAddEvent(
          calendarDateInfo: CalendarDateInfo(
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        calendarDate: calendarDate,
        dataType: calendarDataType,
        ytThumbnail: videoData.$1,
        ytTitle: videoData.$2,
        title: titleMap,
        description: descMap,
        videoUrl: videoUrl,
      )));
    }

    return true;
  }

  String getCalendarDetailId() => calendarCollectionRef.doc().id;

  Future<List<CalendarDateInfo>> getCalendarDetails({required DateTime monthFirstDate}) async {
    final DateTime firstDate = monthFirstDate;
    DateTime temp = monthFirstDate.add(const Duration(days: 31));
    final DateTime lastDate = DateTime(temp.year, temp.month, 0);
    var query = calendarRef.where(Filter.and(
        Filter(CalendarDateInfoDocumentFields.calendarDate, isGreaterThanOrEqualTo: firstDate),
        Filter(CalendarDateInfoDocumentFields.calendarDate, isLessThanOrEqualTo: lastDate)));

    var result = await query.get();
    List<CalendarDateInfo> calendarData = [];
    for (var element in result.docs) {
      calendarData.add(element.data());
    }
    return calendarData;
  }

  Future<bool> deleteData({required String id}) async {
    await calendarRef.doc(id).delete().onError((error, stackTrace) => false);
    eventBus.fire(CalendarDeleteDataEvent(id: id));
    return true;
  }

  Future<(String thumbnail, String title)> getThumbnailAndUrl(String videoUrl) async {
    var url = Uri.parse(videoUrl);
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    return (_getThumbnail(response.body), _getTitle(response.body));
  }

  String _getThumbnail(String data) {
    return data.split('''thumbnailUrl" href="''').last.split('''">''').first;
  }

  String _getTitle(String data) {
    return data.split('''<meta name="title" content="''').last.split('''">''').first;
  }
}
