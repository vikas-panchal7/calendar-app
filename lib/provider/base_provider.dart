import 'package:calendar_app/utils/configs.dart';

class BaseProvider extends ChangeNotifier {
  BaseProvider({required this.context});
  final BuildContext context;
  final GetStorageService getStorageService = GetStorageService();
}
