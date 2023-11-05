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
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: context.colorScheme.onBackground),
      child: Scaffold(
          body: Selector<DashboardProvider, int>(
            selector: (context, dashboardProvider) =>
                dashboardProvider.currentSelectedIndex,
            builder: (context, currentSelectedIndex, child) {
              switch (currentSelectedIndex) {
                case 0:
                  return CalenderUI.builder(context);
                case 1:
                  return BookListUI.builder(context);
                case 2:
                return VideoListUI.builder(context);
              }
              return const SizedBox();
            },
          ),
          bottomNavigationBar: Selector<DashboardProvider, int>(
            selector: (context, dashboardProvider) =>
                dashboardProvider.currentSelectedIndex,
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
                  onTap: provider.onBottomNavigationBarTap,
                  backgroundColor: context.colorScheme.onBackground,
                  selectedItemColor: context.colorScheme.primary,
                  unselectedItemColor: context.colorScheme.onSurface,
                  elevation: 8,
                  items:  [
                    BottomNavigationBarItem(
                        icon: Assets.icons.icCalendar.image(height: 30,color: currentIndex ==0? context.colorScheme.primary:context.colorScheme.onSurface), label: AppStrings.calendar),
                    BottomNavigationBarItem(
                        icon:Assets.icons.icBooks.image(height: 30,color: currentIndex ==1? context.colorScheme.primary:context.colorScheme.onSurface), label: AppStrings.books),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Assets.icons.icVideos.image(height: 25,color: currentIndex ==2? context.colorScheme.primary:context.colorScheme.onSurface),
                        ),
                        label: AppStrings.videos),
                  ],
                ),
              );
            },
          )),
    );
  }
}
