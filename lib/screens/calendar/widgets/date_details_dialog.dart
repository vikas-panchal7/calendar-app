part of '../calendar.dart';

class DateDetailsDialog extends StatelessWidget {
  static void show(
      {required BuildContext context, required DateTime date, String? imagePath, String? data, String? title}) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: context.width * .05, vertical: context.height * 0.1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: DateDetailsDialog(
              date: date,
              title: title ?? '',
              imagePath: imagePath ?? '',
              data: data ?? '',
            ));
      },
    );
  }

  final DateTime date;
  final String imagePath;
  final String data;
  final String title;

  const DateDetailsDialog({
    super.key,
    required this.date,
    this.imagePath = '',
    this.data = '',
    this.title = '',
  });

  @override
  Widget build(BuildContext context) {
    CalendarPreference preference = CalendarPreference();
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
                  ?.copyWith(color: context.colorScheme.onBackground, fontWeight: FontWeight.w600),
            )),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            children: [
              if (title.isEmpty && data.isEmpty && imagePath.isEmpty) ...{
                ///show empty
                Assets.images.noDataFound.image(height: context.height * .2),
                Text(
                  AppStrings.noDataAvailable,
                  style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.onSurface),
                ),

                /// add data button
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ButtonItem.filled(
                    onTap: () {
                      context.navigator.pushNamed(AddCalendarDataScreenUI.routeName);
                    },
                    text: AppStrings.addData,
                    height: 45,
                    fontSize: 14,
                  ),
                )
              } else ...{
                Gap(context.height * .01),

                ///edit button
                if (preference.isAdminLogin) ...[
                  Align(
                      alignment: Alignment.centerRight,
                      child: CommonButton.material(
                          radius: 5,
                          onTap: () {
                            //dialog close
                            context.navigator.pop();

                            context.navigator.pushNamed(AddCalendarDataScreenUI.routeName,
                                arguments: AddCalendarDataArguments(forUpdate: true));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              AppStrings.edit,
                              style: context.textTheme.bodySmall
                                  ?.copyWith(color: context.colorScheme.primary, fontWeight: FontWeight.w600),
                            ),
                          ))),
                ],

                Gap(context.height * .01),

                /// title
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
                ),
                Gap(context.height * .015),

                /// data
                Text(
                  data,
                  textAlign: TextAlign.start,
                  style: context.textTheme.bodySmall,
                ),
              }
            ],
          ),
        )
      ],
    );
  }
}
