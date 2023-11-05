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
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.books),
      ),
      body: ListView.builder(
        padding:
            EdgeInsets.symmetric(horizontal: context.width * .04, vertical: 10),
        itemCount: 20,
        itemBuilder: (context, index) {
          return CommonButton.cupertino(
            onTap: () {},
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: context.colorScheme.onBackground,
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
                      style: context.textTheme.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const EditAndDeletePopUPMenu()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

