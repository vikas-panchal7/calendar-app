part of 'add_news.dart';

class AddNewsScreenUI extends StatelessWidget {
  static String get routeName => '/add_news';

  static Widget builder(BuildContext context) {
    AddNewsArguments? args = context.args as AddNewsArguments?;
    return ChangeNotifierProvider<AddNewsProvider>(
      create: (context) => AddNewsProvider(context: context, args: args ?? AddNewsArguments()),
      builder: (context, child) => const AddNewsScreenUI(),
    );
  }

  const AddNewsScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewsProvider addNewsProvider = context.read<AddNewsProvider>();
    return WillPopScope(
      onWillPop: addNewsProvider.onWillPop,
      child: Form(
        key: addNewsProvider.formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(addNewsProvider.args.forUpdate ? AppStrings.editNews : AppStrings.addNews),
            actions: [
              if (addNewsProvider.args.forUpdate)
                CommonButton.icon(
                    onTap: addNewsProvider.handleDelete,
                    child: Icon(
                      Icons.delete,
                      color: context.colorScheme.onSecondary,
                    ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(context.width * .04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.newsTitle,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.primary),
                ),
                Gap(context.height * .01),

                /// eng title
                CustomTextField(
                  title: AppStrings.inEnglish,
                  controller: addNewsProvider.engTitle,
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
                  controller: addNewsProvider.gujTitle,
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

                /// choose book
                const _ChooseBookWidget(),
                const Gap(5),
                Selector<AddNewsProvider, bool>(
                  selector: (context, addBookProvider) => addBookProvider.showBookRequiredMsg,
                  builder: (context, showBookRequiredMsg, child) {
                    if (showBookRequiredMsg) {
                      return Text(AppStrings.fileIsRequired,
                          style: context.textTheme.labelMedium?.copyWith(
                            color: context.colorScheme.error,
                          ));
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),

          /// upload button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonItem.filled(onTap: addNewsProvider.handleUpload, text: AppStrings.upload),
          ),
        ),
      ),
    );
  }
}

class _ChooseBookWidget extends StatelessWidget {
  const _ChooseBookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewsProvider addBookProvider = context.read<AddNewsProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.chooseFile,
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.primary),
        ),
        const Gap(8),
        Selector<AddNewsProvider, File?>(
          selector: (context, addBookProvider) => addBookProvider.newsFile,
          builder: (context, bookFile, child) {
            if (bookFile == null) {
              return CommonButton.material(
                  onTap: addBookProvider.chooseFile,
                  radius: 12,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        color: context.colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: context.colorScheme.surface)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: context.colorScheme.primary,
                        ),
                        const Gap(5),
                        Text(
                          AppStrings.addNews,
                          style: context.textTheme.bodyLarge
                              ?.copyWith(color: context.colorScheme.primary, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ));
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookFile.path,
                    style: context.textTheme.labelSmall,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child:
                            ButtonItem.outline(onTap: addBookProvider.viewFile, text: 'View', height: 45, fontSize: 16),
                      ),
                      Gap(context.width * .04),
                      Expanded(
                        child: ButtonItem.filled(
                            onTap: addBookProvider.chooseFile, text: 'Change', height: 45, fontSize: 16),
                      )
                    ],
                  )
                ],
              );
            }
          },
        )
      ],
    );
  }
}
