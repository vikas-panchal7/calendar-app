import 'package:calendar_app/constants/app_strings.dart';
import 'package:equatable/equatable.dart';

class CalendarDateInfo extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime calendarDate;
  final CalendarDataType dataType;
  final Map title;
  final Map description;
  final String videoUrl;


  const CalendarDateInfo( {
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.calendarDate,
    required this.dataType,
    required this.title,
    required this.description,
    required this.videoUrl,
  });

  @override
  List<Object?> get props => [id, createdAt, updatedAt, calendarDate, title, description,dataType,videoUrl];

  CalendarDateInfo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? calendarDate,
    CalendarDataType? dataType,
    Map? title,
    Map? description,
    String? videoUrl,

  }) {
    return CalendarDateInfo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      calendarDate: calendarDate ?? this.calendarDate,
      dataType: dataType ?? this.dataType,
      title: title ?? this.title,
      description: description ?? this.description,
      videoUrl: AppStrings.videoUrl?? this.videoUrl
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
}

enum CalendarDataType{
  data('data'),
  video('video');
  final String value;
  const CalendarDataType(this.value);
}
