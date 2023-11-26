part of 'add_calendar_data.dart';

class AddCalendarDataScreenUI extends StatelessWidget {
  static const routeName = '/addCalendarData';

  static Widget builder(BuildContext context) {
    AddCalendarDataScreenArgument? argument =
        context.args as AddCalendarDataScreenArgument;
    return ChangeNotifierProvider<AddCalendarDataProvider>(
      create: (context) => AddCalendarDataProvider(
          context: context,
           calendarDate: argument.calendarDate,
          calendarDataInfo: argument.calendarDateInfo ,
        calendarRepository: CalendarRepository(),
        loadingDialogHandler: LoadingDialogHandler(context: context)

      ),
      builder: (context, child) => const AddCalendarDataScreenUI(),
    );
  }

  const AddCalendarDataScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    AddCalendarDataProvider addCalendarDataProvider =
        context.read<AddCalendarDataProvider>();
    return WillPopScope(
      onWillPop: addCalendarDataProvider.onWillPop,
      child: Form(
        key: addCalendarDataProvider.formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(addCalendarDataProvider.isEdit
                ? AppStrings.editData
                : AppStrings.addData),
            actions: [
              if (addCalendarDataProvider.isEdit)
                CommonButton.icon(
                    onTap: addCalendarDataProvider.handleDeleteData,
                    child: Icon(
                      Icons.delete,
                      color: context.colorScheme.onSecondary,
                    ))
            ],
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.all(context.width * .04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Selector<AddCalendarDataProvider, int>(
                    selector: (context, addCalendarDataProvider) =>
                        addCalendarDataProvider.selectedSource,
                    builder: (context, selectedSource, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTabBar(
                            width: context.width - 40,
                            tabList: const [
                              AppStrings.description,
                              AppStrings.addVideo
                            ],
                            onSelect: addCalendarDataProvider.toggleTab,
                            selectedTab: selectedSource,
                          ),
                          if (selectedSource == 0) ...{
                            Text(
                              AppStrings.title,
                              style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colorScheme.primary),
                            ),
                            Gap(context.height * .01),

                            /// eng title
                            CustomTextField(
                              title: AppStrings.inEnglish,
                              controller: addCalendarDataProvider.engTitle,
                              hintText: AppStrings.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return AppStrings.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),
                            const Gap(10),

                            /// guj title
                            CustomTextField(
                              title: AppStrings.inGujarati,
                              controller: addCalendarDataProvider.gujTitle,
                              hintText: AppStrings.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return AppStrings.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),

                            const Gap(24),
                            Text(
                              AppStrings.description,
                              style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colorScheme.primary),
                            ),
                            Gap(context.height * .01),

                            /// Desc eng
                            CustomTextField(
                              controller: addCalendarDataProvider.engDescription,
                              title: AppStrings.inEnglish,
                              hintText: AppStrings.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return AppStrings.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),
                            /// Desc guj
                            CustomTextField(
                              controller: addCalendarDataProvider.gujDescription,
                              title: AppStrings.inGujarati,
                              hintText: AppStrings.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return AppStrings.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),
                          } else ...{
                            /// select image option

                            const _AddVideoWidget()
                          }
                        ],
                      );
                    },
                  ),
                ],
              )),

          /// upload button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonItem.filled(
                onTap: addCalendarDataProvider.handleUpload,
                text: AppStrings.upload),
          ),
        ),
      ),
    );
  }
}

class _AddVideoWidget extends StatelessWidget {
  const _AddVideoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AddCalendarDataProvider addCalendarDataProvider =
        context.read<AddCalendarDataProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.addVideo,
          style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600, color: context.colorScheme.primary),
        ),
        const Gap(8),
        CustomTextField(
          controller: addCalendarDataProvider.videoUrl,
          hintText: AppStrings.writeHere,
          validator: (value) {
            if (value != null) {
              if (value.isEmpty) {
                return AppStrings.fieldIsRequired;
              }
              if ((value.contains('youtu') == false) && (value.contains('yt') == false)) {
                return 'Please enter valid link';
              }
            }
            return null;
          },
        )
      ],
    );
  }
}
