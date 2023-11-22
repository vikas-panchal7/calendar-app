import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PaginationHelper<T extends Object?> {
  Future<void> onReload();

  Future<void> onLoadMore();

  List<T> get list;

  DocumentSnapshot? get lastDocument;

  bool get isLoading;
}

class PaginatedList<T extends Object?> {
  bool isAvailableMore;
  List<T> data;
  DocumentSnapshot? lastDocument;

  PaginatedList({required this.data, required this.isAvailableMore, required this.lastDocument});

  PaginatedList.empty({this.data = const [], this.isAvailableMore = false, this.lastDocument});
}
