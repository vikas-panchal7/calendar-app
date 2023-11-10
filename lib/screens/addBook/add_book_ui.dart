part of 'add_book.dart';

class AddBookScreenUI extends StatelessWidget {
  static String get routeName => '/add_book';

  static Widget builder(BuildContext context) {
    AddBookArguments? args = context.args as AddBookArguments?;
    return ChangeNotifierProvider<AddBookProvider>(
      create: (context) => AddBookProvider(context: context, args: args ?? AddBookArguments()),
      builder: (context, child) => const AddBookScreenUI(),
    );
  }

  const AddBookScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    AddBookProvider addBookProvider = context.read<AddBookProvider>();
    return WillPopScope(
      onWillPop: addBookProvider.onWillPop,
      child: Form(
        key: addBookProvider.formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(addBookProvider.args.forUpdate ? AppStrings.editBook : AppStrings.addBook),
            actions: [
              if (addBookProvider.args.forUpdate)
                CommonButton.icon(
                    onTap: addBookProvider.handleDeleteBook,
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
                  AppStrings.bookTitle,
                  style: context.textTheme.bodyLarge
                      ?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.primary),
                ),
                Gap(context.height * .01),

                /// eng title
                CustomTextField(
                  title: AppStrings.inEnglish,
                  controller: addBookProvider.engTitle,
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
                  controller: addBookProvider.gujTitle,
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
                Selector<AddBookProvider, bool>(
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
            child: ButtonItem.filled(onTap: addBookProvider.handleUpload, text: AppStrings.uploadBook),
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
    AddBookProvider addBookProvider = context.read<AddBookProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.chooseBook,
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.primary),
        ),
        const Gap(8),
        Selector<AddBookProvider, File?>(
          selector: (context, addBookProvider) => addBookProvider.bookFile,
          builder: (context, bookFile, child) {
            if (bookFile == null) {
              return CommonButton.material(
                  onTap: addBookProvider.chooseBook,
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
                          AppStrings.addBook,
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
                            onTap: addBookProvider.chooseBook, text: 'Change', height: 45, fontSize: 16),
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
