part of 'calendar.dart';

class CalenderUI extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<CalenderProvider>(
      create: (context) => CalenderProvider(context: context, calendarRepository: CalendarRepository()),
      builder: (context, child) => Consumer<CalenderProvider>(
        builder: (context, value, child) {
          return const CalenderUI();
        },
      ),
    );
  }

  const CalenderUI({super.key});

  @override
  Widget build(BuildContext context) {
    CalenderProvider calenderProvider = context.read<CalenderProvider>();
    List<CalendarDateInfo> list =
        context.select<CalenderProvider, List<CalendarDateInfo>>((value) => value.calendarDataList);
    final preference = calenderProvider.calendarPreference;
    return Scaffold(
      extendBody: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              /// calender
              Expanded(
                child: CalendarControllerProvider(
                  controller: EventController(),
                  child: MonthView(
                    safeAreaOption: const SafeAreaOption(top: false),
                    onCellTap: (events, date) {
                      if (list.containsData(date) != null || preference.isAdminLogin) {
                        DateDetailsDialog.show(context: context, date: date, calendarData: list.containsData(date));
                      }
                    },
                    cellBuilder: (date, event, isToday, isInMonth) {
                      return Container(
                        decoration: BoxDecoration(
                            color: context.colorScheme.onSecondary,
                            border: Border.all(width: 0.2, color: context.colorScheme.onBackground.withOpacity(0.2))),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Center(
                                child: Container(
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                color: isToday ? context.colorScheme.primary : null,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                '${date.day}',
                                style: context.textTheme.bodyLarge!.copyWith(
                                    color: isToday
                                        ? context.colorScheme.background
                                        : (isInMonth ? null : context.colorScheme.onSurface.withOpacity(0.5))),
                              ),
                            )),
                            if (list.containsDate(date)) ...[
                              Container(
                                height: context.height * .01,
                                width: context.height * .01,
                                margin: EdgeInsets.only(bottom: context.height * .01),
                                decoration: BoxDecoration(color: context.colorScheme.primary, shape: BoxShape.circle),
                              ),
                            ]
                          ],
                        ),
                      );
                    },
                    onPageChange: (date, page) {
                      calenderProvider.onPageChange(date);
                    },
                  ),
                ),
              ),

              // CommonButton.cupertino(
              //   onTap: () {
              //     InfoDialog.show(context: context,title:'data dsjk sdjkf dskdf sjf sjdkf dsfs dfsd fsdf dsfjk f dsj dfskfdssfdjfsfjdsjkds fdj sd jdsfk d');
              //   },
              //   child: Container(
              //
              //     padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 16),
              //
              //     color: context.colorScheme.background,
              //   child: Row(
              //     children: [
              //       Icon(Icons.info_rounded,color: context.colorScheme.primary,),
              //       const Gap(10),
              //       Expanded(
              //         child: Text('data dsjk sdjkf dskdf sjf sjdkf dsfs dfsd fsdf dsfjk f dsj dfskfdssfdjfsfjdsjkds fdj sd jdsfk d',
              //           maxLines: 2,
              //           overflow: TextOverflow.ellipsis
              //           ,style: context.textTheme.titleSmall?.copyWith(),),
              //       ),
              //     ],
              //   ),
              //   ),
              // )
            ],
          ),
          Selector<CalenderProvider, bool>(
            selector: (context, calendarProvider) => calendarProvider.showProgress,
            builder: (context, showProgress, child) {
              if (showProgress) {
                return SizedBox(
                    width: context.width,
                    child: LinearProgressIndicator(
                      color: context.colorScheme.onBackground,
                    ));
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
