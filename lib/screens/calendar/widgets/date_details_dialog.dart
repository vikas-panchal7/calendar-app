part of '../calendar.dart';

class DateDetailsDialog extends StatelessWidget {
  static void show(
      {required BuildContext context,
      required DateTime date,
      String? imagePath,
      String? data,
      String? title,
      CalendarDateInfo? calendarData}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.height * 0.1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: DateDetailsDialog(
              date: date,
              calendarData: calendarData,
            ));
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
        Stack(
          alignment: Alignment.centerRight,
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
            CommonButton.cupertino(onTap: () {
              context.navigator.pop();

            }, child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
              child: Icon(Icons.close,color: context.colorScheme.onSecondary,),
            ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              if (calendarData == null) ...[
                ///show empty

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    AppStrings.noDataAvailable,
                    style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.onBackground),
                  ),
                ),
              ]  else ...[
                Gap(context.height * .01),

                /// title
                Text(
                  calendarData?.title.customTranslate(SupportedLanguage.english) ?? '',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                Gap(context.height * .015),

                /// data
                Text(
                  calendarData?.description.customTranslate(SupportedLanguage.english) ?? '',
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodySmall,
                ),
                if(calendarData?.videoUrl != null && (calendarData?.videoUrl??'').isNotEmpty)
                _VideoWidget(calendarData: calendarData,),
              ],
              if (preference.isAdminLogin) ...[
                Gap(context.height * .01),

                /// add-edit data button
                _ViewButton(
                  onTap: () {
                    // close the dialog
                    context.navigator.pop();

                    context.navigator.pushNamed(AddCalendarDataScreenUI.routeName,
                        arguments: AddCalendarDataScreenArgument(calendarDate: date, calendarDateInfo: calendarData));
                  },
                  title: calendarData != null ? AppStrings.edit : AppStrings.addData,
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class _ViewButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _ViewButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ButtonItem.filled(
      onTap: onTap,
      text: title,
      height: 45,
      fontSize: 14,
    );
  }
}


class _VideoWidget extends StatelessWidget {
  final CalendarDateInfo? calendarData;
  const _VideoWidget({this.calendarData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(calendarData?.ytThumbnail ?? '')),
        ),
        Text(
          calendarData?.ytTitle ?? '',
          textAlign: TextAlign.left,
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Gap(context.height * .01),
        _ViewButton(
          onTap: () {
            // close the dialog
            context.navigator.pop();

            openUrl(calendarData?.videoUrl ?? '');
          },
          title: 'View on Youtube',
        ),
      ],
    );
  }
}
