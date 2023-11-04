import 'dart:io';

import 'package:calendar_app/services/firebase_helper/book_document.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BookRepository {
  final bookCollectionRef = FirebaseFireStoreHelper.bookCollectionRef;
  final bookRef = FirebaseFireStoreHelper.bookRef;

  Future<bool> addEditBook({
    required String englishTitle,
    required String gujaratiTitle,
    required String fileUrl,
    required FileType fileType,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String id,
  }) async {
    var titleMap = {
      "englishTitle": englishTitle,
      "gujaratiTitle": gujaratiTitle,
    };

    var data = {
      BookInfoDocumentFields.title: titleMap,
      BookInfoDocumentFields.fileUrl: fileUrl,
      BookInfoDocumentFields.createdAt: createdAt,
      BookInfoDocumentFields.updatedAt: updatedAt,
      BookInfoDocumentFields.fileType: fileType.name,
    };

    await bookCollectionRef.doc(id).update(data).onError((error, stackTrace) => false);

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

  deleteFileFromStorage({required String url}) async {
    final storageRef = FirebaseStorage.instance.ref(url);
    await storageRef.delete();
  }

  Future<BookInfo?> getBook({required String id}) async {
    var result = await bookRef.doc(id).get();
    return result.data();
  }

  void deleteBook({required String id}) async {
    await bookRef.doc(id).delete();
  }

  Future<List<BookInfo>> getBookList() async {
    var result = await bookRef.orderBy(BookInfoDocumentFields.createdAt, descending: true).get();
    List<BookInfo> toReturn = [];

    for (var element in result.docs) {
      toReturn.add(element.data());
    }
    return toReturn;
  }
}
