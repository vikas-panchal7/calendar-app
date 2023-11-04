import 'package:calendar_app/router/route_manger.dart';
import 'package:calendar_app/utils/configs.dart';
import 'package:calendar_app/utils/theme.dart';
part 'my_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  _init();
  _setOraintation();
  _setSystemUIOverlayStyle();
  runApp(const MyApp());
}

// init firebase,getstorage etc
void _init() {
  GetStorageService().init();
  
}

void _setOraintation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

void _setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
  ));
}
