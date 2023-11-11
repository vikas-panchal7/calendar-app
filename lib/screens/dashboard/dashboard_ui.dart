part of 'dashboard.dart';

class DashBoardUI extends StatelessWidget {
  static const String routeName = '/dashboard';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (context) {
        return DashboardProvider(
          context: context,
        );
      },
      builder: (context, child) {
        return const DashBoardUI();
      },
    );
  }

  const DashBoardUI({super.key});

  @override
  Widget build(BuildContext context) {


    final provider = context.read<DashboardProvider>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light, systemNavigationBarColor: context.colorScheme.primary),
      child: WillPopScope(
        onWillPop: () => onWillPop(context),
        child: Scaffold(
          appBar: AppBar(
            title:  Text(getTitle(context)),
             //  actions: [
             //    getAddButton(context)
             // ]
          ),
drawer: const DrawerWidget(),

            body: Selector<DashboardProvider, int>(
              selector: (context, dashboardProvider) => dashboardProvider.currentSelectedIndex,
              builder: (context, currentSelectedIndex, child) {
                switch (currentSelectedIndex) {
                  case 0:
                    return CalenderUI.builder(context);
                  case 1:
                    return BookListUI.builder(context);
                  case 2:
                    return VideoListUI.builder(context);
                  case 3:
                    return NewsListScreenUI.builder(context);
                }
                return const SizedBox();
              },
            ),
            bottomNavigationBar: Selector<DashboardProvider, int>(
              selector: (context, dashboardProvider) => dashboardProvider.currentSelectedIndex,
              builder: (context, currentIndex, child) {
                return Theme(
                  data: ThemeData(
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    splashColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(

                    showSelectedLabels: true,
                    currentIndex: currentIndex,
                    type: BottomNavigationBarType.fixed,
                    onTap: provider.onBottomNavigationBarTap,
                    backgroundColor: context.colorScheme.primary,
                    selectedItemColor: context.colorScheme.background,
                    unselectedItemColor: context.colorScheme.background.withOpacity(.7),
                    selectedFontSize: 12,
                    unselectedFontSize: 12,
                    elevation: 8,
                    items: [
                      BottomNavigationBarItem(
                          icon: Assets.icons.icCalendar.image(
                              height: 25,
                              color: currentIndex == 0
                                  ? context.colorScheme.background
                                  : context.colorScheme.background.withOpacity(.7)),
                          label: AppStrings.calendar),
                      BottomNavigationBarItem(
                          icon: Assets.icons.icBooks.image(
                              height: 25,
                              color: currentIndex == 1
                                  ? context.colorScheme.background
                                  : context.colorScheme.background.withOpacity(.7)),
                          label: AppStrings.books),
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Assets.icons.icVideos.image(
                                height: 20,
                                color: currentIndex == 2
                                    ? context.colorScheme.background
                                    : context.colorScheme.background.withOpacity(.7)),
                          ),
                          label: 'Videos'),
                      BottomNavigationBarItem(
                          icon: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Assets.icons.icNews.image(
                                height: 25,
                                color: currentIndex == 3
                                    ? context.colorScheme.background
                                    : context.colorScheme.background.withOpacity(.7)),
                          ),
                          label: 'News'),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }

  Future<bool> onWillPop(BuildContext context) async {
    ExitDialog.show(
      context: context,
    );
    return false;
  }

  String getTitle(BuildContext context) {
    int tab = context.select<DashboardProvider, int>((value) => value.currentSelectedIndex);
    switch (tab) {
      case 0:
        return AppStrings.calendar;
      case 1:
        return AppStrings.books;
      case 2:
        return AppStrings.videos;
      case 3:
        return AppStrings.news;
    }
    return '';
  }
  //
  // Widget getAddButton(BuildContext context) {
  //   int tab = context.select<DashboardProvider, int>((value) => value.currentSelectedIndex);
  //   CalendarPreference preference = CalendarPreference();
  //   if(preference.isAdminLogin && tab!=0){
  //     return CommonButton.cupertino(
  //         padding: const EdgeInsets.symmetric(horizontal: 20),
  //         onTap: () {
  //
  //           switch (tab) {
  //
  //             case 1:
  //               context.navigator.pushNamed(AddBookScreenUI.routeName);
  //               break;
  //             case 2:
  //               AddVideoDialog.show(context: context);
  //               break;
  //             case 3:
  //               context.navigator.pushNamed(AddNewsScreenUI.routeName);
  //               break;
  //           }
  //
  //         },
  //         child: Text(
  //           getAddTitle(tab),
  //           style: context.textTheme.titleSmall
  //               ?.copyWith(fontWeight: FontWeight.w600, color: context.colorScheme.onSecondary),
  //         ));
  //   }else{
  //     return const SizedBox();
  //   }
  //
  // }
  //
  //
  // String getAddTitle(int tab){
  //   switch (tab) {
  //
  //     case 1:
  //       return AppStrings.addBook;
  //     case 2:
  //       return AppStrings.addVideo;
  //     case 3:
  //       return AppStrings.addNews;
  //   }
  //   return '';
  // }
}
