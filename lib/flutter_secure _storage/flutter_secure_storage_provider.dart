import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodinit/flutter_secure%20_storage/ISecureStorage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final FlutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref){

  const _aOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );
  const _iOption = IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  return const FlutterSecureStorage(
    aOptions: _aOptions,
    iOptions: _iOption
  );
});



