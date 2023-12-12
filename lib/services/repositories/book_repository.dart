import 'dart:io';

import 'package:calendar_app/constants/app_constant.dart';
import 'package:calendar_app/core/event_bus.dart';
import 'package:calendar_app/services/EventBus/events.dart';
import 'package:calendar_app/services/firebase_helper/book_document.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';
import 'package:calendar_app/utils/pagination/pagination_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BookRepository {
  final bookCollectionRef = FirebaseFireStoreHelper.bookCollectionRef;
  final bookRef = FirebaseFireStoreHelper.bookRef;

  // EventBus eventBus = EventBus();

  Future<bool> addEditBook({
    required String englishTitle,
    required String gujaratiTitle,
    required String hindiTitle,
    required String fileUrl,
    required BookFileType fileType,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String id,
    required bool isEdit,
  }) async {
    var titleMap = {
      'en': englishTitle,
      'gu': gujaratiTitle,
      'hi': hindiTitle,
    };

    var data = {
      BookInfoDocumentFields.title: titleMap,
      BookInfoDocumentFields.fileUrl: fileUrl,
      BookInfoDocumentFields.createdAt: createdAt,
      BookInfoDocumentFields.updatedAt: updatedAt,
      BookInfoDocumentFields.fileType: fileType.name,
    };

    await bookCollectionRef.doc(id).set(data).onError((error, stackTrace) => false);
    if (isEdit) {
      eventBus.fire(BookUpdateEvent(
          bookInfo: BookInfo(
              id: id,
              createdAt: createdAt,
              updatedAt: updatedAt,
              fileUrl: fileUrl,
              title: titleMap,
              fileType: fileType)));
    } else {
      eventBus.fire(BookAddEvent(
          bookInfo: BookInfo(
              id: id,
              createdAt: createdAt,
              updatedAt: updatedAt,
              fileUrl: fileUrl,
              title: titleMap,
              fileType: fileType)));
    }
    return true;
  }

  String getBookId() => bookCollectionRef.doc().id;

  Future<String> uploadFileToStorage({required File file}) async {
    final storageRef = FirebaseStorage.instance.ref();
    final uploadFireRef =
        storageRef.child("books/${DateTime.now().microsecondsSinceEpoch}${file.path.split("/").last}");
    await uploadFireRef.putFile(file);
    var result = await uploadFireRef.getDownloadURL();
    return result;
  }

  void deleteFileFromStorage({required String url}) async {
    if (url.trim().isNotEmpty) {
      final storageRef = FirebaseStorage.instance.ref(url);
      try {
        await storageRef.delete();
      } catch (e) {}
    }
  }

  Future<BookInfo?> getBook({required String id}) async {
    var result = await bookRef.doc(id).get();
    return result.data();
  }

  Future<bool> deleteBook({required String id}) async {
    await bookRef.doc(id).delete().onError((error, stackTrace) => false);
    eventBus.fire(BookDeleteEvent(id: id));
    return true;
  }

  Future<PaginatedList<BookInfo>> getBookList({required DocumentSnapshot? lastDocument}) async {
    var query = bookRef.orderBy(BookInfoDocumentFields.createdAt, descending: true);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }
    query = query.limit(AppConst.paginationLength);

    var result = await query.get();
    List<BookInfo> toReturn = [];

    if (result.docs.isEmpty) {
      return PaginatedList.empty();
    }

    for (var element in result.docs) {
      toReturn.add(element.data());
    }
    return PaginatedList(
      data: toReturn,
      isAvailableMore: toReturn.length == AppConst.paginationLength,
      lastDocument: result.docs.last,
    );
  }
}
