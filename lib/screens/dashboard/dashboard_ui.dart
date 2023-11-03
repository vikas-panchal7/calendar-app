

part of 'dashboard.dart';

class DashBoardUI extends StatelessWidget {
  static const String routeName = "/dashboard";
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider<DashboardProvider>(
      create: (context) => DashboardProvider(context: context),
      builder: (context, child) {
        return const DashBoardUI();
      },
    );
  }

  const DashBoardUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
