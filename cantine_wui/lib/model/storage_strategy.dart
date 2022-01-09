abstract class StorageStrategy {
  Future<void> write(Map<String, dynamic> json);
  Future<Map<String, dynamic>> read();
}
