part of '../calendar.dart';

class DateDetailsDialog extends StatelessWidget {
  static Future show(
      {required BuildContext context,
      required DateTime date,
      String? imagePath,
      String? data,
      String? title,
      CalendarDateInfo? calendarData}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(
                horizontal: context.width * .05,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
        Container(
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          width: context.width,
          decoration: BoxDecoration(
              color: context.colorScheme.primary,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16))),
          height: kToolbarHeight,
          child: NavigationToolbar(
              middle: Text(
                date.toDDMMMYYYY,
                style: context.textTheme.bodyLarge?.copyWith(
                    color: context.colorScheme.onBackground,
                    fontWeight: FontWeight.w600),
              ),
              trailing: CommonButton.cupertino(
                  onTap: () {
                    context.navigator.pop();
                  },
                  child: Icon(
                    Icons.close,
                    color: context.colorScheme.onBackground,
                  ))),
        ),


        Container(
          constraints: BoxConstraints(maxHeight: context.height * .8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  if (calendarData == null) ...[
                    ///show empty

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Text(
                        context.l10n.noDataAvailable,
                        style: context.textTheme.titleSmall?.copyWith(
                            color: context.colorScheme.primary),
                      ),
                    ),
                  ] else ...[
                    Gap(context.height * .01),

                    /// title
                    Text(
                      calendarData?.title
                              .customTranslate(preference.appLanguage) ??
                          '',
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    Gap(context.height * .015),

                    /// data
                    Text(
                      calendarData?.description
                              .customTranslate(preference.appLanguage) ??
                          '',
                      textAlign: TextAlign.start,
                      style: context.textTheme.bodySmall,
                    ),
                    if (calendarData?.videoUrl != null &&
                        (calendarData?.videoUrl ?? '').isNotEmpty)
                      _VideoWidget(
                        calendarData: calendarData,
                      ),
                  ],
                  if (preference.isAdminLogin) ...[
                    Gap(context.height * .01),

                    /// add-edit data button
                    _ViewButton(
                      onTap: () {
                        // close the dialog
                        context.navigator.pop();

                        context.navigator.pushNamed(
                            AddCalendarDataScreenUI.routeName,
                            arguments: AddCalendarDataScreenArgument(
                                calendarDate: date,
                                calendarDateInfo: calendarData));
                      },
                      title: calendarData != null
                          ? context.l10n.edit
                          : context.l10n.addData,
                    ),
                  ]
                ],
              ),
            ),
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
        if(isYoutubeUrl(calendarData?.videoUrl??''))...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(calendarData?.ytThumbnail ?? '')),
          ),
          Text(
            calendarData?.ytTitle ?? '',
            textAlign: TextAlign.left,
            style: context.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),
        ]else...[
          const Gap(20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              context.l10n.link,
              textAlign: TextAlign.left,
              style: context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w700,color: context.colorScheme.primary),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(

              calendarData?.videoUrl ?? '',
              textAlign: TextAlign.left,
    maxLines: 1,
              style: context.textTheme.bodyLarge
                  ?.copyWith(
                color: context.colorScheme.onSecondary
              ),
            ),
          ),
        ],



        Gap(context.height * .01),
        _ViewButton(
          onTap: () {
            // close the dialog
            context.navigator.pop();

            openUrl(calendarData?.videoUrl ?? '');
          },
          title: context.l10n.viewVideo,
        ),
      ],
    );
  }
}
