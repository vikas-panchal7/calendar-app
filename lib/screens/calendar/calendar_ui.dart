part of 'calendar.dart';

class CalenderUI extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<CalenderProvider>(
      create: (context) => CalenderProvider(context: context),
      builder: (context, child) => const CalenderUI(),
    );
  }

  const CalenderUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.calendar),
      ),
      body: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        calendarFormat: CalendarFormat.month,
      
      ),
    );
  }
}
