import 'package:calendar_app/services/firebase_helper/calendar_document.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
      'en': englishTitle,
      'gu': gujaratiTitle,
    };

    var data = {
      CalendarDateInfoDocumentFields.title: titleMap,
      CalendarDateInfoDocumentFields.description: descMap,
      CalendarDateInfoDocumentFields.createdAt: createdAt,
      CalendarDateInfoDocumentFields.updatedAt: updatedAt,
      CalendarDateInfoDocumentFields.calendarDate: calendarDate,
      CalendarDateInfoDocumentFields.dataType: calendarDataType.value,
      CalendarDateInfoDocumentFields.videoUrl: videoUrl
    };

    await calendarCollectionRef
        .doc(id)
        .set(data)
        .onError((error, stackTrace) => false);

    return true;
  }

  String getCalendarDetailId() => calendarCollectionRef.doc().id;

  Future<List<CalendarDateInfo>>  getCalendarDetails({required DateTime monthFirstDate}) async {
    final DateTime firstDate = monthFirstDate;
    DateTime temp = monthFirstDate.add(const Duration(days: 31));
    final DateTime lastDate = DateTime(temp.year, temp.month, 0);
    var query = calendarRef.where(Filter.and(
        Filter(CalendarDateInfoDocumentFields.calendarDate,
            isGreaterThanOrEqualTo: firstDate),
        Filter(CalendarDateInfoDocumentFields.calendarDate,
            isLessThanOrEqualTo: lastDate)));

    var result =  await query.get();
    List<CalendarDateInfo> calendarData = [];
        for (var element in result.docs) {
          calendarData.add(element.data());
        }
        return calendarData;
  }
}
