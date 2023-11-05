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
      body: Builder(builder: (context) {
        return CalendarControllerProvider(
          controller: EventController(),
          child: MonthView(
            safeAreaOption: const SafeAreaOption(top: false),
            cellBuilder: (date, event, isToday, isInMonth) {
              return Container(

                decoration: BoxDecoration(
                    color: isInMonth ? context.colorScheme.onPrimary : context.colorScheme.surface.withOpacity(0.1),
                    border: Border.all(width: 0.2, color: context.colorScheme.primary.withOpacity(0.2))),
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
                            ? context.colorScheme.onBackground
                            : (isInMonth ? null : context.colorScheme.onSurface.withOpacity(0.5))),
                  ),
                )),
              );
            },
          ),
        );
      }),
    );
  }
}
