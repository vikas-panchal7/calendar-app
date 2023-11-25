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
                      DateDetailsDialog.show(
                          context: context,
                          date: date,
                          // title: 'title title',
                          // data:
                          // "This will generate Dart libraries, one per locale, which contain the translated versions. Your Dart libraries can import the primary file, named <prefix>messages_all.dart, and then call the initialization for a specific locale. Once that's done, any Intl.message calls made in the context of that locale will automatically print the translated version instead of the original."
                      );
                    },
                    cellBuilder: (date, event, isToday, isInMonth) {
                      return Container(
                        decoration: BoxDecoration(
                            color:context.colorScheme.onSecondary,
                            border: Border.all(
                                width: 0.2,
                                color: context.colorScheme.onBackground.withOpacity(0.2))),
                        child: Center(
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
                                        : (isInMonth
                                        ? null
                                        : context.colorScheme.onSurface
                                        .withOpacity(0.5))),
                              ),
                            )),
                      );
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
          if(false)
          SizedBox(
              width: context.width,
              child: LinearProgressIndicator(color: context.colorScheme.onBackground,))
        ],
      ),
    );
  }
}
