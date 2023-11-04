part of 'dashboard.dart';

class DashboardProvider extends BaseProvider {
  DashboardProvider({required super.context, required this.demo});

  final int demo;

  int _currentSelectedIndex = 0;

  int get currentSelectedIndex => _currentSelectedIndex;

  void onBottomNavigationBarTap(int value) {
    _currentSelectedIndex = value;
    notifyListeners();
  }
}
