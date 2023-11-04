import 'package:calendar_app/services/firebase_helper/book_document.dart';
import 'package:calendar_app/services/firebase_helper/calendar_document.dart';
import 'package:calendar_app/services/firebase_helper/user_document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStoreHelper {
  static const _userCollectionPath = "user";
  static const _bookCollectionPath = "bookList"; // collection name
  static const _calendarCollectionPath = "calendarList";

  static final userCollectionRef = FirebaseFirestore.instance.collection(_userCollectionPath);
  static final bookCollectionRef = FirebaseFirestore.instance.collection(_bookCollectionPath); // collection reference
  static final calendarCollectionRef = FirebaseFirestore.instance.collection(_calendarCollectionPath);

  static final userRef = userCollectionRef.withConverter<UserInfo>(
    fromFirestore: (snapshot, options) {
      return UserInfo(
        id: snapshot.id,
        createdAt: snapshot.get(UserInfoDocumentFields.createdAt) as DateTime,
        updatedAt: snapshot.get(UserInfoDocumentFields.updatedAt) as DateTime,
        userName: snapshot.get(UserInfoDocumentFields.userName) as String,
        gmail: snapshot.get(UserInfoDocumentFields.gmail) as String,
        loginType: LoginType.values
            .where((element) => (element.name == (snapshot.get(UserInfoDocumentFields.gmail) as String)))
            .first,
      );
    },
    toFirestore: (value, options) {
      return {
        UserInfoDocumentFields.id: value.id,
        UserInfoDocumentFields.createdAt: value.createdAt,
        UserInfoDocumentFields.updatedAt: value.updatedAt,
        UserInfoDocumentFields.userName: value.userName,
        UserInfoDocumentFields.gmail: value.gmail,
        UserInfoDocumentFields.loginType: value.loginType,
      };
    },
  );

  // collection ref with object
  static final bookRef = bookCollectionRef.withConverter<BookInfo>(
    fromFirestore: (snapshot, options) {
      return BookInfo(
        id: snapshot.id,
        createdAt: snapshot.get(BookInfoDocumentFields.createdAt) as DateTime,
        updatedAt: snapshot.get(BookInfoDocumentFields.updatedAt) as DateTime,
        fileUrl: snapshot.get(BookInfoDocumentFields.fileUrl) as String,
        title: snapshot.get(BookInfoDocumentFields.title) as Map,
        fileType: FileType.values
            .where((element) => (element.name == (snapshot.get(BookInfoDocumentFields.fileType) as String)))
            .first,
      );
    },
    toFirestore: (value, options) {
      return {
        BookInfoDocumentFields.id: value.id,
        BookInfoDocumentFields.createdAt: value.createdAt,
        BookInfoDocumentFields.updatedAt: value.updatedAt,
        BookInfoDocumentFields.fileType: value.fileType,
        BookInfoDocumentFields.title: value.title,
        BookInfoDocumentFields.fileUrl: value.fileUrl,
      };
    },
  );

  static final calendarRef = calendarCollectionRef.withConverter<CalendarDateInfo>(
    fromFirestore: (snapshot, options) {
      return CalendarDateInfo(
        id: snapshot.id,
        createdAt: snapshot.get(CalendarDateInfoDocumentFields.createdAt) as DateTime,
        updatedAt: snapshot.get(CalendarDateInfoDocumentFields.updatedAt) as DateTime,
        calendarDate: snapshot.get(CalendarDateInfoDocumentFields.calendarDate) as DateTime,
        title: snapshot.get(CalendarDateInfoDocumentFields.title) as Map,
        description: snapshot.get(CalendarDateInfoDocumentFields.description) as Map,
      );
    },
    toFirestore: (value, options) {
      return {
        CalendarDateInfoDocumentFields.id: value.id,
        CalendarDateInfoDocumentFields.createdAt: value.createdAt,
        CalendarDateInfoDocumentFields.updatedAt: value.updatedAt,
        CalendarDateInfoDocumentFields.calendarDate: value.calendarDate,
        CalendarDateInfoDocumentFields.title: value.title,
        CalendarDateInfoDocumentFields.description: value.description,
      };
    },
  );
}
