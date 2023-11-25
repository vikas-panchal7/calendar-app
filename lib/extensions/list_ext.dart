import 'package:calendar_app/services/firebase_helper/calendar_document.dart';

extension $ListExtension on List<dynamic>{
  bool containsDate(DateTime dateTime){
    for(int i=0;i<length;i++){
      CalendarDateInfo temp = this[i] as CalendarDateInfo;
      if(temp.calendarDate == dateTime){
        return true;
      }
    }
    return false;
  }

  CalendarDateInfo?   containsData(DateTime dateTime){
    for(int i=0;i<length;i++){
      CalendarDateInfo temp = this[i] as CalendarDateInfo;
      if(temp.calendarDate == dateTime){
        return temp;
      }
    }
  }
}