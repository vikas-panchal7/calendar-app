import 'package:get_storage/get_storage.dart';

part 'get_storage_key.dart';

class GetStorageService {
  GetStorage getStorage = GetStorage();
  final GetStorageKey _getStorageKey = GetStorageKey();
  void init() {
    GetStorage.init();
  }

  bool get userIsLogin => getStorage.read(_getStorageKey.userIsLogin) ?? false;
  set userIsLogin(bool status) =>
      getStorage.write(_getStorageKey.userIsLogin, status);
}
