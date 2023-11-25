import 'package:calendar_app/services/firebase_helper/admin_document.dart';
import 'package:calendar_app/services/firebase_helper/book_document.dart';
import 'package:calendar_app/services/firebase_helper/calendar_document.dart';
import 'package:calendar_app/services/firebase_helper/user_document.dart';
import 'package:calendar_app/services/firebase_helper/video_document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFireStoreHelper {
  /// Collection names
  static const _userCollectionPath = 'user';
  static const _bookCollectionPath = 'bookList';
  static const _calendarCollectionPath = 'calendarList';
  static const _adminCollectionPath = 'adminList';
  static const _videoCollectionPath = 'videoList';

  static final userCollectionRef =
      FirebaseFirestore.instance.collection(_userCollectionPath);
  static final bookCollectionRef = FirebaseFirestore.instance
      .collection(_bookCollectionPath); // collection reference
  static final calendarCollectionRef =
      FirebaseFirestore.instance.collection(_calendarCollectionPath);
  static final adminCollectionRef =
      FirebaseFirestore.instance.collection(_adminCollectionPath);
  static final videoCollectionRef =
      FirebaseFirestore.instance.collection(_videoCollectionPath);

  static final userRef = userCollectionRef.withConverter<UserInfo>(
    fromFirestore: (snapshot, options) {
      return UserInfo(
        id: snapshot.id,
        createdAt: snapshot.get(UserInfoDocumentFields.createdAt) as DateTime,
        updatedAt: snapshot.get(UserInfoDocumentFields.updatedAt) as DateTime,
        userName: snapshot.get(UserInfoDocumentFields.userName) as String,
        gmail: snapshot.get(UserInfoDocumentFields.gmail) as String,
        loginType: LoginType.values
            .where((element) => (element.name ==
                (snapshot.get(UserInfoDocumentFields.gmail) as String)))
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
  static final adminRef = adminCollectionRef.withConverter<AdminInfo>(
    fromFirestore: (snapshot, options) {
      return AdminInfo(
        id: snapshot.id,
        gmail: snapshot.get(UserInfoDocumentFields.gmail) as String,
      );
    },
    toFirestore: (value, options) {
      return {
        UserInfoDocumentFields.id: value.id,
        UserInfoDocumentFields.gmail: value.gmail,
      };
    },
  );

  // collection ref with object
  static final bookRef = bookCollectionRef.withConverter<BookInfo>(
    fromFirestore: (snapshot, options) {
      return BookInfo(
        id: snapshot.id,
        createdAt: (snapshot.get(BookInfoDocumentFields.createdAt) as Timestamp)
            .toDate(),
        updatedAt: (snapshot.get(BookInfoDocumentFields.updatedAt) as Timestamp)
            .toDate(),
        fileUrl: snapshot.get(BookInfoDocumentFields.fileUrl) as String,
        title: snapshot.get(BookInfoDocumentFields.title) as Map,
        fileType: BookFileType.values
            .where((element) => (element.name ==
                (snapshot.get(BookInfoDocumentFields.fileType) as String)))
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

  static final calendarRef =
      calendarCollectionRef.withConverter<CalendarDateInfo>(
    fromFirestore: (snapshot, options) {
      return CalendarDateInfo(
        id: snapshot.id,
        createdAt:
            (snapshot.get(CalendarDateInfoDocumentFields.createdAt) as Timestamp).toDate(),
        updatedAt:
            (snapshot.get(CalendarDateInfoDocumentFields.updatedAt) as Timestamp).toDate(),
        calendarDate: (snapshot.get(CalendarDateInfoDocumentFields.calendarDate)
            as Timestamp).toDate(),
        title: snapshot.get(CalendarDateInfoDocumentFields.title) as Map,
        description:
            snapshot.get(CalendarDateInfoDocumentFields.description) as Map,
        dataType: CalendarDataType.values
            .where((element) =>
                (element.name ==
                (snapshot.get(CalendarDateInfoDocumentFields.dataType) as String)))
            .first,
        videoUrl: snapshot.get(CalendarDateInfoDocumentFields.videoUrl) as String
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

  static final videoListRef = videoCollectionRef.withConverter<VideoInfo>(
    fromFirestore: (snapshot, options) {
      return VideoInfo(
        id: snapshot.id,
        createdAt:
            (snapshot.get(VideoInfoDocumentFields.createdAt) as Timestamp)
                .toDate(),
        updatedAt:
            (snapshot.get(VideoInfoDocumentFields.updatedAt) as Timestamp)
                .toDate(),
        thumbnailUrl:
            snapshot.get(VideoInfoDocumentFields.thumbnailUrl) as String,
        videoTitle: snapshot.get(VideoInfoDocumentFields.videoTitle) as String,
        videoUrl: snapshot.get(VideoInfoDocumentFields.videoUrl) as String,
      );
    },
    toFirestore: (value, options) {
      return {
        VideoInfoDocumentFields.id: value.id,
        VideoInfoDocumentFields.createdAt: value.createdAt,
        VideoInfoDocumentFields.updatedAt: value.updatedAt,
        VideoInfoDocumentFields.videoUrl: value.videoUrl,
        VideoInfoDocumentFields.thumbnailUrl: value.thumbnailUrl,
        VideoInfoDocumentFields.videoTitle: value.videoTitle,
      };
    },
  );
}
