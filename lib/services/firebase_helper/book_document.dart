import 'package:equatable/equatable.dart';

class BookInfo extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fileUrl;
  final Map title;
  final FileType fileType;

  const BookInfo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.fileUrl,
    required this.title,
    required this.fileType,
  });

  @override
  List<Object?> get props =>
      [id, createdAt, updatedAt, fileUrl, title, fileType];

  BookInfo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? fileUrl,
    Map? title,
    FileType? fileType,
  }) {
    return BookInfo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      fileUrl: fileUrl ?? this.fileUrl,
      title: title ?? this.title,
      fileType: fileType ?? this.fileType,
    );
  }
}

abstract interface class BookInfoDocumentFields {
  static const id = "id";
  static const createdAt = "createdAt";
  static const updatedAt = "updatedAt";
  static const fileUrl = "fileUrl";
  static const title = "title";
  static const fileType = "fileType";
}

enum FileType { pdf, word }
