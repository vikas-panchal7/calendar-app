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

    listenEvent();
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

  void listenEvent() {

    eventBus.on<CalendarDeleteDataEvent>().listen(_onCalendarDeleteData);
    eventBus.on<CalendarDataAddEvent>().listen(_onCalendarAddData);
    eventBus.on<CalendarDataUpdateEvent>().listen(_onCalendarUpdateData);
  }

    void _onCalendarDeleteData(CalendarDeleteDataEvent event)  {
    int position =  _calendarDataList.indexWhere((element) => element.id == event.id);
    _calendarDataList = [..._calendarDataList,]..removeAt(position);
    notifyListeners();
  }

  void _onCalendarAddData(CalendarDataAddEvent event) {
    _calendarDataList = [..._calendarDataList,event.calendarDateInfo];
    notifyListeners();
  }

  void _onCalendarUpdateData(CalendarDataUpdateEvent event) {
    int position =  _calendarDataList.indexWhere((element) => element.id == event.calendarDateInfo.id);
    _calendarDataList.removeAt(position);
    _calendarDataList = [..._calendarDataList]..insert(position, event.calendarDateInfo);
    notifyListeners();
  }
}
