import 'package:calendar_app/services/firebase_helper/calendar_document.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';

class CalendarRepository {
  final calendarCollectionRef = FirebaseFireStoreHelper.calendarCollectionRef;
  final calendarRef = FirebaseFireStoreHelper.calendarRef;

  Future<bool> addDate({
    required String englishTitle,
    required String gujaratiTitle,
    required String englishDesc,
    required String gujaratiDesc,
    required String id,
    required DateTime selectedDate,
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
      CalendarDateInfoDocumentFields.calendarDate: selectedDate,
    };

    await calendarCollectionRef.doc(id).update(data).onError((error, stackTrace) => false);

    return true;
  }

  String getCalendarDetailId() => calendarCollectionRef.doc().id;

  getCalendarDetails() {}
}
