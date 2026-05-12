abstract class StorageService {
  Future<bool> saveString(String key, String value);
  Future<String?> getString(String key);

  Future<bool> saveBool(String key, bool value);
  Future<bool?> getBool(String key);

  Future<bool> saveInt(String key, int value);
  Future<int?> getInt(String key);

  Future<bool> saveStringList(String key, List<String> value);
  Future<List<String>?> getStringList(String key);

  Future<bool> remove(String key);
  Future<bool> contains(String key);
  Future<bool> clear();

  Future<Map<String, String>?> getMap(String key);
  Future<bool> saveMap(String key, Map<String, String> value);
}
