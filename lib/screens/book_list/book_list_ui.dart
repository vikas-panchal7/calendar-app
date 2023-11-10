part of 'book_list.dart';

class BookListUI extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<BookListProvider>(
      create: (context) => BookListProvider(context: context),
      builder: (context, child) => const BookListUI(),
    );
  }

  const BookListUI({super.key});

  @override
  Widget build(BuildContext context) {
    CalendarPreference preference = CalendarPreference();
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: context.width * .02, vertical: 7),
        itemCount: 20,
        itemBuilder: (context, index) {
          return CommonButton.cupertino(
            onTap: () {},
            child: Container(
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
                      'Book Title \nin2 lines',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  if(preference.isAdminLogin)...[
                    EditAndDeletePopUPMenu(
                      type: 'book',
                      onDelete: () {
                        context.navigator.pop();
                      },
                      onEdit: () {
                        context.navigator
                            .pushNamed(AddBookScreenUI.routeName, arguments: AddBookArguments(forUpdate: true));
                      },
                    )
                  ]

                ],
              ),
            ),
          );
        }, separatorBuilder: (BuildContext context, int index) { return const Gap(5); },
      ),
    );
  }
}
