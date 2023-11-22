class BookInfo {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String fileUrl;
  final Map title;
  final BookFileType fileType;

  const BookInfo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.fileUrl,
    required this.title,
    required this.fileType,
  });

  BookInfo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? fileUrl,
    Map? title,
    BookFileType? fileType,
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
  static const id = 'id';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const fileUrl = 'fileUrl';
  static const title = 'title';
  static const fileType = 'fileType';
}

enum BookFileType {
  pdf('pdf'),
  word('doc');

  final String value;

  const BookFileType(this.value);
}
