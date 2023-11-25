import 'package:calendar_app/services/firebase_helper/calendar_document.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';

class CalendarRepository {
  final calendarCollectionRef = FirebaseFireStoreHelper.calendarCollectionRef;
  final calendarRef = FirebaseFireStoreHelper.calendarRef;

  Future<bool> addEDitDate({
    required String englishTitle,
    required String gujaratiTitle,
    required String englishDesc,
    required String gujaratiDesc,
    required String id,
    required DateTime calendarDate,
    required CalendarDataType calendarDataType,
    required String videoUrl,
    required bool isEdit,

  }) async {
    var titleMap = {
      "en": englishTitle,
      "gu": gujaratiTitle,
    };
    var descMap = {
      "en": englishTitle,
      "gu": gujaratiTitle,
    };

    var data = {
      CalendarDateInfoDocumentFields.title: titleMap,
      CalendarDateInfoDocumentFields.description: descMap,
      CalendarDateInfoDocumentFields.createdAt: DateTime.timestamp(),
      CalendarDateInfoDocumentFields.updatedAt: DateTime.timestamp(),
      CalendarDateInfoDocumentFields.calendarDate: calendarDate,
      CalendarDateInfoDocumentFields.dataType: calendarDataType,
      CalendarDateInfoDocumentFields.videoUrl: videoUrl
    };

    await calendarCollectionRef.doc(id).set(data).onError((error, stackTrace) => false);

    return true;
  }

  String getCalendarDetailId() => calendarCollectionRef.doc().id;

  getCalendarDetails() {}
}
