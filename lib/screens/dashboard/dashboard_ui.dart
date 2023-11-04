part of 'dashboard.dart';

class DashBoardUI extends StatelessWidget {
  static const String routeName = "/dashboard";

  static Widget builder(BuildContext context) {
    var demo = context.args as int;
    return ChangeNotifierProvider<DashboardProvider>(
      create: (context) {
        return DashboardProvider(context: context, demo: demo);
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
    return Scaffold(
        body: Selector<DashboardProvider, int>(
          selector: (context, dashboardProvider) => dashboardProvider.currentSelectedIndex,
          builder: (context, currentSelectedIndex, child) {
            switch (currentSelectedIndex) {
              case 0:
                return ChangeNotifierProvider(create: (context) {
                  return BookListProvider(context: context);
                }, builder: (context, child) {
                  return const BookListUI();
                });
              case 1:
                return ChangeNotifierProvider(create: (context) {
                  return CalenderProvider(context: context);
                }, builder: (context, child) {
                  return const CalenderUI();
                });
              case 2:
                return ChangeNotifierProvider(create: (context) {
                  return VideoListProvider(context: context);
                }, builder: (context, child) {
                  return const VideoListUI();
                });
            }
            return const SizedBox();
          },
        ),
        bottomNavigationBar: Selector<DashboardProvider, int>(
          selector: (context, dashboardProvider) => dashboardProvider.currentSelectedIndex,
          builder: (context, currentIndex, child) {
            return BottomNavigationBar(
              showSelectedLabels: true,
              currentIndex: currentIndex,
              onTap: provider.onBottomNavigationBarTap,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.book), label: "Books"),
                BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Calendar"),
                BottomNavigationBarItem(icon: Icon(Icons.video_camera_back_outlined), label: "Videos"),
              ],
            );
          },
        ));
  }
}
