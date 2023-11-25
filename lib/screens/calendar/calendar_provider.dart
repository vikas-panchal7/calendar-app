part of 'calendar.dart';

class CalenderProvider extends BaseProvider {
  final CalendarRepository calendarRepository;

  CalenderProvider({required super.context, required this.calendarRepository});

  bool _showProgress = false;
  late DateTime _currentMonthFirstDate;

  List<CalendarDateInfo> get calendarDataList => _calendarDataList;
  List<CalendarDateInfo> _calendarDataList = [];

  bool get showProgress => _showProgress;

  DateTime get currentMonthFirstDate => _currentMonthFirstDate;

  @override
  void initState() {
    _currentMonthFirstDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
    );
    getCurrentMonthData();
  }

  void onPageChange(DateTime date) {
    _calendarDataList.clear();
    _currentMonthFirstDate = date;
    getCurrentMonthData();
  }

  Future<void> getCurrentMonthData() async {
    _calendarDataList = await processApi(
      process: () async {
        return await calendarRepository.getCalendarDetails(
            monthFirstDate: currentMonthFirstDate);
      },
      loadingHandler: (isLoading) {
        _showProgress = isLoading;
        notifyListeners();
      },
    );
  }

  bool containsDate(DateTime date){
    for(int i =0;i< _calendarDataList.length ; i++){
      if(_calendarDataList[i].calendarDate == date){
        return true;
      }
    }
    return false;
  }
}
