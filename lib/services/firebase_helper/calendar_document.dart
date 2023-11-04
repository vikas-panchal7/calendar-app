import 'package:equatable/equatable.dart';

class CalendarDateInfo extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime calendarDate;
  final Map title;
  final Map description;

  const CalendarDateInfo({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.calendarDate,
    required this.title,
    required this.description,
  });

  @override
  List<Object?> get props => [id, createdAt, updatedAt, calendarDate, title, description];

  CalendarDateInfo copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? calendarDate,
    Map? title,
    Map? description,
  }) {
    return CalendarDateInfo(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      calendarDate: calendarDate ?? this.calendarDate,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}

abstract interface class CalendarDateInfoDocumentFields {
  static const id = "id";
  static const createdAt = "createdAt";
  static const updatedAt = "updatedAt";
  static const calendarDate = "calendarDate";
  static const title = "title";
  static const description = "description";
}
