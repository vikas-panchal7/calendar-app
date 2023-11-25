part of '../calendar.dart';

class DateDetailsDialog extends StatelessWidget {
  static void show(
      {required BuildContext context, required DateTime date, String? imagePath, String? data, String? title, CalendarDateInfo? calendarData}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.height * 0.1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: DateDetailsDialog(
              date: date,
              calendarData: calendarData,
            )
        );
      },
    );
  }

  final DateTime date;
  final CalendarDateInfo? calendarData;
  const DateDetailsDialog({
    super.key,
    required this.date,
    this.calendarData,
  });

  @override
  Widget build(BuildContext context) {
    CalendarPreference preference = CalendarPreference.instance;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            width: context.width,
            decoration: BoxDecoration(
                color: context.colorScheme.primary,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16))),
            child: Text(
              date.toDDMMMYYYY,
              style: context.textTheme.bodyLarge
                  ?.copyWith(color: context.colorScheme.onSecondary, fontWeight: FontWeight.w600),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              if (calendarData == null) ...[
                ///show empty

                Padding(padding: const EdgeInsets.symmetric(vertical: 40),child: Text(
                  AppStrings.noDataAvailable,
                  style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.onBackground),
                ),),



              ] else ...[



                Gap(context.height * .01),

                /// title
                Text(
                  calendarData?.title.customTranslate(SupportedLanguage.english)??'',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                Gap(context.height * .015),

                /// data
                Text(
                  calendarData?.description.customTranslate(SupportedLanguage.english)??'',
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodySmall,
                ),
              ],
              if(preference.isAdminLogin)...[
                Gap(context.height * .01),
                /// add-edit data button
                ButtonItem.filled(
                  onTap: () {
                    // close the dialog
                    context.navigator.pop();

                    context.navigator.pushNamed(AddCalendarDataScreenUI.routeName,arguments: AddCalendarDataScreenArgument(calendarDate: date,));
                  },
                  text:calendarData != null? AppStrings.edit:AppStrings.addData,
                  height: 45,
                  fontSize: 14,

                )
              ]
            ],
          ),
        )
      ],
    );
  }
}
