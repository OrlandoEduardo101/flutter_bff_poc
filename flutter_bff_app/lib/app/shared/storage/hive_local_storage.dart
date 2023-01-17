import 'dart:async';
import 'package:hive_flutter/hive_flutter.dart';
import 'i_local_storage.dart';
import 'storage_errors.dart';

class HiveLocalStorage implements ILocalStorage {
  Completer<Box> completer = Completer<Box>();
  final HiveInterface _hive;
  String? boxName;
  final List<int> listByteKey;

  HiveLocalStorage(this._hive, this.listByteKey, {this.boxName});

  @override
  void setBoxName(String? value) {
    boxName = value;
    _init();
  }

  _init() async {
    await _hive.initFlutter();
    final box = await _hive.openBox(
      '$boxName',
      encryptionCipher: HiveAesCipher(listByteKey),
    );
    completer.complete(box);
  }

  @override
  Future<void> delete(String key) async {
    var box = await completer.future;
    try {
      await box.delete(key);
      return;
    } catch (e) {
      throw DeleteError(message: 'Error delete file: $e');
    }
  }

  @override
  Future<void> put(String key, Map value) async {
    var box = await completer.future;
    try {
      await box.put(key, value);
      return;
    } catch (e) {
      throw PutError(message: 'Error save file: $e');
    }
  }

  @override
  Future<Map> read(String key) async {
    var box = await completer.future;
    try {
      var response = await box.get(key);
      return response ?? {};
    } catch (e) {
      throw ReadError(message: 'Error read file: $e');
    }
  }

  @override
  Future<void> update(String key, Map value) async {
    var box = await completer.future;
    try {
      await box.put(key, value);
      return;
    } catch (e) {
      throw PutError(message: 'Error update file: $e');
    }
  }

  @override
  Future<void> clear() async {
    var box = await completer.future;
    try {
      await box.clear();
      return;
    } catch (e) {
      throw DeleteError(message: 'Error delete file: $e');
    }
  }

  @override
  Future<bool> containsKey(String key) async {
    var box = await completer.future;
    try {
      // ignore: await_only_futures
      return await box.containsKey(key);
    } catch (e) {
      throw ReadError(message: 'Error read key: $e');
    }
  }
}
