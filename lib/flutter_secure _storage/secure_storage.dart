import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpodinit/flutter_secure%20_storage/flutter_secure_storage_provider.dart';

import 'ISecureStorage.dart';


final secureStoreProvide = Provider<SecureStorage>((ref){
  final secureStorage = ref.watch(FlutterSecureStorageProvider);
  return SecureStorage(secureStorage);
});


class SecureStorage implements ISecureStorage{

  final FlutterSecureStorage flutterSecureStorage;

  SecureStorage(this.flutterSecureStorage);


  @override
  Future<void> delete(String key) async {
    return flutterSecureStorage.delete(key: key);
    // TODO: implement delete
  }

  @override
  Future<void> read(String key) {
    // TODO: implement read
    throw flutterSecureStorage.read(key: key, );
  }

  @override
  Future<void> write(String key, String value) {
    // TODO: implement write
    throw flutterSecureStorage.write(key: key,value: value);
  }
}