abstract interface class ISecureStorage{
  ISecureStorage();

  Future<void> read(String key) async{}

  Future<void> write(String key, String value) async{}

  Future<void> delete(String key) async{}
}