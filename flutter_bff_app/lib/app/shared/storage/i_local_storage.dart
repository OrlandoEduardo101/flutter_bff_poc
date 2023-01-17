abstract class ILocalStorage {
  Future<void> delete(String key);
  Future<void> clear();
  void setBoxName(String? value);
  Future<void> put(String key, Map value);
  Future<void> update(String key, Map value);
  Future<Map> read(String key);
  Future<bool> containsKey(String key);
}