class CalendarDateInfo  {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime calendarDate;
  final CalendarDataType dataType;
  final Map title;
  final Map description;
  final String videoUrl;
  final String ytThumbnail;
  final String ytTitle;


  const CalendarDateInfo( {
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.calendarDate,
    required this.dataType,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.ytThumbnail,
    required this.ytTitle,
  });


  CalendarDateInfo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? calendarDate,
    CalendarDataType? dataType,
    Map? title,
    Map? description,
    String? videoUrl,
    String? ytThumbnail,
    String? ytTitle,

  }) {
    return CalendarDateInfo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      calendarDate: calendarDate ?? this.calendarDate,
      dataType: dataType ?? this.dataType,
      title: title ?? this.title,
      description: description ?? this.description,
      videoUrl: videoUrl?? this.videoUrl,
      ytTitle: ytTitle?? this.ytTitle,
      ytThumbnail: ytThumbnail?? this.ytThumbnail,
    );
  }
}

abstract interface class CalendarDateInfoDocumentFields {
  static const id = 'id';
  static const createdAt = 'createdAt';
  static const updatedAt = 'updatedAt';
  static const calendarDate = 'calendarDate';
  static const dataType = 'dataType';
  static const title = 'title';
  static const description = 'description';
  static const videoUrl = 'videoUrl';
  static const ytThumbnail = 'ytThumbnail';
  static const ytTitle = 'ytTitle';
}

enum CalendarDataType{
  data('data'),
  video('video');
  final String value;
  const CalendarDataType(this.value);
}
