import 'package:cantine_wui/model/storage_strategy.dart';

class MemoryStorageStrategy implements StorageStrategy {
  Map<String, dynamic> _map;

  MemoryStorageStrategy(this._map);

  @override
  Future<Map<String, dynamic>> read() async => _map;

  @override
  Future<void> write(Map<String, dynamic> json) async => _map = json;
}
