import 'package:fitmore_web/core/data/services/shared_preferace_storage_service.dart';
import 'package:fitmore_web/core/domain/service/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceLocator {
  static late final StorageService storageService;

  static Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    storageService = SharedPrefsStorageService(sharedPreferences);
  }
}
