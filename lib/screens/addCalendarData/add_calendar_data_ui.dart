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
                ? context.l10n.editData
                : context.l10n.addData),
            actions: [
              if (addCalendarDataProvider.isEdit)
                CommonButton.icon(
                    onTap: addCalendarDataProvider.handleDeleteData,
                    child: Icon(
                      Icons.delete,
                      color: context.colorScheme.background,
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
                            tabList:  [
                              context.l10n.description,
                              context.l10n.addVideo
                            ],
                            onSelect: addCalendarDataProvider.toggleTab,
                            selectedTab: selectedSource,
                          ),
                          if (selectedSource == 0) ...{
                            Text(
                              context.l10n.title,
                              style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colorScheme.primary),
                            ),
                            Gap(context.height * .01),

                            /// eng title
                            CustomTextField(
                              title: context.l10n.inEnglish,
                              controller: addCalendarDataProvider.engTitle,
                              hintText: context.l10n.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return context.l10n.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),
                            const Gap(10),

                            /// guj title
                            CustomTextField(
                              title: context.l10n.inGujarati,
                              controller: addCalendarDataProvider.gujTitle,
                              hintText: context.l10n.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return context.l10n.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),  const Gap(10),

                            /// hindi title
                            CustomTextField(
                              title: context.l10n.inHindi,
                              controller: addCalendarDataProvider.hindiTitle,
                              hintText: context.l10n.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return context.l10n.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),

                            const Gap(24),
                            Text(
                              context.l10n.description,
                              style: context.textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colorScheme.primary),
                            ),
                            Gap(context.height * .01),

                            /// Desc eng
                            CustomTextField(
                              controller: addCalendarDataProvider.engDescription,
                              title: context.l10n.inEnglish,
                              hintText: context.l10n.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return context.l10n.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),
                            /// Desc guj
                            CustomTextField(
                              controller: addCalendarDataProvider.gujDescription,
                              title: context.l10n.inGujarati,
                              hintText: context.l10n.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return context.l10n.fieldIsRequired;
                                  }
                                }
                                return null;
                              },
                            ),
                            /// Desc hindi
                            CustomTextField(
                              controller: addCalendarDataProvider.hindiDescription,
                              title: context.l10n.inHindi,
                              hintText: context.l10n.writeHere,
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return context.l10n.fieldIsRequired;
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
                text: context.l10n.upload),
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
          context.l10n.addVideo,
          style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600, color: context.colorScheme.primary),
        ),
        const Gap(8),
        CustomTextField(
          controller: addCalendarDataProvider.videoUrl,
          hintText: context.l10n.writeHere,
          validator: (value) {
            if (value != null) {
              if (value.isEmpty) {
                return context.l10n.fieldIsRequired;
              }

            }
            return null;
          },
        )
      ],
    );
  }
}
