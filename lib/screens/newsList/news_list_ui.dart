part of 'news_list.dart';

class NewsListScreenUI extends StatelessWidget {
  const NewsListScreenUI({super.key});
  static const String routeName = '/newsList';
  static Widget builder(BuildContext context){
    return ChangeNotifierProvider<NewsListProvider>(create: (context) => NewsListProvider(context: context),

    builder:  (context, child) => const NewsListScreenUI(),
    );
  }



  @override
  Widget build(BuildContext context) {
    CalendarPreference preference = CalendarPreference();
    return Scaffold(
     /* appBar: AppBar(
        title: const Text(AppStrings.news),
        actions: [
          if (preference.isAdminLogin) ...[
            CommonButton.cupertino(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                onTap: () {
                  context.navigator.pushNamed(AddNewsScreenUI.routeName);
                },
                child: Text(
                  AppStrings.addNews,
                  style: context.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.onSecondary),
                ))
          ]
        ],
      ),*/
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigator.pushNamed(AddNewsScreenUI.routeName);
        },
        child: Icon(Icons.add,color: context.colorScheme.onSecondary,),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(7 , 5, 7, 80),
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
                    padding: const EdgeInsets.only(left: 8, right: 20),
                    child: Assets.images.news.image(height: 30),
                  ),
                  Expanded(
                    child: Text(
                      'News Title \nin2 lines',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  if(preference.isAdminLogin)...[
                    EditAndDeletePopUPMenu(
                      type: 'news',
                      onDelete: () {
                        context.navigator.pop();
                      },
                      onEdit: () {
                        context.navigator
                            .pushNamed(AddNewsScreenUI.routeName, arguments: AddNewsArguments(forUpdate: true));
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