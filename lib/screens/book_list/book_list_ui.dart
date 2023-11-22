part of 'book_list.dart';

class BookListUI extends StatefulWidget {
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<BookListProvider>(
      create: (context) => BookListProvider(
        context: context,
        bookRepository: BookRepository(),
        loadingHandler: LoadingDialogHandler(context: context),
      ),
      builder: (context, child) => const BookListUI(),
    );
  }

  const BookListUI({super.key});

  @override
  State<BookListUI> createState() => _BookListUIState();
}

class _BookListUIState extends State<BookListUI> {
  @override
  Widget build(BuildContext context) {
    CalendarPreference preference = CalendarPreference();
    return Scaffold(
/*      appBar: AppBar(
        title: const Text(AppStrings.books),
        actions: [
          if (preference.isAdminLogin) ...[
            CommonButton.cupertino(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                onTap: () {
                  context.navigator.pushNamed(AddBookScreenUI.routeName);
                },
                child: Text(
                  AppStrings.addBook,
                  style: context.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.onSecondary),
                ))
          ]
        ],
      ),*/
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            context.navigator.pushNamed(AddBookScreenUI.routeName);
          },
          child: Icon(
            Icons.add,
            color: context.colorScheme.onSecondary,
          ),
        ),
        body: PaginationListener(
          onLoadMore: context.read<BookListProvider>().onLoadMore,
          onRefresh: context.read<BookListProvider>().onReload,
          child: Builder(
            builder: (context) {
              final list = context.select<BookListProvider, List<BookInfo?>>((value) => value.list);
              final isLoading = context.select<BookListProvider, bool>((value) => value.isLoading);

              if (isLoading && list.isEmpty) {
                return const LoadingIndicator();
              }

              if (list.isEmpty) {
                return const EmptyPlaceHolder();
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(7, 5, 7, 80),
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        BookInfo? bookInfo = list[index];
                        return CommonButton.cupertino(
                          onTap: () => context.read<BookListProvider>().viewPdf(list[index]),
                          child: Container(
                            height: 80,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: context.colorScheme.onSecondary,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                      color: context.colorScheme.onTertiary.withOpacity(.04),
                                      blurRadius: 16,
                                      offset: const Offset(0, 6))
                                ]),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 32),
                                  child: Assets.images.book.image(height: 30),
                                ),
                                Expanded(
                                  child: Text(
                                    bookInfo?.title.translate(context) ?? '',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ),
                                if (preference.isAdminLogin) ...[
                                  EditAndDeletePopUPMenu(
                                    type: 'book',
                                    onDelete: () {
                                      context.navigator.pop();
                                      context.read<BookListProvider>().deleteBook(list[index]?.id ?? '');
                                    },
                                    onEdit: () {
                                      context.navigator.pushNamed(AddBookScreenUI.routeName, arguments: bookInfo);
                                    },
                                  )
                                ]
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const Gap(5);
                      },
                    ),
                  ),
                  if (isLoading) ...[const LoadingIndicator(size: 80)]
                ],
              );
            },
          ),
        ));
  }
}
