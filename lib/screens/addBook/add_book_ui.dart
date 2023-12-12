part of 'add_book.dart';

class AddBookScreenUI extends StatelessWidget {
  static String get routeName => '/add_book';

  static Widget builder(BuildContext context) {
    BookInfo? bookInfo = context.args as BookInfo?;
    return ChangeNotifierProvider<AddBookProvider>(
      create: (context) => AddBookProvider(
          context: context,
          bookInfo: bookInfo,
          bookRepository: BookRepository(),
          loadingHandler: LoadingDialogHandler(context: context)),
      builder: (context, child) => const AddBookScreenUI(),
    );
  }

  const AddBookScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    AddBookProvider addBookProvider = context.read<AddBookProvider>();
    bool isEdit = context.select<AddBookProvider, bool>((value) => value.isEdit);

    return WillPopScope(
      onWillPop: addBookProvider.onWillPop,
      child: Form(
        key: addBookProvider.formKey,
        child: Scaffold(
          appBar: AppBar(
            title: Text(isEdit ? context.l10n.editBook : context.l10n.addBook),
            actions: [
              if (isEdit)
                CommonButton.icon(
                    onTap: addBookProvider.handleDeleteBook,
                    child: Icon(
                      Icons.delete,
                      color: context.colorScheme.onBackground,
                    ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(context.width * .04),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.bookTitle,
                    style: context.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.primary),
                  ),
                  Gap(context.height * .01),

                  /// eng title
                  CustomTextField(
                    title: context.l10n.inEnglish,
                    controller: addBookProvider.engTitle,
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
                    controller: addBookProvider.gujTitle,
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

                  /// hindi title
                  CustomTextField(
                    title: context.l10n.inHindi,
                    controller: addBookProvider.hindiTitle,
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

                  /// choose book
                  const _ChooseBookWidget(),
                  const Gap(5),
                  Selector<AddBookProvider, bool>(
                    selector: (context, addBookProvider) => addBookProvider.showBookRequiredMsg,
                    builder: (context, showBookRequiredMsg, child) {
                      if (showBookRequiredMsg) {
                        return Text(context.l10n.fileIsRequired,
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
          ),

          /// upload button
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonItem.filled(onTap: addBookProvider.handleUpload, text: isEdit ? context.l10n.editBook : context.l10n.uploadBook),
          ),
        ),
      ),
    );
  }
}

class _ChooseBookWidget extends StatelessWidget {
  const _ChooseBookWidget();

  @override
  Widget build(BuildContext context) {
    AddBookProvider addBookProvider = context.read<AddBookProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.chooseBook,
          style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.primary),
        ),
        const Gap(8),
        Selector<AddBookProvider, String?>(
          selector: (context, addBookProvider) => addBookProvider.selectedBookFile,
          builder: (context, selectedBookFile, child) {
            if (selectedBookFile == null) {
              return CommonButton.material(
                  onTap: addBookProvider.chooseBook,
                  radius: 12,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: context.colorScheme.primary)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add,
                          color: context.colorScheme.primary,
                        ),
                        const Gap(5),
                        Text(
                          context.l10n.addBook,
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
                    selectedBookFile,
                    style: context.textTheme.labelSmall,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child:
                            ButtonItem.outline(onTap: addBookProvider.viewFile, text: context.l10n.view, height: 45, fontSize: 16),
                      ),
                      Gap(context.width * .04),
                      Expanded(
                        child: ButtonItem.filled(
                            onTap: addBookProvider.chooseBook, text: context.l10n.change, height: 45, fontSize: 16),
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
