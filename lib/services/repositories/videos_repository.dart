import 'dart:io';

import 'package:calendar_app/constants/app_constant.dart';
import 'package:calendar_app/core/event_bus.dart';
import 'package:calendar_app/services/EventBus/events.dart';
import 'package:calendar_app/services/firebase_helper/firebase_firestore_helper.dart';
import 'package:calendar_app/services/firebase_helper/video_document.dart';
import 'package:calendar_app/utils/pagination/pagination_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;

class VideoRepository {
  final videoCollectionRef = FirebaseFireStoreHelper.videoCollectionRef;
  final videoRef = FirebaseFireStoreHelper.videoListRef;

  Future<bool> addEditVideo({
    required String videoUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String id,
  }) async {
    final result = await getThumbnailAndUrl(videoUrl);

    var data = {
      VideoInfoDocumentFields.videoTitle: result.$2,
      VideoInfoDocumentFields.thumbnailUrl: result.$1,
      VideoInfoDocumentFields.videoUrl: videoUrl,
      VideoInfoDocumentFields.createdAt: createdAt,
      VideoInfoDocumentFields.updatedAt: updatedAt
    };

    await videoCollectionRef.doc(id).set(data).onError((error, stackTrace) => false);

      eventBus.fire(VideoAddEvent(
          videoInfo: VideoInfo(
              id: id,
              createdAt: createdAt,
              updatedAt: updatedAt,
              videoTitle: result.$2,
              thumbnailUrl: result.$1,
              videoUrl: videoUrl)));

    return true;
  }

  String getVideoId() => videoCollectionRef.doc().id;

  Future<String> uploadFileToStorage({required File file}) async {
    final storageRef = FirebaseStorage.instance.ref();
    final uploadFireRef =
        storageRef.child("videoThumbnail/${DateTime.now().microsecondsSinceEpoch}${file.path.split("/").last}");
    await uploadFireRef.putFile(file);
    var result = await uploadFireRef.getDownloadURL();
    return result;
  }

  void deleteFileFromStorage({required String url}) async {
    if (url.trim().isNotEmpty) {
      final storageRef = FirebaseStorage.instance.ref(url);
      await storageRef.delete();
    }
  }

  Future<VideoInfo?> getVideo({required String id}) async {
    var result = await videoRef.doc(id).get();
    return result.data();
  }

  Future<bool> deleteVideo({required String id}) async {
    await videoRef.doc(id).delete().onError((error, stackTrace) => false);
    eventBus.fire(VideoDeleteEvent(id: id));
    return true;
  }

  Future<PaginatedList<VideoInfo>> getVideoList({required DocumentSnapshot? lastDocument}) async {
    var query = videoRef.orderBy(VideoInfoDocumentFields.createdAt, descending: true);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }
    query = query.limit(AppConst.paginationLength);

    var result = await query.get();
    List<VideoInfo> toReturn = [];

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
